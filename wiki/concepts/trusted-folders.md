---
type: concept
title: "Trusted Folders"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "workspace-management"
  - "configuration"
  - "discovery-phase"
related:
  - "[[safe-mode]]"
  - "[[sandboxing]]"
  - "[[confirmation-prompts]]"
  - "[[extensions]]"
  - "[[session-management]]"
sources: ["9. Trusted folders.md"]
---

# Trusted Folders

A security control mechanism that requires explicit user approval before Gemini CLI loads project-specific configurations from a workspace folder. The feature prevents potentially malicious code from executing via custom configurations.

## Overview

Trusted Folders operates as a gatekeeper for workspace-level access. When **enabled** (disabled by default), the CLI scans the current folder during a discovery phase, identifies project-specific configurations, and presents a trust dialog before loading any custom settings.

When **disabled**, the CLI freely loads all project configurations without user approval—a convenience-first approach that sacrifices security for friction-free operation.

## Discovery Phase

The discovery phase scans five configuration categories:

| Category | Description |
|----------|-------------|
| **Commands** | Custom `.toml` command definitions adding new functionality |
| **MCP Servers** | Configured Model Context Protocol servers for extended capabilities |
| **Hooks** | System or custom hooks intercepting or modifying CLI behavior |
| **Skills** | Local agent skills providing specialized capabilities |
| **Setting overrides** | Project-specific configurations overriding global user settings |

The dialog also highlights security warnings (such as auto-approved tools and disabled sandbox) and discovery errors (such as malformed `settings.json`).

## Trust Levels

Three granular options control workspace trust:

| Trust Level | Description | Best For |
|-------------|-------------|----------|
| **Trust folder** | Grants full trust to the current folder only | Single isolated projects with granular control |
| **Trust parent folder** | Grants trust to the parent, automatically trusting all subdirectories | Repositories containing multiple safe projects |
| **Don't trust** | Marks folder as untrusted; CLI enters safe mode | Unknown or untrusted projects |

Trust decisions persist in `~/.gemini/trustedFolders.json`, so users are prompted only once per folder.

## Trust Resolution Order

Trust is determined in this priority order:

1. **IDE trust signal** (highest priority) — If using IDE integration, the CLI queries the IDE for workspace trust status
2. **Local trust file** — Falls back to `~/.gemini/trustedFolders.json` if IDE is not connected

This ordering allows IDE-integrated trust signals to take precedence over manual trust decisions.

## Configuration

Enable in user `settings.json`:

```json
{
  "security": {
    "folderTrust": {
      "enabled": true
    }
  }
}
```

Custom storage location via environment variable:

```bash
export GEMINI_CLI_TRUSTED_FOLDERS_PATH=/path/to/custom/trustedFolders.json
```

## Managing Trust Settings

- **Change current folder trust**: Run `/permissions` command to reopen the interactive dialog
- **View all trust rules**: Inspect `~/.gemini/trustedFolders.json` directly
- **Remove trust**: Manually edit `trustedFolders.json` to remove entries (the `/permissions` command only adds trust, not removes it)

## CI/CD Considerations

In automated environments where interactive prompts are not possible, the CLI throws `FatalUntrustedWorkspaceError` if the folder is untrusted. Bypass options:

- **Command-line flag**: `--skip-trust`
- **Environment variable**: `GEMINI_CLI_TRUST_WORKSPACE=true`

## Security Implications

The feature extends the wiki's security coverage by providing workspace-level trust controls that complement [[sandboxing]], which focuses on shell command isolation. Key security considerations include:

- **Convenience vs security tradeoff**: The feature is disabled by default, prioritizing ease of use
- **Parent folder inheritance**: Automatically trusting subdirectories could inadvertently trust malicious nested folders
- **No automatic revocation**: Once trusted, users must manually edit `trustedFolders.json` to remove trust