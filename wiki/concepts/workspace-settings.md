---
type: concept
title: "Workspace Settings"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "settings"
  - "configuration"
  - "workspace"
  - "hierarchy"
related:
  - "/settings-command"
  - "settings-json"
  - "session-management"
  - "plan-mode"
  - "combined-workflows"
sources: ["6. Settings.md"]
---

# Workspace Settings

Workspace settings provide project-specific configuration overrides that take precedence over user-level settings. This enables teams to enforce consistent development environments and project-specific security policies.

## File Location

Workspace settings are stored at:

```
your-project/.gemini/settings.json
```

## Precedence Rules

Settings follow this priority order (highest to lowest):

1. **Command-line flags** — Temporary overrides passed at CLI invocation
2. **Workspace settings** — Project-level `.gemini/settings.json`
3. **User settings** — Global `~/.gemini/settings.json`
4. **Default values** — Built-in application defaults

## Use Cases

### Team Configuration Sharing

Teams can commit `.gemini/settings.json` to version control, ensuring consistent settings across collaborators:

```json
{
  "general": {
    "plan": {
      "enabled": true,
      "modelRouting": true
    }
  },
  "security": {
    "toolSandboxing": true,
    "blockGitExtensions": true
  }
}
```

### Project-Specific Sandboxing

Projects handling sensitive data can enforce sandbox restrictions:

```json
{
  "tools": {
    "sandboxAllowedPaths": ["/project/data", "/project/output"],
    "sandboxNetworkAccess": false
  }
}
```

### Plan Mode Defaults

Workspace settings can enable Plan Mode by default for read-only planning:

```json
{
  "general": {
    "plan": {
      "enabled": true,
      "directory": ".gemini/plans"
    }
  }
}
```

## Security Considerations

> [!CAUTION]
> Workspace settings can override user security preferences. When working in untrusted workspaces, verify that security settings match your expectations.

Key security-affecting settings that workspace can control:

- `security.toolSandboxing` — Tool-level isolation
- `security.enableConseca` — Context-aware security checker
- `security.blockGitExtensions` — Prevent loading extensions from Git
- `security.folderTrust.enabled` — Folder trust tracking

## Interaction with Plan Mode

The `general.plan.*` settings control Plan Mode behavior workspace-wide:

- `general.plan.enabled` — Enable Plan Mode (default: `true`)
- `general.plan.directory` — Custom planning artifacts directory
- `general.plan.modelRouting` — Auto-switch between Pro/Flash models

This enables [[combined-workflows]] patterns where workspace configuration ensures consistent behavior across team members.

## Related Concepts

- [[/settings-command]] — Managing settings via the interactive dialog
- [[settings-json]] — The underlying configuration file format
- [[plan-mode]] — Read-only planning mode controlled by these settings
- [[sandboxing]] — Sandbox configuration that can be workspace-enforced
- [[session-management]] — Session retention settings