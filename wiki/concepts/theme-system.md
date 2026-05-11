---
type: concept
title: "Theme system"
created: 2026-05-05
updated: 2026-05-05
tags: ["themes", "customization", "configuration"]
related:
  - "[[theme-command]]"
  - "[[custom-themes]]"
  - "[[settings-json]]"
  - "[[extensions]]"
sources: ["8. Themes.md"]
---

# Theme system

The theme system in Gemini CLI provides a centralized mechanism for customizing the CLI's visual appearance. It encompasses pre-defined themes, custom theme creation, file-based theme loading, and integration with the [[extensions]] ecosystem.

## Overview

Gemini CLI's theme system allows users to modify colors and appearance across multiple UI elements:

- Text colors (primary, secondary, links, accents)
- Background colors (including diff highlighting)
- Border colors (default and focused states)
- Status indicators (success, warning, error states)
- UI elements (comments, symbols, gradients)

## Theme Sources

Themes originate from multiple sources, listed in priority order:

1. **Pre-defined themes**: 20+ built-in themes (10 dark, 7 light + ANSI variations)
2. **Configuration file**: Theme specified via `"theme"` in `settings.json`
3. **File-based themes**: External JSON theme files (home directory only)
4. **Extension themes**: Themes bundled with installed extensions

## Theme Selection

The [[theme-command]] provides interactive theme selection with arrow-key navigation. Selected themes automatically persist across sessions via the configuration system.

## Security Constraints

For file-based themes, Gemini CLI enforces a security boundary: only theme files located within the user's home directory can be loaded. This prevents loading themes from untrusted locations.

## Persistence

Theme preferences are stored in Gemini CLI's configuration system and automatically restored on session startup. This ensures consistent appearance without manual reconfiguration.

## Extension Integration

The theme system integrates with [[extensions]] — when an extension provides themes, they automatically appear in the `/theme` command selection list once the extension is installed and enabled.

## See Also

- [[theme-command]] — Interactive theme selection
- [[custom-themes]] — Creating personalized themes
- [[theme-configuration-reference]] — Complete schema for custom theme definitions
- [[extensions]] — Extension-based theme contributions