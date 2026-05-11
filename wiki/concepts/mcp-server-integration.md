---
type: concept
title: "MCP Server Integration"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "integration"
  - "architecture"
  - "gemini-cli"
related:
  - "[[mcp-server]]"
  - "[[mcp-tools]]"
  - "[[mcp-transport-mechanisms]]"
  - "[[mcp-authentication]]"
  - "[[environment-sanitization]]"
  - "[[gemini-cli]]"
sources: ["1. MCP servers with Gemini CLI.md"]
---

# MCP Server Integration

MCP server integration in [[gemini-cli]] follows a sophisticated two-layer architecture that enables discovered tools and resources to become available alongside built-in tools.

## Discovery Layer

The discovery process, orchestrated by `discoverMcpTools()` in `packages/core/src/tools/mcp-client.ts`, performs the following steps:

1. **Server Iteration**: Iterates through all servers configured in `settings.json` `mcpServers`
2. **Transport Selection**: Selects appropriate transport based on configuration (command, url, httpUrl)
3. **Connection Establishment**: Attempts connection with configured timeout
4. **Tool Listing**: Calls the MCP server's tool listing endpoint
5. **Schema Validation**: Validates each tool's function declaration
6. **Tool Filtering**: Applies `includeTools` and `excludeTools` configuration
7. **Name Sanitization**: Cleans tool names for Gemini API compatibility
8. **Registration**: Registers tools in the global tool registry with FQN namespace

## Execution Layer

Each discovered MCP tool is wrapped in a `DiscoveredMCPTool` instance that handles:

- **Confirmation Logic**: Evaluates trust settings and user preferences
- **Parameter Handling**: Validates arguments against the tool's schema
- **Tool Execution**: Calls the MCP server via `CallableTool.invoke()`
- **Response Processing**: Formats results for both LLM context and user display
- **Connection State**: Maintains connections and handles timeouts

## Fully Qualified Names

To prevent tool name collisions across multiple servers, all discovered MCP tools receive FQN format: `mcp_{serverName}_{toolName}`. The tool registry maintains metadata mappings between these FQNs and original server identities.

## Configuration Merging

When an extension provides MCP servers, users can override settings in local `settings.json`:

- **Tool lists**: Exclusions are unioned (most restrictive wins), inclusions are intersected
- **Environment variables**: Merged with local values taking precedence
- **Scalar properties**: Replaced by local values if provided

## See Also

- [[mcp-server]] — Server definition and capabilities
- [[mcp-tools]] — Tool discovery and execution details
- [[mcp-transport-mechanisms]] — Transport types and configuration
- [[environment-sanitization]] — Security and credential protection
- [[mcp-authentication]] — OAuth and GCP authentication