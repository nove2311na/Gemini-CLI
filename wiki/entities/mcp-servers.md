---
type: entity
title: "MCP Servers"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "integration"
  - "remote-tools"
  - "extensibility"
related:
  - "[[gemini-cli]]"
  - "[[agent-skills]]"
  - "[[subagents]]"
  - "[[remote-subagents]]"
  - "[[extensions]]"
sources: ["1. Gemini CLI documentation.md"]
---

# MCP Servers

MCP (Model Context Protocol) Servers enable [[gemini-cli]] to connect to and use remote agents and tools. This protocol provides a standardized way to extend Gemini CLI's capabilities beyond local execution.

## Overview

MCP Servers act as bridges between [[gemini-cli]] and external services, enabling:

- **Remote tool access** — Use tools hosted on remote servers
- **Extended capabilities** — Access specialized services not available locally
- **Enterprise integration** — Connect to internal tools and APIs
- **Collaboration** — Share resources across team environments

## Setup and Configuration

The official documentation provides a complete setup guide: [Set up an MCP server](https://geminicli.com/docs/cli/tutorials/mcp-setup)

This tutorial covers:
- Prerequisites for MCP server integration
- Configuration steps
- Testing your connection
- Troubleshooting common issues

## MCP Server Reference

Technical documentation for MCP Server implementation is available at: [MCP servers](https://geminicli.com/docs/tools/mcp-server)

This reference covers:
- Server registration and discovery
- Protocol specifications
- Error handling
- Security considerations

## Relationship to Other Features

### Remote Subagents

MCP Servers work closely with Remote Subagents:

- MCP provides the protocol for communication
- Remote Subagents are the agents accessed via MCP

See [Remote subagents](https://geminicli.com/docs/core/remote-agents) for details.

### Extensions vs MCP Servers

| Aspect | Extensions | MCP Servers |
|--------|------------|-------------|
| Scope | Local capability additions | Remote service integration |
| Protocol | Custom extension format | Model Context Protocol |
| Deployment | Local to Gemini CLI | Can be hosted remotely |
| Use case | Personal tools, prompts, themes | Enterprise services, APIs |

## Integration Patterns

### Automation with MCP

MCP Servers can be used in [[headless-mode]] for automated workflows:

1. Configure MCP server connections
2. Script Gemini CLI operations
3. Process results programmatically
4. Integrate with existing CI/CD pipelines

### Enterprise MCP Setup

For enterprise environments, MCP Servers provide:

- Centralized tool access
- Audit logging via [[telemetry]]
- Security through [[policy-engine]]
- Access control via [[trusted-folders]]

## Documentation Links

- [Set up an MCP server](https://geminicli.com/docs/cli/tutorials/mcp-setup)
- [MCP servers Reference](https://geminicli.com/docs/tools/mcp-server)
- [Remote subagents](https://geminicli.com/docs/core/remote-agents)
- [Headless mode](https://geminicli.com/docs/cli/headless)