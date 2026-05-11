---
type: concept
title: "Theme configuration reference"
created: 2026-05-05
updated: 2026-05-05
tags: ["themes", "configuration", "reference"]
related:
  - "[[custom-themes]]"
  - "[[theme-system]]"
  - "[[settings-json]]"
sources: ["8. Themes.md"]
---

# Theme configuration reference

Complete reference for defining custom themes in `settings.json`. This page documents the schema for the `customThemes` block and file-based theme definitions.

## customThemes Schema

```json
{
  "ui": {
    "customThemes": {
      "ThemeName": {
        "name": "ThemeName",
        "type": "custom",
        "background": {
          "primary": "#181818",
          "diff.added": "#1a4d1a",
          "diff.removed": "#4d1a1a"
        },
        "text": {
          "primary": "#f0f0f0",
          "secondary": "#a0a0a0",
          "link": "#4dabf7",
          "accent": "#ffd43b",
          "response": "#69db7c"
        },
        "border": {
          "default": "#525252",
          "focused": "#4dabf7"
        },
        "status": {
          "success": "#51cf66",
          "warning": "#ffd43b",
          "error": "#ff6b6b"
        },
        "ui": {
          "comment": "#6a9955",
          "symbol": "#c586c0",
          "gradient": "#da77f2"
        }
      }
    }
  }
}
```

## Configuration Objects

### background

| Property | Type | Description |
|----------|------|-------------|
| `primary` | string (hex color) | Main background color |
| `diff.added` | string (hex color) | Background for added lines in diffs |
| `diff.removed` | string (hex color) | Background for removed lines in diffs |

### text

| Property | Type | Description |
|----------|------|-------------|
| `primary` | string (hex color) | Primary text color |
| `secondary` | string (hex color) | Secondary/muted text color |
| `link` | string (hex color) | Hyperlink text color |
| `accent` | string (hex color) | Accent/emphasis text color |
| `response` | string (hex color) | AI response text color |

### border

| Property | Type | Description |
|----------|------|-------------|
| `default` | string (hex color) | Default border color |
| `focused` | string (hex color) | Border color for focused elements |

### status

| Property | Type | Description |
|----------|------|-------------|
| `success` | string (hex color) | Success indicator color |
| `warning` | string (hex color) | Warning indicator color |
| `error` | string (hex color) | Error indicator color |

### ui

| Property | Type | Description |
|----------|------|-------------|
| `comment` | string (hex color) | Code comment highlighting |
| `symbol` | string (hex color) | Symbol/icon color |
| `gradient` | string (hex color) | Gradient color stop |

## File-Based Theme Schema

When loading themes from external files:

```json
{
  "ui": {
    "theme": "~/my-themes/mytheme.json"
  }
}
```

The referenced file must contain a valid theme definition matching the schema above.

## Required Properties

| Property | Required | Notes |
|----------|----------|-------|
| `name` | Yes | Must be unique within customThemes |
| `type` | Yes | Must be `"custom"` for user themes |
| `background` | Recommended | Fallback to defaults if omitted |
| `text` | Recommended | Fallback to defaults if omitted |

## Color Format

All colors must be specified as hex color strings:
- 6-digit: `#RRGGBB` (e.g., `#ff0000`)
- 3-digit: `#RGB` (e.g., `#f00`)

## Security Constraints

Theme files loaded via `"theme"` path setting must be located within the user's home directory. Gemini CLI will refuse to load themes from outside this boundary.

## See Also

- [[custom-themes]] — Guide to creating custom themes
- [[theme-system]] — Theme system overview
- [[settings-json]] — Configuration file documentation