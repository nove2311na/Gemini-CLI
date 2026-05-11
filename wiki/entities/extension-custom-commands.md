---
type: entity
title: "Extension Custom Commands"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "custom-commands"
  - "toml"
related:
  - "[[gemini-extension-json]]"
  - "[[extension-commands]]"
  - "[[5. Extension reference]]"
sources: ["5. Extension reference.md"]
---

# Extension Custom Commands

Extensions can provide custom slash commands by placing TOML files in a `commands/` subdirectory within the extension. These commands become available to users when the extension is active.

## Command Naming

Gemini CLI determines the command name from the directory structure. The `.toml` extension is replaced by a `/` prefix for the command name:

| File Path | Command Name |
|-----------|--------------|
| `commands/deploy.toml` | `/deploy` |
| `commands/gcs/sync.toml` | `/gcs:sync` |
| `commands/aws/ec2/list.toml` | `/aws:ec2:list` |

### Namespace Delimiters

- **Colon (`:`)**: Separates directory levels within the command path
- **Dot (`.`)**: Used for conflict resolution when an extension command conflicts with a user or project command

## Conflict Resolution

Extension commands have the lowest precedence. If an extension defines a command with the same name as a user or project command, the extension command is prefixed with the extension name using a dot separator:

For example, if extension `gcp` defines `commands/deploy.toml`, and a user also has a `/deploy` command, the extension command becomes accessible as `/gcp.deploy`.

## File Structure

Custom commands use the TOML format. The structure follows the standard custom commands specification defined in the CLI documentation. Each TOML file contains metadata and prompt definitions for the command behavior.

## Integration with Extensions

Custom commands are automatically discovered when the extension loads. They take effect after restarting the CLI session. Commands defined in extensions follow the same execution model as user-defined commands but with access to the extension's context and potentially its [[extension-settings]] if the command requires configuration values.