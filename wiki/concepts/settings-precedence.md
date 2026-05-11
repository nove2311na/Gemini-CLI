---
type: concept
title: "Settings Precedence"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "configuration"
  - "enterprise"
  - "settings"
  - "merge"
related:
  - "[[enterprise-configuration]]"
  - "[[wrapper-scripts]]"
sources: ["2. Enterprise configuration.md"]
---

# Settings Precedence

Settings precedence defines the order in which configuration files are merged when determining the final applied settings for [[gemini-cli]].

## Precedence Order

Settings are merged from four files in the following priority order (highest to lowest):

| Level | File | Purpose |
|-------|------|---------|
| 1 | **System Overrides** (`settings.json`) | Organization-wide mandatory policies |
| 2 | **Workspace Settings** (`<project>/.gemini/settings.json`) | Project-specific configuration |
| 3 | **User Settings** (`~/.gemini/settings.json`) | Individual user preferences |
| 4 | **System Defaults** (`system-defaults.json`) | Built-in default values |

## Merge Behavior

The precedence system follows two distinct merge behaviors:

### Single-Value Settings

For scalar values (strings, numbers, booleans), the higher-precedence file **completely replaces** the lower-precedence value.

### Arrays and Objects

For arrays and objects, values are **merged** rather than replaced. This means:
- Array items from multiple sources are combined
- Object properties cascade from lower to higher precedence
- Higher-precedence values override lower ones within the same object

## System Overrides

The **System Overrides** file (located in the platform-specific system directory) always wins for single-value settings. This enables organizations to enforce critical policies that users cannot override.

### Location Examples

- **Linux:** `/etc/gemini-cli/settings.json`
- **Windows:** `C:\ProgramData\gemini-cli\settings.json`
- **macOS:** `/Library/Application Support/GeminiCli/settings.json`

### Path Override

The path can be overridden using the `GEMINI_CLI_SYSTEM_SETTINGS_PATH` environment variable, though [[wrapper-scripts]] are typically used to enforce consistent paths.

## Practical Implications

Understanding precedence is critical for:
- Debugging why certain settings appear to be ignored
- Designing configuration that respects organizational constraints
- Creating project-specific overrides that don't conflict with enterprise policies

## Related Concepts

- [[enterprise-configuration]] — System-wide management overview
- [[wrapper-scripts]] — Enforcing the system settings path

---