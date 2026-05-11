---
type: entity
title: "Visual Studio Code (VS Code)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "ide"
  - "editor"
  - "vs-code"
  - "ide-integration"
related:
  - "[[gemini-cli-companion-extension]]"
  - "[[ide-integration]]"
  - "[[open-vsx-registry]]"
sources: ["1. IDE Integration.md"]
---

# Visual Studio Code (VS Code)

Visual Studio Code is a lightweight but powerful source code editor developed by Microsoft. It serves as the primary IDE for Gemini CLI integration via the Gemini CLI Companion extension and is supported by the Agent Client Protocol ecosystem.

## Gemini CLI Integration

VS Code provides the most comprehensive Gemini CLI integration through two mechanisms:

1. **Gemini CLI Companion extension**: Provides workspace context and native diffing
2. **ACP compatibility**: Gemini CLI is discoverable through ACP-compatible registries

## Key Capabilities

| Feature | Description |
|---------|-------------|
| Integrated terminal | Run Gemini CLI sessions directly within the editor |
| Native diff viewer | Review AI-generated changes in familiar interface |
| Command Palette | Access Gemini CLI commands via `Cmd+Shift+P` / `Ctrl+Shift+P` |
| Workspace awareness | Share open files and cursor position with Gemini CLI |

## Distribution

The Gemini CLI Companion extension is published on both the official VS Code Marketplace and the Open VSX Registry, ensuring availability for both commercial VS Code and open-source forks.