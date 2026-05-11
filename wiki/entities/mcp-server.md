---
type: entity
title: "MCP Server"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "integration"
  - "extensibility"
related:
  - "[[model-context-protocol]]"
  - "[[mcp-server-integration]]"
  - "[[mcp-tools]]"
  - "[[mcp-transport-mechanisms]]"
  - "[[mcp-resources]]"
  - "[[mcp-authentication]]"
  - "[[gemini-cli-extensions]]"
sources: ["1. MCP servers with Gemini CLI.md"]
---

# MCP Server

An MCP server is an application that exposes tools and resources to [[gemini-cli]] through the [[model-context-protocol]], acting as a bridge between the Gemini model and external systems. MCP servers enable Gemini CLI to discover tools, execute operations, and access resources exposed by the server.

## Overview

MCP servers extend [[gemini-cli]] capabilities beyond built-in features by providing access to:

- **Tool Discovery**: List available tools, their descriptions, and parameters through standardized schema definitions
- **Tool Execution**: Call specific tools with defined arguments and receive structured responses
- **Resource Access**: Read data from specific resources exposed by the server (files, API payloads, reports)

## Discovery and Execution

The discovery process is orchestrated by `discoverMcpTools()` in `packages/core/src/tools/mcp-client.ts`, which iterates through configured servers from `settings.json`, establishes transport connections, fetches tool definitions, sanitizes schemas, and registers tools in the global registry.

Each discovered tool is wrapped in a `DiscoveredMCPTool` instance that handles confirmation logic, manages execution, processes responses, and maintains connection state.

## Configuration

MCP servers are configured in the `mcpServers` object of `settings.json`:

```json
{
  "mcpServers": {
    "serverName": {
      "command": "path/to/server",
      "args": ["--arg1", "value1"],
      "env": {
        "API_KEY": "$MY_API_TOKEN"
      },
      "cwd": "./server-directory",
      "timeout": 30000,
      "trust": false
    }
  }
}
```

## Security Model

[[gemini-cli]] performs automatic environment sanitization when spawning MCP server processes. Sensitive environment variables (API keys, tokens, passwords, certificates) are redacted from the base environment by default. Users must explicitly configure variables in the `env` property to share them with specific servers.

## Tool Naming

All discovered MCP tools receive a fully qualified name (FQN) using the format `mcp_{serverName}_{toolName}` to prevent collisions across multiple servers. Tool names are sanitized to meet Gemini API requirements, replacing invalid characters with underscores.

## See Also

- [[mcp-server-integration]] — Core integration architecture
- [[mcp-tools]] — Tool discovery and execution details
- [[mcp-transport-mechanisms]] — Transport types and configuration
- [[mcp-resources]] — Resource discovery and usage
- [[mcp-authentication]] — OAuth and GCP authentication
- [[mcp-prompts]] — Predefined prompts as slash commands