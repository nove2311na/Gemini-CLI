---
type: entity
title: "list_mcp_resources"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "tool"
  - "discovery"
  - "gemini-cli"
related:
  - "[[read-mcp-resource]]"
  - "[[mcp-resources]]"
  - "[[resource-discovery]]"
  - "[[extensions]]"
sources: ["2. MCP resource tools.md"]
---

# list_mcp_resources

The `list_mcp_resources` tool is a discovery mechanism within Gemini CLI that retrieves a list of all available resources from connected MCP servers. It serves as the primary enumeration tool for understanding what external data sources are accessible to the AI model.

## Tool Specifications

| Attribute | Value |
|-----------|-------|
| **Tool name** | `list_mcp_resources` |
| **Display name** | List MCP Resources |
| **Kind** | Search |
| **Implementation file** | `list-mcp-resources.ts` |
| **Confirmation required** | No |

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `serverName` | string | No | Optional filter to list resources from a specific server only |

## Behavior

The tool operates by iterating through all connected MCP servers and fetching the list of resources each server exposes. Results are formatted into a plain-text list containing URIs, server names, and optional descriptions.

The output format (`llmContent`) provides a formatted list of available resources including their URI, associated server name, and any available description metadata.

## Use Case

Use `list_mcp_resources` when you need to:

- Discover what external data sources are currently accessible
- Identify available resources before deciding which to retrieve
- Filter resources by a specific MCP server when multiple servers are connected

## Relationship to Other Tools

- [[read-mcp-resource]] — Complementary tool for retrieving specific resource content after discovery
- [[google-web-search]] — Similar discovery pattern but for web content instead of MCP resources
- [[web-fetch-tool]] — Content retrieval tool but targets URLs rather than MCP URIs

## Read-Only Nature

As a discovery tool classified with `Kind: Search`, `list_mcp_resources` does not modify any state or require user confirmation. This makes it safe to include in automated workflows where the goal is understanding available context.