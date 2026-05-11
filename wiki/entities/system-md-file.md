---
type: entity
title: ".gemini/system.md"
created: 2026-05-05
updated: 2026-05-05
tags: ["configuration-file", "system-prompt", "project-level", "firmware"]
related: ["gemini-system-md", "gemini-env-file", "system-prompt-override", "variable-substitution"]
sources: ["7. System prompt override.md"]
---

# .gemini/system.md

A Markdown file at `.gemini/system.md` that serves as the default path for custom system prompts in Gemini CLI projects.

## Overview

When `GEMINI_SYSTEM_MD` is set to `true` or `1`, Gemini CLI reads its system instructions from `.gemini/system.md` in the current project directory. This file completely replaces the built-in default prompt when the override is active.

## Relationship to GEMINI.md

The documentation distinguishes between two conceptual layers:

| File | Purpose | Nature |
|------|---------|--------|
| `.gemini/system.md` | Operational rules, safety, tool protocols | "Firmware" — stable, non-negotiable |
| `.gemini/GEMINI.md` | Persona, goals, methodology, project context | "Strategy" — evolves per task |

Think of `system.md` as the stable operational foundation and `GEMINI.md` as the adaptive strategic layer.

## Best Practices

- **Keep it minimal but complete**: Include necessary safety rules and tool operation instructions
- **Export before modifying**: Use `GEMINI_WRITE_SYSTEM_MD=1` to review built-in defaults first
- **Use variable substitution**: Leverage placeholders like `${AgentSkills}` and `${AvailableTools}` to avoid duplicating content
- **Version control**: Commit `.gemini/system.md` to share consistent behavior across teams

## Example Structure

```markdown
# Custom System Prompt

You are a helpful assistant with a focus on code quality.

${AgentSkills}

## Safety

${AvailableTools}

You must always verify changes before committing.

## Project Context

This project uses TypeScript and follows ESLint conventions.
```

## See Also

- [[gemini-system-md]] — The environment variable that reads this file
- [[gemini-write-system-md]] — Export defaults to this file
- [[variable-substitution]] — Placeholders for dynamic content injection
- [[gemini-env-file]] — Where `GEMINI_SYSTEM_MD=1` is typically stored