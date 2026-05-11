---
type: concept
title: "CLI Options"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "cli"
  - "command-line"
  - "gemini-cli"
related:
  - "[[gemini-cli]]"
  - "[[model-aliases]]"
  - "[[approval-modes]]"
  - "[[output-formats]]"
sources: ["5. Gemini CLI cheatsheet.md"]
---

# CLI Options

CLI options are command-line flags that control Gemini CLI behavior at invocation time. These differ from [[interactive-commands]] which are only available within the REPL.

## Core Execution Options

| Option | Alias | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--debug` | `-d` | boolean | `false` | Run in debug mode with verbose logging |
| `--version` | `-v` | - | - | Show CLI version number and exit |
| `--help` | `-h` | - | - | Show help information |
| `--prompt` | `-p` | string | - | Prompt text. Forces non-interactive mode |
| `--prompt-interactive` | `-i` | string | - | Execute prompt and continue interactively |

## Model and Execution Control

| Option | Alias | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--model` | `-m` | string | `auto` | Model to use. See [[model-aliases]] |
| `--sandbox` | `-s` | boolean | `false` | Run in sandboxed environment for safer execution |
| `--skip-trust` | - | boolean | `false` | Skip folder trust check for this session |
| `--approval-mode` | - | string | `default` | Approval mode for tool execution |

## Session Management

| Option | Alias | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--resume` | `-r` | string | - | Resume a previous session. Use `latest` or index number |
| `--list-sessions` | - | boolean | - | List available sessions for current project |
| `--delete-session` | - | string | - | Delete a session by index number |

## Extension and Tool Configuration

| Option | Alias | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--extensions` | `-e` | array | - | List of extensions to use |
| `--list-extensions` | `-l` | boolean | - | List all available extensions and exit |
| `--allowed-mcp-server-names` | - | array | - | Allowed MCP server names |
| `--allowed-tools` | - | array | - | **Deprecated.** Use Policy Engine instead |

## Experimental Options

| Option | Type | Description |
|--------|------|-------------|
| `--experimental-acp` | boolean | Start in ACP (Agent Code Pilot) mode |
| `--experimental-zed-integration` | boolean | Run in Zed editor integration mode |
| `--worktree` | string | Start in a new git worktree |

## Output Configuration

| Option | Alias | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--output-format` | `-o` | string | `text` | Output format: `text`, `json`, `stream-json`. See [[output-formats]] |
| `--screen-reader` | - | boolean | - | Enable screen reader mode for accessibility |

## Workspace Configuration

| Option | Type | Description |
|--------|------|-------------|
| `--include-directories` | array | Additional directories to include in workspace |

## Usage Notes

- CLI options apply at invocation time; they differ from interactive commands which only work within the REPL
- Some options like `--yolo` are deprecated and replaced by `--approval-mode`
- Experimental options may change without notice

## See Also

- [[gemini-cli]] - Core CLI documentation
- [[interactive-commands]] - REPL-only commands
- [[approval-modes]] - Approval mode configuration
- [[model-aliases]] - Model selection shortcuts
- [[output-formats]] - Output format options