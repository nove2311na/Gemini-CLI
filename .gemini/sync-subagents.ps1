param(
  [switch]$Check
)

$ErrorActionPreference = 'Stop'

# Thiết lập đường dẫn và các biến cấu hình cơ bản
$GeminiDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SubagentsDir = Join-Path $GeminiDir 'subagents'
$AgentsDir = Join-Path $GeminiDir 'agents'
$MirrorPrefix = 'mirror--'
$Utf8NoBom = [System.Text.UTF8Encoding]::new($false)

# Hàm chuẩn hóa ký tự xuống dòng sang chuẩn LF
function Convert-Lf([string]$Text) {
  if ($null -eq $Text) { return '' }
  return $Text.Replace("`r`n", "`n").Replace("`r", "`n")
}

# Hàm thụt lề cho một khối văn bản (dùng cho YAML block scalar)
function Format-Indent([string]$Text) {
  $lines = (Convert-Lf $Text) -split "`n"
  return (($lines | ForEach-Object { "  $_" }) -join "`n")
}

# Trích xuất và định dạng danh sách tools từ JSON sang YAML
function Get-YamlToolLines($Tools) {
  $toolNames = @($Tools) |
    ForEach-Object { [string]$_ } |
    Where-Object { -not [string]::IsNullOrWhiteSpace($_) }

  if ($toolNames.Count -eq 0) {
    throw 'Subagent JSON must include at least one tool in the tools array.'
  }

  $lines = @('tools:')
  $lines += $toolNames | ForEach-Object {
    $escaped = $_.Replace('\', '\\').Replace('"', '\"')
    "  - `"$escaped`""
  }
  return [PSCustomObject]@{
    Names = $toolNames
    Lines = $lines
  }
}

# Kiểm tra xem file Markdown có chứa đánh dấu 'GEMINI_AGENT_MIRROR' không
function Test-MirrorFile([string]$Path) {
  if (-not (Test-Path -LiteralPath $Path)) { return $false }
  $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $Path
  return $content -match 'GEMINI_AGENT_MIRROR'
}

# Đọc danh sách tools hiện tại từ phần Frontmatter của file Markdown
function Get-MirrorToolsFromMarkdown([string]$Path) {
  if (-not (Test-Path -LiteralPath $Path)) {
    throw "Mirror file not found: $Path"
  }

  $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $Path
  $match = [regex]::Match($content, '(?s)^---\r?\n(.*?)\r?\n---')
  if (-not $match.Success) {
    throw "Mirror file has no YAML frontmatter: $Path"
  }

  $lines = $match.Groups[1].Value -split "\r?\n"
  $tools = @()
  $inTools = $false

  foreach ($line in $lines) {
    if ($line -match '^tools:\s*$') {
      $inTools = $true
      continue
    }

    if ($inTools) {
      if ($line -match '^\s*-\s*"?([^"\r\n]+)"?\s*$') {
        $tools += $Matches[1]
        continue
      }

      if ($line -match '^\S') {
        break
      }
    }
  }

  return $tools
}

# Đảm bảo danh sách tools trong file JSON và Markdown khớp nhau hoàn toàn
function Assert-ToolParity($Agents) {
  $mismatches = @()

  foreach ($agent in $Agents) {
    $expected = @($agent.ToolNames)
    $actual = @(Get-MirrorToolsFromMarkdown $agent.TargetPath)

    if (($expected -join ',') -ne ($actual -join ',')) {
      $mismatches += [PSCustomObject]@{
        Agent = $agent.Name
        SourceJson = $agent.SourcePath
        Mirror = $agent.TargetPath
        ExpectedTools = ($expected -join ', ')
        ActualTools = ($actual -join ', ')
      }
    }
  }

  if ($mismatches.Count -gt 0) {
    Write-Host 'Tool parity check failed:'
    $mismatches | ForEach-Object {
      Write-Host "- $($_.Agent)"
      Write-Host "  source: $($_.SourceJson)"
      Write-Host "  mirror: $($_.Mirror)"
      Write-Host "  expected: $($_.ExpectedTools)"
      Write-Host "  actual: $($_.ActualTools)"
    }
    exit 1
  }

  Write-Host 'Tool parity check: OK.'
}

# Chuyển đổi dữ liệu từ file JSON subagent sang cấu trúc Markdown hoàn chỉnh
function New-AgentMarkdown($JsonFile) {
  $json = Get-Content -Raw -Encoding UTF8 -LiteralPath $JsonFile.FullName | ConvertFrom-Json
  $name = [string]$json.name
  if ([string]::IsNullOrWhiteSpace($name)) { $name = $JsonFile.BaseName }

  $description = Convert-Lf ([string]$json.description)
  $prompt = Convert-Lf ([string]$json.systemPrompt)
  $sourceRelative = ".gemini/subagents/$($JsonFile.Name)"
  $targetFileName = "$MirrorPrefix$name.md"
  $tools = Get-YamlToolLines $json.tools

  $bodyLines = @(
    '---',
    "name: $name",
    'description: >-',
    (Format-Indent $description),
    'kind: local'
  ) + $tools.Lines + @(
    '---',
    '',
    '<!-- GEMINI_AGENT_MIRROR',
    "mirror_file: .gemini/agents/$targetFileName",
    "source: $sourceRelative",
    'sync: powershell -ExecutionPolicy Bypass -File .gemini/sync-subagents.ps1',
    'do_not_edit: true',
    'edit_source_json_then_sync: true',
    'GEMINI_AGENT_MIRROR -->',
    '',
    $prompt,
    ''
  )

  $body = $bodyLines -join "`n"

  return [PSCustomObject]@{
    Name = $name
    SourcePath = $JsonFile.FullName
    TargetFileName = $targetFileName
    TargetPath = Join-Path $AgentsDir $targetFileName
    LegacyPath = Join-Path $AgentsDir "$name.md"
    ToolNames = $tools.Names
    Content = $body
  }
}

# Quét thư mục subagents và thực hiện đồng bộ hóa nội dung
if (-not (Test-Path -LiteralPath $SubagentsDir)) {
  throw "Subagents directory not found: $SubagentsDir"
}

New-Item -ItemType Directory -Force -Path $AgentsDir | Out-Null
$generated = @()
$generatedFileNames = @()
$generatedToolMap = [ordered]@{}
$generatedAgents = @()
$changed = @()
$renamed = @()

Get-ChildItem -LiteralPath $SubagentsDir -Filter '*.json' | Sort-Object Name | ForEach-Object {
  $agent = New-AgentMarkdown $_
  $generated += $agent.Name
  $generatedFileNames += $agent.TargetFileName
  $generatedToolMap[$agent.Name] = $agent.ToolNames
  $generatedAgents += $agent

  if ($agent.LegacyPath -ne $agent.TargetPath -and (Test-MirrorFile $agent.LegacyPath)) {
    $renamed += "$($agent.LegacyPath) -> $($agent.TargetPath)"
    if (-not $Check) {
      Move-Item -LiteralPath $agent.LegacyPath -Destination $agent.TargetPath -Force
    }
  }

  $existing = if (Test-Path -LiteralPath $agent.TargetPath) { Get-Content -Raw -Encoding UTF8 -LiteralPath $agent.TargetPath } else { $null }
  if ($existing -ne $agent.Content) {
    $changed += $agent.TargetPath
    if (-not $Check) {
      [System.IO.File]::WriteAllText($agent.TargetPath, $agent.Content, $Utf8NoBom)
    }
  }
}

$nativeAgents = @(
  Get-ChildItem -LiteralPath $AgentsDir -Filter '*.md' |
    Where-Object { $_.Name -notlike '_*' -and $generatedFileNames -notcontains $_.Name } |
    ForEach-Object { $_.BaseName }
)

# Tạo file manifest để theo dõi tất cả các agent (native và mirror)
$manifest = [PSCustomObject]@{
  generated_at = (Get-Date).ToString('o')
  source_dir = '.gemini/subagents'
  mirror_dir = '.gemini/agents'
  mirror_prefix = $MirrorPrefix
  generated_agents = $generated
  generated_files = $generatedFileNames
  generated_tools = $generatedToolMap
  native_agents = $nativeAgents
}
$manifestPath = Join-Path $AgentsDir '_mirror-manifest.json'
$manifestJson = $manifest | ConvertTo-Json -Depth 5
if (-not $Check) {
  [System.IO.File]::WriteAllText($manifestPath, $manifestJson + "`n", $Utf8NoBom)
}

# Xử lý kết quả dựa trên chế độ --Check (CI) hoặc Sync thực tế
if ($Check) {
  if ($renamed.Count -gt 0) {
    Write-Host 'Mirror files need rename:'
    $renamed | ForEach-Object { Write-Host "- $_" }
  }
  if ($changed.Count -gt 0) {
    Write-Host 'Out-of-sync mirror files:'
    $changed | ForEach-Object { Write-Host "- $_" }
  }
  if ($renamed.Count -gt 0 -or $changed.Count -gt 0) { exit 1 }
  Write-Host 'All subagent mirrors are in sync.'
  Assert-ToolParity $generatedAgents
  exit 0
}

Write-Host "Synced $($generated.Count) subagent mirror(s)."
if ($renamed.Count -gt 0) {
  Write-Host 'Renamed mirror files:'
  $renamed | ForEach-Object { Write-Host "- $_" }
}
if ($changed.Count -gt 0) {
  Write-Host 'Updated files:'
  $changed | ForEach-Object { Write-Host "- $_" }
} else {
  Write-Host 'No mirror content changes were needed.'
}

Assert-ToolParity $generatedAgents
