---
type: concept
title: "Agent Client Protocol (ACP)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "protocol"
  - "ide-integration"
  - "standards"
  - "open-source"
related:
  - "[[acp-agent-registry]]"
  - "[[ide-integration]]"
  - "[[zed-editor]]"
  - "[[jetbrains-ides]]"
sources: ["1. IDE Integration.md"]
---

# Agent Client Protocol (ACP)

The Agent Client Protocol is an open protocol that standardizes how AI coding agents communicate with code editors and Integrated Development Environments (IDEs). ACP addresses the challenge of fragmented distribution, where AI agents traditionally required custom integrations for each client.

## Overview

Before ACP, AI agent developers had to build and maintain separate integrations for each IDE:

- VS Code extension
- JetBrains plugin
- Vim/Neovim plugin
- Emacs package
- etc.

This fragmentation increased development burden and slowed adoption. ACP solves this by defining a standard interface that any ACP-compliant IDE can understand.

## Architecture

ACP establishes a unified communication layer between:

- **AI Agents**: Tools like Gemini CLI that provide coding assistance
- **IDE Integration Layer**: Built into ACP-compliant editors
- **ACP Agent Registry**: Central discovery and distribution mechanism

When an agent implements ACP, it becomes compatible with all ACP-compliant editors without additional development work.

## Key Benefits

| Benefit | Description |
|---------|-------------|
| **Single implementation** | Agent developers implement ACP once |
| **Universal compatibility** | Works with any ACP-compliant IDE |
| **Centralized discovery** | Agents are discoverable via ACP Agent Registry |
| **Simplified distribution** | No per-IDE package management |
| **Automatic updates** | Registry ensures latest versions |

## ACP Agent Registry

The [[acp-agent-registry]] provides the distribution mechanism for ACP-compatible agents. Gemini CLI is officially listed in this registry.

## IDE Support

### Native ACP Support

These IDEs have built-in ACP registry integration:

- **JetBrains IDEs**: IntelliJ IDEA, PyCharm, GoLand, and more
- **Zed**: Modern code editor with ACP integration

### Extension-Based ACP

Other IDEs may support ACP through extensions or plugins. Refer to individual IDE documentation for ACP compatibility.

## Further Reading

For a comprehensive introduction to ACP architecture and implementation, see the official [ACP Introduction documentation](https://agentclientprotocol.com/get-started/introduction).