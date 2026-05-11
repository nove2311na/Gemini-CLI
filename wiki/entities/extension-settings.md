---
type: entity
title: "Extension Settings"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "configuration"
  - "security"
related:
  - "[[gemini-extension-json]]"
  - "[[gemini-cli-extensions]]"
  - "[[5. Extension reference]]"
sources: ["2. Build Gemini CLI extensions.md", "5. Extension reference.md"]
---

# Extension Settings

Extension settings allow extensions to request user-provided configuration values such as API keys, URLs, or other service-specific parameters. This system provides secure storage with optional keychain integration for sensitive data.

## Defining Settings

Settings are defined in the `settings` array within [[gemini-extension-json]]:

```json
{
  "name": "my-api-extension",
  "version": "1.0.0",
  "settings": [
    {
      "name": "API Key",
      "description": "Your API key for the service.",
      "envVar": "MY_API_KEY",
      "sensitive": true
    }
  ]
}
```

### Setting Fields

| Field | Description |
|-------|-------------|
| `name` | Display name shown to users during configuration |
| `description` | Clear explanation of what the setting does |
| `envVar` | Environment variable name where the value is stored |
| `sensitive` | When `true`, value is stored in system keychain and obfuscated in UI |

## Storage

Configuration values are stored in a `.env` file within the extension directory. For sensitive values where `sensitive: true` is set, the actual value is stored in the system keychain while the `.env` file contains a placeholder reference.

## Configuration Command

To update an extension's settings after installation, use:

```bash
gemini extensions config <name> [setting] [--scope <scope>]
```

The optional `[setting]` argument targets a specific setting by name. The `--scope` flag (`user` or `workspace`) determines where the configuration applies.

## Scope and Precedence

Settings can be configured at different scopes:
- **User scope**: Applied across all workspaces for a user
- **Workspace scope**: Applied only within a specific workspace

When merging configurations, workspace settings take precedence over extension-level settings. This allows workspace-specific overrides while maintaining sensible defaults.