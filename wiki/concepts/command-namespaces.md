---
type: concept
title: "Command Namespaces"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "custom-commands"
  - "organization"
related:
  - "[[custom-commands]]"
  - "[[command-precedence]]"
sources: ["1. Custom commands.md"]
---

# Command Namespaces

Command namespacing organizes custom commands using subdirectories, with the path separator converted to a colon (`:`) in the command name. This prevents naming collisions and provides logical grouping for related commands.

## Naming Convention

The name of a command is determined by its file path relative to the commands directory:

| File Path | Command Name |
|-----------|--------------|
| `~/.gemini/commands/test.toml` | `/test` |
| `<project>/.gemini/commands/git/commit.toml` | `/git:commit` |
| `<project>/.gemini/commands/refactor/pure.toml` | `/refactor:pure` |

## Why Use Namespaces?

1. **Organization**: Group related commands together (e.g., all git-related commands under `git/`)
2. **Collision prevention**: Multiple teams or projects can have commands with the same short name
3. **Discoverability**: Namespaced commands are easier to find in `/commands list`
4. **Team conventions**: Establish team-wide patterns like `/git:`, `/docs:`, `/review:`

## Tips

After creating or modifying `.toml` command files, run `/commands reload` to pick up your changes without restarting the CLI. To see all available command files, run `/commands list`.