---
type: concept
title: "MCP Server Management"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "tools"
  - "enterprise"
  - "security"
related:
  - "[[tool-allowlisting]]"
  - "[[extensions]]"
  - "[[enterprise-configuration]]"
sources: ["5. Gemini CLI cheatsheet.md", "2. Enterprise configuration.md"]
---

# MCP Server Management

MCP (Model Context Protocol) server management refers to the configuration and security controls for custom tool servers in [[gemini-cli]] enterprise deployments.

## Overview

MCP servers extend [[gemini-cli]] capabilities by providing custom tools for specific organizational needs. Enterprise deployments require strict controls to ensure only approved servers can be used.

## Catalog Enforcement

Organizations can enforce a centralized catalog of approved MCP servers through a two-step configuration:

1. **Define server configurations** in `mcpServers`
2. **Allowlist server names** in `mcp.allowed`

```json
{
  "mcp": {
    "allowed": ["corp-data-api", "source-code-analyzer"]
  },
  "mcpServers": {
    "corp-data-api": {
      "command": "/usr/local/bin/start-corp-api.sh",
      "timeout": 5000
    },
    "source-code-analyzer": {
      "command": "/usr/local/bin/start-analyzer.sh"
    }
  }
}
```

## Security Benefits

MCP catalog enforcement provides:
- **Centralized control** — All approved tools defined in one place
- **Consistent configuration** — Server parameters standardized across users
- **Audit capability** — Clear list of approved custom tools
- **Reduced risk** — Users cannot run unapproved servers

## Server Configuration Options

| Setting | Purpose |
|---------|---------|
| `command` | Executable or script to start the server |
| `timeout` | Maximum execution time in milliseconds |
| `env` | Environment variables for the server |

## Relationship with Tool Allowlisting

While `mcp.allowed` controls which MCP servers are available, the general [[tool-allowlisting]] (`tools.core`) controls built-in tool access. Both can be configured together for defense-in-depth.

## Related Concepts

- [[tool-allowlisting]] — Core tool access control
- [[extensions]] — General extension framework
- [[enterprise-configuration]] — Enterprise management overview

---