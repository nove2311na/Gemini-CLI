---
type: entity
title: "Extension Commands"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "cli"
  - "commands"
related:
  - "[[gemini-cli-extensions]]"
  - "[[gemini-extension-json]]"
  - "[[extension-settings]]"
  - "[[extensions]]"
  - "[[5. Extension reference]]"
sources: ["5. Extension reference.md"]
---

# Extension Commands

The `gemini extensions` command group provides complete terminal-based management for Gemini CLI extensions. These commands enable installation, uninstallation, configuration, and development workflows. Note that commands like `gemini extensions install` are not supported within the CLI's interactive mode.

## Install Command

Install an extension from a GitHub repository URL or local file path:

```bash
gemini extensions install <source> [--ref <ref>] [--auto-update] [--pre-release] [--consent] [--skip-settings]
```

- `<source>`: GitHub URL or local path to the extension
- `--ref`: Specific git ref (branch, tag, or commit) to install
- `--auto-update`: Enable automatic updates for this extension
- `--pre-release`: Allow installation of pre-release versions
- `--consent`: Acknowledge security risks and skip confirmation prompt
- `--skip-settings`: Skip the configuration prompt during installation

Gemini CLI creates a copy of the extension during installation. Use `gemini extensions update` to pull changes from the source. Git is required for GitHub installations.

## Uninstall Command

Remove one or more installed extensions:

```bash
gemini extensions uninstall <name...>
```

## Disable Command

Disable an extension globally or for a specific scope. Extensions are enabled globally by default:

```bash
gemini extensions disable <name> [--scope <scope>]
```

- `--scope`: `user` or `workspace` to limit the scope of the disable

## Enable Command

Re-enable a previously disabled extension:

```bash
gemini extensions enable <name> [--scope <scope>]
```

## Update Command

Update an extension to the version specified in its `gemini-extension.json`:

```bash
gemini extensions update <name>
```

Update all installed extensions at once:

```bash
gemini extensions update --all
```

## New Command

Create a new extension directory from a built-in template:

```bash
gemini extensions new <path> [template]
```

Available templates include `mcp-server`, `context`, and `custom-commands`.

## Link Command

Create a symbolic link between a development directory and the Gemini CLI extensions directory:

```bash
gemini extensions link <path>
```

This enables immediate testing of changes without reinstallation. Changes take effect after restarting the CLI session.

## Config Command

Update an extension's settings after installation:

```bash
gemini extensions config <name> [setting] [--scope <scope>]
```

## Interactive Mode Note

All management operations, including updates to slash commands, take effect only after restarting the CLI session. Within interactive mode, use `/extensions list` to view installed extensions.