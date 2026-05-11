---
type: entity
title: "Gemini CLI Companion Extension"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "vs-code"
  - "extension"
  - "ide-integration"
related:
  - "[[ide-integration]]"
  - "[[ide-command]]"
  - "[[workspace-context]]"
  - "[[native-diffing]]"
sources: ["1. IDE Integration.md"]
---

# Gemini CLI Companion Extension

The Gemini CLI Companion extension is the primary mechanism for integrating Gemini CLI with VS Code-compatible IDEs. It enables direct workspace context access and native diffing functionality for a seamless AI-assisted development experience.

## Features

### Workspace Context

The extension grants Gemini CLI real-time awareness of your development environment, including:

- **Recent files**: Automatically sends the 10 most recently accessed files in your workspace
- **Cursor position**: Tracks your current location in active files
- **Text selection**: Captures selected text up to a 16KB limit (longer selections are truncated)

### Native Diffing

When Gemini CLI suggests code modifications, the extension opens them directly in your IDE's native diff viewer. This allows you to review, edit, accept, or reject changes without leaving your familiar editing environment.

### VS Code Command Palette Integration

The extension registers the following commands accessible via `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows/Linux):

| Command | Description |
|---------|-------------|
| `Gemini CLI: Run` | Starts a new Gemini CLI session in the integrated terminal |
| `Gemini CLI: Accept Diff` | Accepts changes in the active diff editor |
| `Gemini CLI: Close Diff Editor` | Rejects changes and closes the diff editor |
| `Gemini CLI: View Third-Party Notices` | Displays extension licensing information |

## Installation

### Automatic Installation

When running Gemini CLI inside a supported editor, it automatically detects the environment and prompts you to connect. Answering "Yes" installs the extension and enables the connection.

### Manual CLI Installation

Use the `/ide install` command within Gemini CLI to find and install the correct extension for your IDE.

### Marketplace Installation

- **Visual Studio Code**: Install from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=google.gemini-cli-vscode-ide-companion)
- **VS Code forks**: Install from the [Open VSX Registry](https://open-vsx.org/extension/google/gemini-cli-vscode-ide-companion)

## Supported Editors

The extension works with Antigravity, Visual Studio Code, and other VS Code-compatible editors including:

- VS Code (all variants)
- VSCodium
- Cursor
- Other Open VSX-compatible editors