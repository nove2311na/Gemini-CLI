---
type: concept
title: "Custom themes"
created: 2026-05-05
updated: 2026-05-05
tags: ["themes", "customization", "configuration", "settings-json"]
related:
  - "[[theme-system]]"
  - "[[theme-command]]"
  - "[[settings-json]]"
  - "[[theme-configuration-reference]]"
sources: ["8. Themes.md"]
---

# Custom themes

Custom themes allow users to define personalized color schemes for Gemini CLI beyond the pre-defined options. Themes are defined in `settings.json` using the `customThemes` block.

## Creating Custom Themes

Add a `customThemes` object to your user, project, or system `settings.json` file within the `ui` configuration section:

```json
{
  "ui": {
    "customThemes": {
      "MyCustomTheme": {
        "name": "MyCustomTheme",
        "type": "custom",
        "background": {
          "primary": "#181818"
        },
        "text": {
          "primary": "#f0f0f0",
          "secondary": "#a0a0a0"
        }
      }
    }
  }
}
```

## Theme Properties

| Property | Description | Required |
|----------|-------------|----------|
| `name` | Unique identifier for the theme | Yes |
| `type` | Must be `"custom"` for user-defined themes | Yes |
| `background` | Background color configuration | Recommended |
| `text` | Text color configuration | Recommended |
| `border` | Border color configuration | Optional |
| `status` | Status indicator colors | Optional |
| `ui` | Additional UI element colors | Optional |

## Configuration Objects

### text

Defines text colors for different content types:
- `primary`: Main text color
- `secondary`: Muted or supplementary text
- `link`: Hyperlink color
- `accent`: Highlighted or emphasized text
- `response`: Color for AI responses

### background

Defines background colors:
- `primary`: Main background color
- `diff.added`: Background for added lines in diffs
- `diff.removed`: Background for removed lines in diffs

### border

Defines border colors:
- `default`: Standard border color
- `focused`: Border color for focused elements

### status

Defines colors for status indicators:
- `success`: Success messages
- `warning`: Warning messages
- `error`: Error messages

### ui

Defines colors for UI elements:
- `comment`: Code comment color
- `symbol`: Symbol or icon color
- `gradient`: Gradient color stops

## Using Custom Themes

Once defined in `settings.json`, custom themes appear in the [[theme-command]] selection list alongside pre-defined themes. Select your custom theme like any other theme.

## Loading Themes from Files

Instead of defining themes inline, you can reference an external JSON theme file:

```json
{
  "ui": {
    "theme": "/path/to/your/theme.json"
  }
}
```

**Security note:** Gemini CLI only loads theme files from within your home directory for safety.

## Troubleshooting

### Cannot change theme via /theme command

If you defined a theme in `settings.json` (either `"theme"` name or file path), the `/theme` command cannot override it. Remove the `"theme"` setting to use interactive selection.

### Theme not appearing

Ensure the theme is properly nested under `ui.customThemes` in `settings.json`. Validate JSON syntax before saving.

## See Also

- [[theme-system]] — Theme system overview
- [[theme-command]] — Theme selection interface
- [[theme-configuration-reference]] — Complete schema reference
- [[settings-json]] — Configuration file documentation