---
type: entity
title: "Settings"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "configuration"
  - "settings"
  - "gemini-cli"
related:
  - "[[notifications]]"
  - "[[settings.json]]"
sources: ["III. 13. Notifications (experimental).md"]
---

# Settings

The Settings system in Gemini CLI provides a user-facing configuration interface for customizing the CLI behavior. It consists of two configuration methods: an interactive command-based interface and a JSON configuration file.

## Configuration Methods

### Interactive Settings Command

The `/settings` command opens an interactive dialog for configuring Gemini CLI options:

1. Type `/settings` in an interactive session
2. Navigate through categories (General, Editor, etc.)
3. Toggle settings on or off

### JSON Configuration File

The `settings.json` file provides declarative configuration as an alternative to the interactive interface. This is useful for:

- Version control of configuration
- Shared team settings
- Programmatic configuration

## Key Settings

| Setting | Category | Description |
|---------|----------|-------------|
| Enable Notifications | General | Enable system notifications for session events |
| Model Selection | General | Choose default AI model |
| Confirmation Prompts | Safety | Control shell command approval behavior |

## Notification Configuration

To enable [[notifications]], either use the `/settings` command:

1. Open `/settings`
2. Navigate to **General**
3. Toggle **Enable Notifications** to **On**

Or add to `settings.json`:

```json
{
  "general": {
    "enableNotifications": true
  }
}
```

## See Also

- [[settings.json]] — JSON configuration file format
- [[notifications]] — Feature enabled through settings
- [[plan-mode]] — Planning feature with related settings