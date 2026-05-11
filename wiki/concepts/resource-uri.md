---
type: concept
title: "Resource URI"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "uri"
  - "identification"
  - "resources"
related:
  - "[[mcp-resources]]"
  - "[[read-mcp-resource]]"
  - "[[list-mcp-resources]]"
sources: ["2. MCP resource tools.md"]
---

# Resource URI

A resource URI is a unique identifier that locates and names a specific MCP resource exposed by a connected server. It serves as the essential parameter for the [[read-mcp-resource]] tool to retrieve content.

## Definition

The resource URI follows the Model Context Protocol convention for identifying data items. It encodes both the server identifier and the resource path within that server's namespace, creating a globally unique locator for each accessible resource.

## Purpose

Resource URIs serve multiple functions:

| Function | Description |
|----------|-------------|
| **Identification** | Uniquely identifies a specific resource among all exposed resources |
| **Resolution** | Enables the read tool to locate the correct server and resource path |
| **Namespace encoding** | Embeds server context within the resource identifier |
| **Retrieval** | Acts as the required parameter for content retrieval |

## Usage with read_mcp_resource

The URI is the required parameter for the [[read-mcp-resource]] tool:

```
read_mcp_resource(uri: "server-name/resource-path")
```

Without a valid URI pointing to an existing resource, the retrieval operation cannot complete.

## Format Structure

While the exact URI format is defined by the MCP specification, URIs typically encode:

1. **Server identifier** — Names the MCP server that exposes the resource
2. **Resource path** — Specifies the particular data item within that server

## Discovery Reveals URIs

The [[list-mcp-resources]] tool returns URIs as part of its output. This discovery-first approach ensures the model has accurate URIs before attempting retrieval.

## Comparison with Web URLs

Resource URIs serve a similar purpose to web URLs but in a different context:

| Aspect | Resource URI | Web URL |
|--------|--------------|---------|
| Context | MCP server namespace | Web address |
| Purpose | Locate MCP resource | Locate web content |
| Resolved by | read_mcp_resource | web-fetch-tool |
| Format | Protocol-defined | https://... |

## URI Stability

Resource URIs are determined by the MCP server implementation. A well-behaved server should maintain URI stability for existing resources to prevent breaking references, though new resources may be added dynamically.