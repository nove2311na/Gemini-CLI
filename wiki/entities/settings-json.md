---
type: entity
title: "settings.json"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "settings"
  - "configuration"
  - "json"
related:
  - "/settings-command"
  - "workspace-settings"
  - "session-management"
sources: ["9. Set up an MCP server.md", "III. 10. Model routing.md", "6. Settings.md"]
---

# settings.json

The `settings.json` file is the primary configuration storage mechanism for Gemini CLI. All settings accessible through the `/settings` command are persisted to this file.

## File Locations

Settings exist at two hierarchy levels:

| Level | Path | Scope |
|-------|------|-------|
| User | `~/.gemini/settings.json` | Applies to all Gemini CLI usage |
| Workspace | `your-project/.gemini/settings.json` | Project-specific overrides |

## Hierarchy Precedence

Workspace settings take precedence over user settings. When both exist, the workspace version is used. This allows teams to enforce project-specific configurations while maintaining personal defaults.

## File Format

```json
{
  "general": {
    "defaultApprovalMode": "default",
    "vimMode": false,
    "sessionRetention": {
      "enabled": true,
      "maxAge": "30d"
    }
  },
  "security": {
    "toolSandboxing": false,
    "enableConseca": false
  },
  "experimental": {
    "memoryV2": true,
    "modelSteering": false
  }
}
```

## Editing Methods

1. **`/settings` command** — Interactive UI dialog for visual editing
2. **Direct file editing** — Manual JSON modification with proper syntax
3. **CLI flags** — Some settings (like `--yolo`) can only be set via command line

## Related Entities

- [[/settings-command]] — The interactive command for managing settings
- [[workspace-settings]] — The workspace-level configuration concept
- [[session-management]] — Session retention settings (`general.sessionRetention.*`)
- [[sandboxing]] — Sandbox configuration paths
- [[model-steering]] — Experimental model steering toggle