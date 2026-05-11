---
type: source
title: "Trusted Folders"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "configuration"
  - "workspace-management"
related:
  - "[[sandboxing]]"
  - "[[confirmation-prompts]]"
  - "[[extensions]]"
  - "[[session-management]]"
sources: ["9. Trusted folders.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/advanced/trusted-folders"
venue: ""
---

# Trusted Folders

Trusted Folders is a security control mechanism that prevents potentially malicious code from executing via custom configurations. It requires explicit user approval before the CLI loads any project-specific configurations from a workspace folder.

## Discovery Phase

When enabled, the feature scans folders during a **discovery phase** and identifies five configuration categories:

| Category | Description |
|----------|-------------|
| **Commands** | Custom `.toml` command definitions |
| **MCP Servers** | Configured Model Context Protocol servers |
| **Hooks** | System or custom hooks intercepting CLI behavior |
| **Skills** | Local agent skills providing specialized capabilities |
| **Setting overrides** | Project-specific settings overriding global user settings |

The dialog displays security warnings and discovery errors such as malformed `settings.json`.

## Trust Levels

The three-tier trust system provides granular control:

| Level | Behavior |
|-------|----------|
| **Trust folder** | Full trust for current folder only |
| **Trust parent folder** | Trust parent directory, automatically trusting all subdirectories |
| **Don't trust** | CLI operates in restricted safe mode |

Trust decisions are persisted in `~/.gemini/trustedFolders.json` and can be managed via `/permissions` command or by directly editing the file.

## Safe Mode Restrictions

When untrusted, seven features are disabled: workspace settings, environment variables, extension management, tool auto-acceptance, automatic memory loading, MCP server connections, and custom commands.

## Trust Resolution Order

1. IDE trust signal (highest priority)
2. Local `~/.gemini/trustedFolders.json` file