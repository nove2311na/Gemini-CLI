---
type: source
title: "Manage Context and Memory"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "context"
  - "memory"
  - "configuration"
  - "gemini-cli"
related:
  - "[[session-management]]"
  - "[[session]]"
  - "[[gemini-md]]"
  - "[[context-hierarchy]]"
  - "[[memory-feature]]"
sources: ["3. Manage context and memory.md"]
---

# Manage Context and Memory

This tutorial covers how to control what Gemini CLI knows about you and your projects. It explains how to define project-wide rules with `GEMINI.md` files, teach the agent persistent facts through memory, and inspect the active context during a session.

## Key Topics Covered

### GEMINI.md Configuration Files

The primary mechanism for controlling agent behavior is through `GEMINI.md` files. These Markdown files containing instructions are automatically loaded into every conversation. The tutorial demonstrates how to create project-specific rules for frameworks, styling, testing, and communication tone.

### Context Hierarchy

The document introduces a three-tier hierarchical system for loading instructions:

1. **Global level:** `~/.gemini/GEMINI.md` applies to all projects
2. **Project root:** `./GEMINI.md` applies to the current repository
3. **Subdirectory:** `./src/GEMINI.md` applies to specific folders

This hierarchy enables users to set general rules globally while maintaining project-specific overrides.

### Memory Feature

The tutorial covers the `save_memory` tool which persists user-provided facts (like preferences or server IPs) across sessions. Once saved, these facts are automatically recalled without explicit invocation.

### Context Inspection and Management

Two commands are documented for managing active context:
- `/memory show` displays the concatenated raw text sent to the model from all sources
- `/memory reload` forces a refresh of context files during active sessions

## Important Limitation

The document explicitly notes that edits to `GEMINI.md` files during an active session require manual reload via `/memory reload` — the agent does not detect changes automatically.

## Best Practices

- Keep instructions focused and actionable
- Use negative constraints (what NOT to do) for effectiveness
- Periodically review and remove outdated rules

## Related Commands

- [[write-todos-tool]] — Internal tool for task planning
- [[model-steering]] — Real-time feedback for mid-turn corrections