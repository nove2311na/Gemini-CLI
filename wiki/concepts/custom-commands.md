---
type: concept
title: "Custom Commands"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "workflow-automation"
  - "command-shortcuts"
  - "productivity"
related:
  - "[[command-namespaces]]"
  - "[[argument-injection]]"
  - "[[shell-injection]]"
  - "[[file-injection]]"
  - "[[shell-commands]]"
  - "[[extensions]]"
  - "[[user-commands-directory]]"
  - "[[project-commands-directory]]"
sources: ["1. Custom commands.md"]
---

# Custom Commands

Custom commands let you save and reuse frequently used prompts as personal shortcuts within [[gemini-cli]]. You can create commands that are specific to a single project or commands that are available globally across all your projects, streamlining your workflow and ensuring consistency.

## Overview

The custom commands feature provides a lightweight mechanism for creating reusable prompt templates without requiring MCP server setup or other complex integrations. Commands are defined in TOML files placed in either the global user commands directory or the local project commands directory.

## File Locations

Commands are discovered from two locations, loaded in a specific order:

1. **User commands (global):** Located in `~/.gemini/commands/`. These commands are available in any project you are working on.
2. **Project commands (local):** Located in `<project>/.gemini/commands/`. These commands are specific to the current project and can be checked into version control to be shared with your team.

## Command Precedence

If a command in the project directory has the same name as a command in the user directory, the **project command will always be used**. This allows projects to override global commands with project-specific versions while maintaining global defaults.

## Quick Reference

| Feature | Syntax | Description |
|---------|--------|-------------|
| Arguments | `{{args}}` | Placeholder replaced with user-provided arguments |
| Shell injection | `!{...}` | Embeds shell command output in prompt |
| File injection | `@{...}` | Embeds file or directory content |
| Namespacing | Subdirectory with `:` | `git/commit.toml` → `/git:commit` |
| Reload | `/commands reload` | Pick up changes without restart |
| List | `/commands list` | View all available commands |

## Related Commands

- `[[commands-reload]]` — Reloads command files without CLI restart
- `[[commands-list]]` — Lists all available command files