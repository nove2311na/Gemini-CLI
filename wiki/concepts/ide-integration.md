---
type: concept
title: "IDE Integration"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "ide"
  - "workspace-context"
  - "diffing"
related:
  - "[[gemini-cli-companion-extension]]"
  - "[[agent-client-protocol]]"
  - "[[ide-command]]"
  - "[[workspace-context]]"
  - "[[native-diffing]]"
sources: ["1. IDE Integration.md"]
---

# IDE Integration

IDE integration refers to the connection between Gemini CLI and Integrated Development Environments, enabling workspace awareness, native diffing, and seamless code review workflows. The integration provides two distinct pathways for connecting Gemini CLI to IDE environments.

## Two Integration Paths

### VS Code Companion Extension

The primary and most feature-rich integration method uses the [[gemini-cli-companion-extension]], which provides:

- Real-time workspace context (open files, cursor position, selections)
- Native diff viewer integration for reviewing AI-generated changes
- Direct command access via VS Code Command Palette
- Automatic environment detection and setup

### Agent Client Protocol (ACP)

An open, IDE-agnostic protocol that standardizes AI agent-IDE communication. ACP enables integration with JetBrains IDEs, Zed, and other ACP-compliant editors through a central registry system. See [[agent-client-protocol]] for details.

## Core Capabilities

### Workspace Context

The integration provides Gemini CLI with awareness of your development environment:

- **Active file**: The currently open file in your editor
- **Recent files**: Up to 10 most recently accessed files
- **Cursor position**: Your current location in active files
- **Text selection**: Any selected text (limited to 16KB)

### Native Diffing

When Gemini CLI suggests code modifications, they appear directly in your IDE's native diff viewer. This allows you to:

- Review changes in context with syntax highlighting
- Edit suggested changes before accepting
- Accept via IDE controls, keyboard shortcuts, or CLI prompts
- Reject and discard changes cleanly

### Command Integration

Available through the [[ide-command]]:
- `/ide enable`: Activate IDE connection
- `/ide disable`: Deactivate IDE connection
- `/ide status`: View connection status and received context
- `/ide install`: Install the companion extension

## Environment Requirements

### Supported IDEs

- **Companion Extension**: Antigravity, VS Code, VS Code forks (via Open VSX)
- **ACP**: JetBrains IDEs, Zed, other ACP-compatible editors

### Directory Matching

Gemini CLI must run in the same directory (or a subdirectory) as your open workspace. Running from a different location results in a connection error.

## Sandboxing Considerations

See [[sandboxing]] for details on special requirements in restricted environments:

- **macOS**: Requires Seatbelt profile with network access
- **Docker**: Uses `host.docker.internal` for host connection