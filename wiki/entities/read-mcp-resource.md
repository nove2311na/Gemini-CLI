---
type: entity
title: "read_mcp_resource"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "tool"
  - "retrieval"
  - "gemini-cli"
related:
  - "[[list-mcp-resources]]"
  - "[[mcp-resources]]"
  - "[[resource-uri]]"
  - "[[web-fetch-tool]]"
sources: ["2. MCP resource tools.md"]
---

# read_mcp_resource

The `read_mcp_resource` tool is a retrieval mechanism within Gemini CLI that accesses and returns the content of a specific resource identified by its URI. It completes the resource access workflow after discovery has identified available resources.

## Tool Specifications

| Attribute | Value |
|-----------|-------|
| **Tool name** | `read_mcp_resource` |
| **Display name** | Read MCP Resource |
| **Kind** | Read |
| **Implementation file** | `read-mcp-resource.ts` |
| **Confirmation required** | No |

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `uri` | string | Yes | The URI of the MCP resource to read |

## Behavior

The tool locates the resource and its associated server by parsing the provided URI. It then calls the server's `resources/read` method and processes the response. The output format (`llmContent`) returns the content of the resource in a format suitable for AI consumption.

For binary data, the tool returns a placeholder indicating the data type rather than the raw binary content.

## Use Cases

Use `read_mcp_resource` when you need to:

- Retrieve specific documentation from an MCP server
- Access configuration data exposed by a connected server
- Pull in contextual information from external data sources

## Workflow Pattern

The typical workflow is discovery-first:

1. Call [[list-mcp-resources]] to discover available resources
2. Identify the desired resource by its URI
3. Call `read_mcp_resource` with the URI to retrieve content

## Relationship to Other Tools

- [[list-mcp-resources]] — Discovery counterpart that identifies available resources
- [[web-fetch-tool]] — Similar retrieval pattern but targets URLs instead of MCP URIs
- [[google-web-search]] — Discovery and retrieval for web content, different data source

## Read-Only Nature

As a retrieval tool classified with `Kind: Read`, `read_mcp_resource` does not modify any state. It is a read-only operation that fetches resource content without requiring user confirmation.

## URI Resolution

The tool uses the resource URI as its primary identifier. The URI format follows MCP server conventions and encodes both the server identifier and the resource path within that server's namespace.