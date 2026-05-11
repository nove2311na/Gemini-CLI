---
type: concept
title: "Tool Allowlisting"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "tools"
  - "enterprise"
  - "allowlist"
related:
  - "[[yolo-mode]]"
  - "[[sandboxing]]"
  - "[[mcp-server-management]]"
  - "[[enterprise-configuration]]"
sources: ["2. Enterprise configuration.md"]
---

# Tool Allowlisting

Tool allowlisting is a security approach that explicitly specifies which tools are permitted for use, rather than attempting to block dangerous ones. In [[gemini-cli]], this is achieved through the `coreTools` configuration.

## Overview

Allowlisting is considered the most secure approach to tool access control because it:
- Defaults to denying access
- Requires explicit approval for each tool
- Reduces the attack surface by limiting available capabilities

## Configuration

Tools are allowlisted using the `tools.core` array in the settings file:

```json
{
  "tools": {
    "core": ["ReadFileTool", "GlobTool", "ShellTool(ls)"]
  }
}
```

This configuration specifies that only `ReadFileTool`, `GlobTool`, and `ShellTool(ls)` are available to users. All other tools are implicitly blocked.

## Relationship with YOLO Mode

Allowlisting works in conjunction with [[yolo-mode]] controls. Even with YOLO mode disabled (requiring confirmation for all tool calls), allowlisting provides an additional layer of security by preventing access to unapproved tools entirely.

## Combining with Sandboxing

[[sandboxing]] can be combined with allowlisting for defense-in-depth:

```json
{
  "tools": {
    "core": ["ReadFileTool", "GlobTool"],
    "sandbox": "docker"
  }
}
```

This configuration:
1. Restricts available tools to the allowlist
2. Executes all tool operations within Docker containers

## Comparison with Blocklisting

| Approach | Pros | Cons |
|----------|------|------|
| **Allowlisting** | Default-deny; comprehensive protection | Requires maintenance of approved list |
| **Blocklisting** | More permissive; easier initial setup | Must anticipate all dangerous tools |

For enterprise environments, allowlisting is the recommended approach due to its stronger security posture.

## Related Concepts

- [[yolo-mode]] — Unrestricted execution mode
- [[sandboxing]] — Containerized tool execution
- [[mcp-server-management]] — MCP server allowlisting

---