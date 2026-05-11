---
type: entity
title: "User Commands Directory"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "custom-commands"
  - "configuration"
  - "global"
related:
  - "[[custom-commands]]"
  - "[[project-commands-directory]]"
  - "[[command-precedence]]"
sources: ["1. Custom commands.md"]
---

# User Commands Directory

The user commands directory is a global storage location for custom commands that are available across all projects on a user's machine.

## Location

**Default path:** `~/.gemini/commands/`

The directory is stored in the user's home directory, making commands available regardless of which project directory the CLI is invoked from.

## Purpose

User commands serve as personal defaults that follow you across all projects. They are ideal for:
- Frequently used prompts that apply to any project
- Personal productivity shortcuts
- Commands that are too general for project-specific storage

## Command Discovery

Commands in this directory are discovered alongside project commands. See [[command-precedence]] for the priority rules when conflicts occur.

## Managing Commands

Use these built-in commands to manage your custom commands:

- `/commands list` — View all available command files
- `/commands reload` — Pick up changes without restarting the CLI

## File Structure

Commands are stored as `.toml` files with subdirectories creating [[command-namespaces]]:

```
~/.gemini/commands/
├── test.toml              # → /test
├── changelog.toml          # → /changelog
└── git/
    ├── commit.toml        # → /git:commit
    └── fix.toml           # → /git:fix
```