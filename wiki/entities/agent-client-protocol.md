---
type: entity
title: "Agent Client Protocol (ACP)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "protocol"
  - "ide-integration"
  - "json-rpc"
  - "standard"
related:
  - "[[acp-mode]]"
  - "[[gemini-cli]]"
  - "[[mcp-model-context-protocol]]"
  - "[[acp-agent-registry]]"
  - "[[json-rpc-2-0]]"
  - "[[zed]]"
  - "[[jetbrains]]"
sources: ["2. ACP Mode.md"]
---

# Agent Client Protocol (ACP)

**Agent Client Protocol (ACP)** is an open protocol that standardizes how AI coding agents communicate with code editors and IDEs. It addresses the challenge of fragmented distribution, where agents traditionally required custom integrations for each client.

## Overview

ACP enables developers to implement an agent once, making it compatible with any ACP-compliant editor. This standardization benefits the entire ecosystem by reducing integration work and increasing interoperability.

Key characteristics:

- **Open standard**: Freely available for any tool to implement
- **JSON-RPC 2.0 transport**: Uses structured communication over stdio
- **Bidirectional tooling**: Supports MCP extensions for IDE-to-agent tool exposure

## Architecture

ACP operates as a client-server protocol where:

- The **agent** (such as [[gemini-cli]]) acts as the server
- The **IDE or tool** acts as the client, sending requests and handling responses

Communication happens entirely over standard input/output using [[json-rpc-2-0]] messages.

## Relationship to MCP

ACP can be extended with [[mcp-model-context-protocol]]. During the ACP `initialize` handshake, a client can register its MCP server details, allowing the agent to use IDE features as tools. See [[acp-mode]] for implementation details.

## ACP Agent Registry

The [[acp-agent-registry]] is a directory of ACP-compatible agents. [[gemini-cli]] is listed as an ACP-compatible agent and can be discovered by IDEs through this registry.

## Compatible Editors

ACP has been implemented or integrated with several popular IDEs:

- [[jetbrains]] (IntelliJ IDEA, PyCharm, WebStorm, etc.)
- [[zed]] ( Zed editor)

## External Resources

- [Official ACP Introduction](https://agentclientprotocol.com/get-started/introduction)
- [ACP Agent Registry](https://agentclientprotocol.com/get-started/registry)