---
type: entity
title: "Model Context Protocol (MCP)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "protocol"
  - "ai-tools"
  - "extensibility"
related:
  - "[[agent-client-protocol]]"
  - "[[acp-mode]]"
  - "[[gemini-cli]]"
  - "[[acp-file-system-proxy]]"
sources: ["2. ACP Mode.md"]
---

# Model Context Protocol (MCP)

**Model Context Protocol (MCP)** is a protocol that extends [[agent-client-protocol]] capabilities, allowing ACP clients (such as IDEs) to expose their own functionality as tools that AI models can use.

## Purpose

MCP enables a powerful two-way integration where:

- The agent can leverage IDE capabilities to perform tasks
- IDE features become available as callable tools within the agent's workflow
- Clients define custom tools specific to their functionality

## How MCP Works with ACP

The integration follows these steps:

1. **MCP Server Implementation**: The client (IDE) implements an MCP server that advertises available tools
2. **Handshake Registration**: During the ACP `initialize` handshake, the client provides connection details for its MCP server
3. **Tool Discovery**: [[gemini-cli]] connects to the MCP server and discovers what tools are available
4. **Tool Execution**: When the model decides to use a tool, Gemini CLI sends the tool call request to the MCP server

## Implementation

The MCP client logic in [[gemini-cli]] is located at `packages/core/src/tools/mcp-client.ts`.

## Security Considerations

MCP servers operate through the [[acp-file-system-proxy]], meaning file access and other sensitive operations are subject to the same security controls as the main agent. The ACP client acts as a gatekeeper, controlling what tools and resources the agent can access.

## Use Cases

- IDE features exposed to the agent (code navigation, refactoring, testing)
- Custom tools built by third-party developers
- Integration with external services and APIs
- Database queries and data manipulation tools