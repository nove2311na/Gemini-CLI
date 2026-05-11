---
type: concept
title: "Resource Discovery"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "discovery"
  - "workflow"
related:
  - "[[list-mcp-resources]]"
  - "[[mcp-resources]]"
  - "[[resource-uri]]"
  - "[[grounding]]"
sources: ["2. MCP resource tools.md"]
---

# Resource Discovery

Resource discovery is the process by which the AI model enumerates available external data sources exposed through MCP servers. It enables the model to understand what contextual information is accessible before attempting to retrieve specific resources.

## Overview

In the MCP resource model, discovery serves as a prerequisite step. The model cannot assume knowledge of what resources are available—it must actively query connected servers to understand the landscape of accessible data.

## Discovery Mechanism

The [[list-mcp-resources]] tool provides discovery capabilities:

- **Full enumeration** — Lists all resources from all connected MCP servers
- **Server filtering** — Optional `serverName` parameter restricts discovery to a specific server
- **Metadata inclusion** — Results include URI, server name, and optional descriptions

## Why Discovery Matters

Resource discovery is essential because:

1. **Dynamic availability** — MCP servers can connect and disconnect during a session
2. **Namespace isolation** — Different servers may expose resources with similar URIs
3. **Context awareness** — The model needs to know what data exists before using it for grounding
4. **Reduced errors** — Discovery prevents attempts to access non-existent resources

## The Discovery-First Workflow

The MCP resource system emphasizes discovery before retrieval:

```
1. list_mcp_resources() → [URI1, URI2, URI3, ...]
   ↓
2. Review available resources and their descriptions
   ↓
3. read_mcp_resource(uri: URI2) → Resource content
```

This pattern ensures the model operates with accurate knowledge of available data sources.

## Discovery vs. Other Patterns

Resource discovery differs from related patterns in the Gemini CLI toolset:

| Pattern | Tool | Purpose |
|---------|------|---------|
| Resource discovery | list_mcp_resources | Enumerate MCP server resources |
| Web search | google-web-search | Find web-based information |
| URL fetching | web-fetch-tool | Retrieve specific URL content |

## Filtering Capabilities

The optional server filtering capability supports scenarios where:

- Multiple MCP servers are connected with overlapping concerns
- The user has specific context needs tied to a particular data source
- Debugging requires isolating behavior of a specific server

## Grounding Connection

Resource discovery contributes to the broader concept of [[grounding]] by ensuring the model is aware of current, available external data before incorporating it into responses. Without discovery, the model risks hallucinating about available resources.