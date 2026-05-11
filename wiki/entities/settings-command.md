---
type: entity
title: "/settings command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "command"
  - "settings"
  - "configuration"
related:
  - "workspace-settings"
  - "settings-json"
  - "plan-mode"
  - "model-steering"
  - "sandboxing"
  - "session-management"
sources: ["III. 19. Gemini CLI settings (`settings` command).md", "6. Settings.md"]
---

# /settings command

The `/settings` command opens an interactive dialog for viewing and editing all Gemini CLI configuration options. It provides a user-friendly interface to the underlying `settings.json` file structure.

## Usage

```bash
/settings
```

The command presents settings organized by category (General, UI, Model, Security, etc.) with UI labels, setting keys, descriptions, and current values.

## Settings Storage

Settings are persisted to `settings.json` files at two levels:

- **User settings**: `~/.gemini/settings.json` — Applies to all projects
- **Workspace settings**: `your-project/.gemini/settings.json` — Project-specific overrides

> [!IMPORTANT]
> Workspace settings override user settings. This enables team-specific or project-specific configurations.

## Key Categories

The `/settings` dialog exposes 14 categories of configuration:

| Category | Purpose |
|----------|---------|
| General | Vim mode, approval modes, session retention, plan mode |
| Output | CLI output format (text/JSON) |
| UI | Theme, layout, accessibility, footer visibility |
| IDE | IDE integration mode |
| Billing | Overage strategy for quota exhaustion |
| Model | Model selection, context compression, loop detection |
| Agents | Browser agent security settings |
| Context | Memory discovery, file filtering, gitignore handling |
| Tools | Sandbox paths, shell behavior, ripgrep usage |
| Security | Sandboxing, YOLO mode, folder trust, CONSECA |
| Advanced | Memory configuration |
| Experimental | Voice mode, model steering, memory v2, worktrees |
| Skills | Agent skills toggle |
| HooksConfig | Hook system configuration |

## Related Commands

- `/model` — Model selection (configuration stored in `model.name`)
- `/resume` — Session resumption with context from retained sessions

## External Reference

See [Gemini CLI Settings documentation](https://geminicli.com/docs/cli/settings/) for the complete settings reference.