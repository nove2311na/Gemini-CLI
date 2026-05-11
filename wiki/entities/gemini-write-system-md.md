---
type: entity
title: "GEMINI_WRITE_SYSTEM_MD"
created: 2026-05-05
updated: 2026-05-05
tags: ["environment-variable", "configuration", "system-prompt", "export", "advanced"]
related: ["gemini-system-md", "system-md-file", "system-prompt-override"]
sources: ["7. System prompt override.md"]
---

# GEMINI_WRITE_SYSTEM_MD

An environment variable that exports the current built-in system prompt to a Markdown file, enabling review and selective modification before overriding.

## Overview

`GEMINI_WRITE_SYSTEM_MD` is a companion utility to `GEMINI_SYSTEM_MD`. Before creating a custom system prompt, this variable exports the current default to a file so users can review required safety rules and workflow instructions.

## Usage

### Write to Project Default Path

```bash
GEMINI_WRITE_SYSTEM_MD=1 gemini
```

Creates `.gemini/system.md` with the current built-in system prompt.

### Write to Custom Path

```bash
GEMINI_WRITE_SYSTEM_MD=~/prompts/DEFAULT_SYSTEM.md gemini
```

Creates the file at the specified path with tilde expansion support.

## Recommended Workflow

1. Export the default: `GEMINI_WRITE_SYSTEM_MD=1 gemini`
2. Review the exported `.gemini/system.md`
3. Identify safety rules, tool protocols, and required behaviors
4. Selectively modify or replace sections as needed
5. Enable override: `GEMINI_SYSTEM_MD=1 gemini`

This workflow prevents accidental loss of important built-in instructions that ensure safe and reliable CLI operation.

## See Also

- [[gemini-system-md]] — The override environment variable
- [[system-md-file]] — The `.gemini/system.md` file format
- [[system-prompt-override]] — The override mechanism concept