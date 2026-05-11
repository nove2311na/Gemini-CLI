---
type: entity
title: "Gemini Extension Manifest"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extension"
  - "configuration"
  - "manifest"
related:
  - "[[gemini-cli-extensions]]"
  - "[[extension-security-best-practices]]"
  - "[[gemini-md-file]]"
sources: ["2. Build Gemini CLI extensions.md", "3. Gemini CLI extension best practices.md"]
---

# Gemini Extension Manifest

The `gemini-extension.json` file is the core manifest that defines an extension's name, tools, settings, and behavior within Gemini CLI.

## Manifest Structure

The manifest is placed in the root directory of an extension and must contain valid JSON. It defines how the CLI loads and interacts with the extension.

## Key Fields

### Core Fields

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Extension name; must match the directory name exactly |
| `excludeTools` | array | Tools to block from the extension (e.g., `run_shell_command`) |
| `settings` | array | Configuration options including sensitive values |

### Settings Configuration

The `settings` array defines user-configurable options for the extension:

```json
"settings": [
  {
    "name": "API Key",
    "envVar": "MY_API_KEY",
    "sensitive": true
  }
]
```

When `sensitive: true` is set, the value is stored in the system keychain and obfuscated in CLI output.

### Tool Exclusion

Use `excludeTools` to restrict dangerous tools that the extension should not access:

```json
{
  "name": "my-safe-extension",
  "excludeTools": ["run_shell_command(rm -rf *)"]
}
```

This prevents the model from executing harmful commands even if it attempts to do so.

## Validation Requirements

- File must be named exactly `gemini-extension.json`
- Must be placed in the root extension directory
- Must contain valid, parseable JSON
- The `name` field must match the extension directory name exactly

## Common Issues

If your extension doesn't load, verify:
1. The manifest file exists in the root directory
2. The JSON is valid (no trailing commas or syntax errors)
3. The `name` field matches the directory name exactly
4. You've restarted Gemini CLI after making changes

## Related Concepts

- [[extension-security-best-practices]] — Security patterns using manifest fields
- [[gemini-md-file]] — Companion documentation file
- [[gemini-cli-extensions]] — Overview of the extension system