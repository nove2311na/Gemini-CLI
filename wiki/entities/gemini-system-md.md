---
type: entity
title: "GEMINI_SYSTEM_MD"
created: 2026-05-05
updated: 2026-05-05
tags: ["environment-variable", "configuration", "system-prompt", "advanced"]
related: ["gemini-write-system-md", "system-md-file", "gemini-env-file", "system-prompt-override", "variable-substitution"]
sources: ["7. System prompt override.md"]
---

# GEMINI_SYSTEM_MD

An environment variable that instructs Gemini CLI to use an external Markdown file as its system prompt, completely replacing the built-in default.

## Overview

When set, `GEMINI_SYSTEM_MD` directs Gemini CLI to read system instructions from a user-specified file instead of using its internal defaults. This enables project-specific behavior enforcement, custom personas, and specialized workflow configurations.

## Configuration Modes

### Enable with Project Default Path

```bash
GEMINI_SYSTEM_MD=true
# or
GEMINI_SYSTEM_MD=1
```

Reads `.gemini/system.md` relative to the current project directory.

### Enable with Custom Path

```bash
GEMINI_SYSTEM_MD=/path/to/my-system.md
```

Supports absolute paths, relative paths (resolved from current working directory), and tilde expansion (`~/prompts/system.md`).

### Disable Override

```bash
GEMINI_SYSTEM_MD=false
# or
GEMINI_SYSTEM_MD=0
# or unset the variable entirely
unset GEMINI_SYSTEM_MD
```

Restores the built-in default system prompt.

## Usage Examples

### One-off Session

```bash
GEMINI_SYSTEM_MD=1 gemini
```

### Persistent Project Configuration

Create `.gemini/system.md` and add to `.gemini/.env`:
```
GEMINI_SYSTEM_MD=1
```

### Home Directory Custom File

```bash
GEMINI_SYSTEM_MD=~/prompts/system.md gemini
```

## UI Indicator

When active, the CLI displays `|⌐■_■|` in the UI to indicate custom system-prompt mode is enabled.

## Error Handling

If the override is enabled but the target file does not exist, the CLI errors with:
```
missing system prompt file '<path>'
```

## See Also

- [[gemini-write-system-md]] — Export default prompts before overriding
- [[system-prompt-override]] — The override mechanism concept
- [[variable-substitution]] — Dynamic content injection into custom prompts
- [[gemini-env-file]] — Persistent environment variable storage