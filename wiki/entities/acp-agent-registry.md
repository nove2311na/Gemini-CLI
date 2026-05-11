---
type: entity
title: "ACP Agent Registry"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "registry"
  - "discovery"
  - "ide-integration"
related:
  - "[[agent-client-protocol]]"
  - "[[gemini-cli]]"
  - "[[zed]]"
  - "[[jetbrains]]"
sources: ["2. ACP Mode.md"]
---

# ACP Agent Registry

The **ACP Agent Registry** is a directory service that simplifies the distribution and discovery of ACP-compatible agents across various IDEs and tools.

## Purpose

The registry serves as a central listing where:

- **Agents** (like [[gemini-cli]]) register as ACP-compatible
- **IDEs** (like [[zed]] and [[jetbrains]]) can discover available agents
- **Users** can find integration options for their preferred tools

## Benefits

- **Simplified discovery**: Users find compatible agents in one place
- **Standardized integration**: Agents work across any ACP-compliant editor
- **Reduced fragmentation**: One implementation works everywhere

## Gemini CLI in the Registry

[[gemini-cli]] is listed as an ACP-compatible agent in the registry, enabling IDE integrations through the [[agent-client-protocol]].

## External Resources

- [Official ACP Agent Registry](https://agentclientprotocol.com/get-started/registry)
- [IDE Integration Documentation](https://geminicli.com/docs/ide-integration)