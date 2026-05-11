---
type: concept
title: "MCP Tools"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "tools"
  - "gemini-cli"
related:
  - "[[mcp-server]]"
  - "[[mcp-server-integration]]"
  - "[[model-context-protocol]]"
  - "[[environment-sanitization]]"
sources: ["1. MCP servers with Gemini CLI.md"]
---

# MCP Tools

MCP tools are functions exposed by [[mcp-server]] instances that [[gemini-cli]] can discover, call, and use to interact with external systems. Unlike built-in tools, MCP tools are dynamically discovered at startup and follow the [[model-context-protocol]] specification.

## Tool Discovery

When discovery runs, [[gemini-cli]] fetches each server's tool list and:

1. Validates function declarations against JSON Schema
2. Filters tools based on `includeTools` and `excludeTools` configuration
3. Sanitizes tool names for Gemini API compatibility
4. Assigns fully qualified names to prevent collisions
5. Registers tools in the global tool registry

## Fully Qualified Names

All MCP tools receive names in the format `mcp_{serverName}_{toolName}` to prevent collisions. Name sanitization replaces invalid characters (anything except letters, numbers, underscore, hyphen, dot, colon) with underscores. Names over 63 characters are truncated with middle replacement.

## Tool Filtering

Configuration options control which tools are available:

- **`includeTools`**: Allowlist of tool names (only listed tools are available)
- **`excludeTools`**: Blocklist of tool names (listed tools are excluded)
- **`excludeTools` takes precedence** over `includeTools`

## Execution Flow

When the model decides to use an MCP tool:

1. **Tool Invocation**: Model generates a FunctionCall with tool name and arguments
2. **Confirmation**: System checks trust settings; if untrusted, prompts user
3. **Parameter Preparation**: Arguments are validated against schema
4. **MCP Call**: Server is invoked with original tool name and parameters
5. **Response Processing**: Results are formatted for LLM context and user display

## Rich Content Support

MCP tools can return rich, multi-part content including text, images, audio, and binary data. The `content` field should be an array of `ContentBlock` objects (text, image, audio, resource, resource_link).

## Confirmation Behavior

- **`trust: true`**: All confirmations bypassed for this server
- **Server-level allowlist**: All tools from a server are trusted
- **Tool-level allowlist**: A specific tool is trusted
- **User choices**: Proceed once, always allow tool, always allow server, or cancel

## See Also

- [[mcp-server]] — Server definitions and capabilities
- [[mcp-server-integration]] — Discovery and execution architecture
- [[model-context-protocol]] — Protocol specification
- [[environment-sanitization]] — Security and credential protection