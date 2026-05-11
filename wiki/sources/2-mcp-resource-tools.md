---
type: source
title: "MCP Resource Tools"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "documentation"
  - "mcp"
  - "tools"
  - "resources"
related:
  - "[[mcp-resources]]"
  - "[[list-mcp-resources]]"
  - "[[read-mcp-resource]]"
  - "[[extensions]]"
  - "[[web-fetch-tool]]"
sources: ["2. MCP resource tools.md"]
---

# MCP Resource Tools

This documentation describes the MCP resource tools that enable Gemini CLI to discover and retrieve data from contextual resources exposed by Model Context Protocol (MCP) servers.

## Overview

MCP resource tools provide a bridge between external data sources and the Gemini CLI context. They allow the AI model to access resources exposed by connected MCP servers through a standardized discovery and retrieval workflow.

## Core Tools

### list_mcp_resources

A discovery tool that retrieves a list of all available resources from connected MCP servers. It helps the model understand what external data sources are available for reference.

- **Kind:** Search
- **Key parameter:** `serverName` (optional filter)
- **Behavior:** Iterates through connected MCP servers and fetches exposed resources
- **Confirmation:** Not required (read-only)

### read_mcp_resource

A retrieval tool that accesses content from a specific resource identified by its URI.

- **Kind:** Read
- **Key parameter:** `uri` (required resource identifier)
- **Behavior:** Locates resource via URI, calls server's resources/read method
- **Confirmation:** Not required (read-only)

## Key Concepts

- [[mcp-resources]] — Data exposed by MCP servers via URIs with optional descriptions
- [[resource-discovery]] — The process of enumerating available external data sources
- [[resource-uri]] — Unique identifier for each exposed resource

## Source Information

- **URL:** https://geminicli.com/docs/tools/mcp-resources/
- **Published:** 2026-04-17
- **Documentation type:** Official tool documentation

## Related Tools

- [[web-fetch-tool]] — Similar fetch-by-identifier pattern but targets URLs
- [[google-web-search]] — Related discovery concept with different scope