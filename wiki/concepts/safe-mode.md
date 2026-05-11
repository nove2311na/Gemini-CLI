---
type: concept
title: "Safe Mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "restricted-operation"
  - "workspace-management"
related:
  - "[[trusted-folders]]"
  - "[[sandboxing]]"
  - "[[confirmation-prompts]]"
sources: ["9. Trusted folders.md"]
---

# Safe Mode

The restricted operating state that Gemini CLI enters when a workspace folder is marked as untrusted. Safe mode disables seven features to protect the system from potentially malicious project-specific configurations.

## Overview

Safe mode is the default security posture when Trusted Folders are enabled and the user has not granted trust to the current workspace. It provides a baseline of protection by preventing loading and execution of project-specific customizations that could pose security risks.

## Disabled Features

When operating in safe mode, the following seven features are disabled:

| Feature | Normal Behavior | Safe Mode Behavior |
|---------|-----------------|-------------------|
| **Workspace settings** | `.gemini/settings.json` loaded | Settings ignored |
| **Environment variables** | `.env` files loaded | Environment variables ignored |
| **Extension management** | Can install/update/uninstall extensions | Restricted from modifying extensions |
| **Tool auto-acceptance** | Pre-approved tools execute without prompting | Always prompts before tool execution |
| **Automatic memory loading** | Files auto-loaded into context | Auto-loading disabled |
| **MCP server connections** | Connected servers provide extended capabilities | No connections established |
| **Custom commands** | `.toml` command files loaded and available | Commands ignored |

## Security Rationale

Each disabled feature represents a potential attack vector when loading configurations from untrusted sources:

- **Workspace settings** could override security preferences
- **Environment variables** could inject malicious configuration
- **Extension management** could enable malicious extensions
- **Tool auto-acceptance** could allow harmful operations without user confirmation
- **Automatic memory loading** could expose sensitive files to the model
- **MCP servers** could establish connections to untrusted external services
- **Custom commands** could define harmful `.toml` commands

## Comparison with Sandboxing

Safe mode and [[sandboxing]] are complementary security mechanisms:

| Aspect | Safe Mode | Sandboxing |
|--------|-----------|------------|
| **Scope** | Workspace-level trust and configuration loading | Shell command execution isolation |
| **Focus** | Prevents loading of untrusted configurations | Prevents damage from shell command execution |
| **Trigger** | Untrusted workspace folder | Shell commands executed in sandbox mode |
| **Enforcement** | Configuration scanning and loading control | Docker container isolation |

Safe mode addresses the configuration loading threat, while sandboxing addresses the shell execution threat.

## Exiting Safe Mode

Grant trust to the current folder by running `/permissions` command and selecting "Trust folder" or "Trust parent folder". Once trusted, all seven features become available again.

## CI/CD Considerations

In CI/CD pipelines, the CLI throws `FatalUntrustedWorkspaceError` when attempting to run in an untrusted workspace. Use `--skip-trust` flag or `GEMINI_CLI_TRUST_WORKSPACE=true` environment variable to bypass safe mode restrictions in automated environments where interactive trust dialogs are not possible.