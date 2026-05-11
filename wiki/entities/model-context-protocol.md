---
type: entity
title: "Model Context Protocol"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "protocol"
  - "specification"
related:
  - "[[mcp-server]]"
  - "[[mcp-tools]]"
  - "[[mcp-resources]]"
  - "[[mcp-server-integration]]"
sources: ["1. MCP servers with Gemini CLI.md"]
---

# Model Context Protocol

The Model Context Protocol (MCP) is an open specification that enables language models to interact with external tools and data sources in a standardized way. MCP serves as the foundation for the extensibility architecture in [[gemini-cli]], allowing MCP servers to expose tools, resources, and prompts to the CLI.

## Purpose

MCP provides a standardized protocol for:

- **Tool Discovery**: Servers expose available tools with descriptions and parameter schemas
- **Resource Access**: Servers provide access to contextual data through resource URIs
- **Prompt Templates**: Servers can define reusable prompts that become slash commands

## Protocol Components

The protocol defines how clients (like [[gemini-cli]]) communicate with servers:

- **Transport Layer**: Communication via Stdio, SSE, or Streamable HTTP
- **Schema Definitions**: JSON Schema for tool parameters and responses
- **Message Format**: Standardized request and response structures
- **Authentication**: OAuth 2.0 and credential-based auth support

## Tool Schema Validation

MCP tools are defined with JSON Schema parameters that undergo sanitization for Gemini API compatibility:

- `$schema` properties are removed
- `additionalProperties` are stripped
- `anyOf` with `default` have their default values removed for Vertex AI compatibility
- Recursive processing applies to nested schemas

## See Also

- [[mcp-server]] — Server implementations exposing MCP
- [[mcp-tools]] — Tool discovery and execution
- [[mcp-resources]] — Resource access via `@server://` syntax
- [[mcp-server-integration]] — Integration architecture in Gemini CLI