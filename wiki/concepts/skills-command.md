---
type: concept
title: "Skills Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "agent-skills"
  - "commands"
related:
  - "[[agent-skills]]"
  - "[[skills-command]]"
  - "[[skill-scoping]]"
sources: ["1. Agent Skills.md"]
---

# Skills Command

The skills command interfaces provide two ways to manage [[agent-skills]] in [[gemini-cli]]: interactive session commands and terminal utilities.

## Interactive Session Commands

Use the `/skills` slash command within an interactive session to view and manage available expertise.

### Command Reference

| Command | Description |
|---------|-------------|
| `/skills list [all] [nodesc]` | Shows discovered skills. Use `all` to include built-in skills and `nodesc` to hide descriptions |
| `/skills link <path> [--scope user|workspace]` | Links skills from a local directory |
| `/skills disable <name>` | Prevents a specific skill from being used |
| `/skills enable <name>` | Re-enables a disabled skill |
| `/skills reload` or `/skills refresh` | Refreshes the list of discovered skills from all tiers |

## Terminal Utilities

The `gemini skills` command provides management utilities for use outside of interactive sessions.

### Core Commands

```bash
# List all discovered skills. Use --all to include built-in skills.
gemini skills list --all

# Install a skill from a Git repository or local directory.
gemini skills install https://github.com/user/repo.git

# Uninstall a skill.
gemini skills uninstall my-skill --scope workspace
```

### Command Options

| Option | Description |
|--------|-------------|
| `--scope user\|workspace` | Determines skill visibility: `user` is global (default), `workspace` is local to the project |
| `--path <directory>` | Specifies the sub-directory within a Git repository containing the skill |
| `--consent` | Acknowledges security risks and skips the interactive confirmation during installation |

## Common Workflows

### Installing a Skill from Git

```bash
gemini skills install https://github.com/user/repo.git --scope workspace
```

### Installing with Security Acknowledgment

```bash
gemini skills install https://github.com/user/repo.git --consent
```

### Linking Local Skills for Development

```bash
# Link from interactive session
/skills link /path/to/local/skill --scope workspace

# Refresh after making changes
/skills reload
```

### Managing Skill Visibility

```bash
# Disable a skill temporarily
/skills disable my-skill

# Re-enable when needed
/skills enable my-skill
```

## Integration with Discovery

The `/skills reload` command is particularly useful when:
- Manually adding skill directories to discovery locations
- Testing newly created skills
- Changes to existing skills not being reflected