---
type: entity
title: "JetBrains IDEs"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "ide"
  - "jetbrains"
  - "acp"
  - "ide-integration"
related:
  - "[[agent-client-protocol]]"
  - "[[acp-agent-registry]]"
  - "[[ide-integration]]"
  - "[[zed-editor]]"
sources: ["1. IDE Integration.md"]
---

# JetBrains IDEs

JetBrains IDEs (including IntelliJ IDEA, PyCharm, GoLand, WebStorm, and other products in the JetBrains ecosystem) provide built-in support for the Agent Client Protocol (ACP) and ACP Agent Registry, enabling native integration with AI coding agents like Gemini CLI.

## ACP Integration

JetBrains IDEs offer built-in registry support that allows users to discover and install ACP-compatible agents directly within the IDE:

- **Integrated registry**: Browse available agents from within IDE settings
- **One-click installation**: Install and configure agents without external downloads
- **Automatic updates**: Registry ensures access to the latest agent versions

## Supported IDEs

The ACP Agent Registry integration is available across the JetBrains IDE family:

- IntelliJ IDEA (Ultimate and Community)
- PyCharm (Professional and Community)
- GoLand
- WebStorm
- Android Studio
- Other JetBrains products

## Gemini CLI Availability

Gemini CLI is officially listed in the ACP Agent Registry, making it directly discoverable and installable from within any JetBrains IDE that supports ACP.

## Further Reading

For technical details on JetBrains' ACP implementation, see the official [JetBrains AI Blog announcement](https://blog.jetbrains.com/ai/2026/01/acp-agent-registry/).