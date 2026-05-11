---
type: entity
title: "/theme command"
created: 2026-05-05
updated: 2026-05-05
tags: ["command", "themes", "configuration"]
related:
  - "[[theme-system]]"
  - "[[custom-themes]]"
  - "[[session]]"
sources: ["8. Themes.md"]
---

# /theme command

The `/theme` command provides the primary interface for changing Gemini CLI's visual appearance. It opens a selection dialog where users can browse and choose from available themes using arrow keys.

## Usage

```
/theme
```

## Behavior

1. Invoking `/theme` displays a selection prompt listing all available themes
2. Users navigate using arrow keys
3. Confirmation applies the selected theme immediately
4. The selected theme is automatically saved and persists across sessions

## Available Themes

### Dark Themes

- ANSI, Atom One, Ayu, Default, Dracula, GitHub, Holiday, Shades Of Purple, Solarized Dark, Tokyo Night

### Light Themes

- ANSI Light, Ayu Light, Default Light, GitHub Light, Google Code, Solarized Light, Xcode

### Additional Sources

Themes are also sourced from:
- [[custom-themes|Custom themes]] defined in `settings.json`
- [[extensions]] that provide theme packages

## Configuration Conflict

**Important:** If a theme is defined in your `settings.json` file (either by name via `"theme"` or by file path), the `/theme` command cannot change the theme. The configuration file setting takes precedence.

To change themes when `settings.json` has a theme defined:
1. Remove the `"theme"` entry from `settings.json`
2. Restart or re-enter the session
3. Use `/theme` to select a new theme

This conflict exists to ensure programmatically configured themes remain stable.

## See Also

- [[theme-system]] — Overview of the Gemini CLI theme system
- [[custom-themes]] — Creating personalized themes via configuration
- [[extensions]] — How extensions provide themes