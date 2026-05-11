---
type: concept
title: "Command Precedence"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "custom-commands"
  - "priority"
related:
  - "[[custom-commands]]"
  - "[[user-commands-directory]]"
  - "[[project-commands-directory]]"
sources: ["1. Custom commands.md"]
---

# Command Precedence

Command precedence defines the priority order when multiple command definitions exist with the same name. This system enables project-specific customization while maintaining global defaults.

## Precedence Rules

| Priority | Source | Location |
|----------|--------|----------|
| **1 (highest)** | Project commands | `<project>/.gemini/commands/` |
| **2 (lowest)** | User commands | `~/.gemini/commands/` |

## How It Works

When you invoke a command, Gemini CLI searches for it in this order:

1. First, check the project commands directory
2. If found, use the project command
3. If not found, check the user commands directory
4. If found, use the user command
5. If neither exists, report command not found

## Practical Applications

### Team Customization
Teams can override global commands with project-specific versions. For example, a team might have:
- Global: `~/.gemini/commands/lint.toml` — Generic linting instructions
- Project: `<project>/.gemini/commands/lint.toml` — Project-specific linting rules

### Version Control
Project commands in `.gemini/commands/` can be committed to version control, ensuring all team members use consistent commands.

### Personal Defaults
User commands serve as personal defaults that work across all projects unless intentionally overridden.