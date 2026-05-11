---
type: entity
title: "Zed Editor"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "ide"
  - "editor"
  - "acp"
  - "ide-integration"
related:
  - "[[agent-client-protocol]]"
  - "[[acp-agent-registry]]"
  - "[[ide-integration]]"
  - "[[jetbrains-ides]]"
sources: ["1. IDE Integration.md"]
---

# Zed Editor

Zed is a modern, high-performance code editor designed for speed and collaboration. It integrates with the Agent Client Protocol (ACP) and ACP Agent Registry to provide native support for AI coding agents including Gemini CLI.

## ACP Integration

Unlike VS Code, Zed does not use the Gemini CLI Companion extension. Instead, it leverages the open ACP standard to connect with AI agents:

- **ACP Agent Registry**: Zed users can browse and install ACP-compatible agents directly from within the editor's settings
- **Standardized communication**: ACP provides a consistent interface for agent-IDE interaction without requiring custom extensions

## Gemini CLI Availability

Gemini CLI is available as an ACP-compatible agent in the ACP Agent Registry. Zed users can discover, install, and manage Gemini CLI directly through their editor's built-in agent management features.

## Further Reading

For more details on Zed's ACP integration, see the official [Zed blog post on ACP Registry](https://zed.dev/blog/acp-registry).