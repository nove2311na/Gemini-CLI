---
type: concept
title: "MCP Resources"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "resources"
  - "context"
  - "data-access"
related:
  - "[[list-mcp-resources]]"
  - "[[read-mcp-resource]]"
  - "[[resource-discovery]]"
  - "[[resource-uri]]"
  - "[[extensions]]"
sources: ["2. MCP resource tools.md"]
---

# MCP Resources

MCP resources are data elements exposed by Model Context Protocol (MCP) servers that provide contextual information for AI model interactions. They serve as a bridge between external data sources and the Gemini CLI context, enabling the model to access relevant information beyond what exists in the immediate conversation.

## Definition

MCP resources are data exposed by MCP servers via unique URIs with optional descriptions. Each resource represents a discrete unit of contextual data that can be discovered and retrieved by the AI model during a session.

## Key Characteristics

- **Exposed by MCP servers** — Resources are defined and provided by connected MCP server extensions
- **URI-based identification** — Each resource has a unique URI that serves as its locator
- **Optional descriptions** — Resources may include metadata describing their content
- **Server association** — Resources are grouped under specific MCP servers in a namespace hierarchy
- **Read-only access** — Resources can be discovered and retrieved but not modified through this mechanism

## Workflow

Accessing MCP resources follows a discovery-then-retrieval pattern:

1. **Discovery** — Use [[list-mcp-resources]] to enumerate available resources across all connected servers
2. **Filtering** — Optionally filter by `serverName` to scope discovery to a specific server
3. **Retrieval** — Use [[read-mcp-resource]] with the resource URI to fetch content

## Resource Attributes

When resources are listed, they include:

| Attribute | Description |
|-----------|-------------|
| URI | Unique identifier for the resource |
| Server name | The MCP server that exposes this resource |
| Description | Optional metadata describing the resource content |

## Data Handling

MCP resources support multiple data formats:

- **Text content** — Returned directly to the model for context injection
- **Binary data** — Returned as a placeholder indicating the data type (actual binary content is not inlined)

## Relationship to Extensions

MCP resources differ from [[extensions]] in their purpose:

- **Extensions** — Package prompts, MCP servers, commands, themes, hooks, sub-agents, and agent skills
- **MCP resources** — Expose specific data from MCP servers for contextual access

While MCP servers are connected through the extension ecosystem, the resources they expose are distinct data items available for model context.

## Discovery-First Pattern

The documentation emphasizes a discovery-first approach because:

1. The model cannot know what resources are available without enumeration
2. Resources may change as servers connect or disconnect
3. Filtering by server helps scope discovery in multi-server environments

This pattern ensures the model has accurate awareness of available external data before attempting retrieval.

## Comparison with Similar Patterns

| Feature | MCP Resources | Web Fetch |
|---------|---------------|-----------|
| Identifier | URI | URL |
| Source | MCP servers | Web addresses |
| Discovery | Yes (list tool) | Manual/External |
| Content type | Text or binary placeholder | Text content |

See also [[web-fetch-tool]] for a similar fetch-by-identifier pattern targeting web URLs.