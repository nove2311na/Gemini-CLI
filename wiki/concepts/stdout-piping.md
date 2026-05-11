---
type: concept
title: "stdout Piping"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "piping"
  - "stdin"
  - "stdout"
  - "shell"
  - "automation"
  - "unix"
related:
  - "[[headless-mode]]"
  - "[[gemini-cli]]"
  - "[[json-output-format]]"
sources: ["10. Automate tasks with headless mode.md"]
---

# stdout Piping

stdout piping is the mechanism that enables [[gemini-cli]] to integrate with other command-line tools and shell workflows. Because Gemini CLI prints responses to standard output (stdout), output can be captured, saved, or piped to other tools.

## Overview

The Unix pipe operator (`|`) connects the stdout of one command to the stdin of another. When combined with [[headless-mode]], this enables powerful automation patterns where Gemini CLI becomes part of a tool chain.

## Input Piping (stdin)

Gemini CLI reads from stdin when data is piped into it. This allows feeding file contents or command output as context for the AI.

### Examples

**Pipe file contents:**

```bash
# macOS/Linux
cat error.log | gemini -p "Explain why this failed"

# Windows PowerShell
Get-Content error.log | gemini -p "Explain why this failed"
```

**Pipe command output:**

```bash
git diff | gemini -p "Write a commit message for these changes"
```

## Output Handling (stdout)

Responses printed to stdout can be:

### Save to File

```bash
gemini -p "Generate documentation for @script.py" > README.md
```

### Chain with Other Tools

```bash
gemini -p "Summarize this log" | grep -i error | head -20
```

### Parse Structured Data

```bash
gemini --output-format json "Extract data from @config.json" | jq -r '.response'
```

## File Reference Syntax

When piping input, files can be referenced in prompts using the `@filename` syntax. This attaches the file contents to the prompt for context:

```bash
cat package.json | gemini -p "Analyze the dependencies in @package.json"
```

## Platform Considerations

The piping mechanism works across platforms, but command syntax varies:

- **macOS/Linux**: Uses standard Unix tools (`cat`, `grep`, `jq`)
- **Windows**: Uses PowerShell cmdlets (`Get-Content`, `Where-Object`, `ConvertFrom-Json`)

## Significance for Automation

stdout piping transforms Gemini CLI from an interactive tool into a flexible component that can be assembled into larger automated workflows. This enables:

- Batch processing of multiple files
- Integration with existing shell scripts
- Tool chaining with standard Unix utilities
- Programmatic access to AI capabilities

## See Also

- [[headless-mode]] for the execution context
- [[json-output-format]] for structured output parsing
- [[gcommit]] for a practical example of piping in action