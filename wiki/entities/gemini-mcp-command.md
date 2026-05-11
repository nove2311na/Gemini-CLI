---
type: entity
title: "gemini mcp command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "mcp"
  - "cli"
  - "command"
related:
  - "[[mcp-server]]"
  - "[[gemini-cli]]"
  - "[[mcp-server-integration]]"
sources: ["1. MCP servers with Gemini CLI.md"]
---

# gemini mcp command

The `gemini mcp` command group provides programmatic management of MCP server configurations in [[gemini-cli]], enabling users to add, list, remove, enable, and disable servers without manually editing JSON files.

## Commands

### gemini mcp add

Configures a new MCP server in `settings.json`:

```bash
gemini mcp add [options] <name> <commandOrUrl> [args...]
```

Options include:
- `-s, --scope`: Configuration scope (user or project)
- `-t, --transport`: Transport type (stdio, sse, http)
- `-e, --env`: Set environment variables
- `-H, --header`: Set HTTP headers for SSE and HTTP transports
- `--timeout`: Set connection timeout in milliseconds
- `--trust`: Trust the server (bypass confirmations)
- `--include-tools`: Comma-separated list of tools to include
- `--exclude-tools`: Comma-separated list of tools to exclude

### gemini mcp list

Displays all configured MCP servers with name, configuration details, and connection status:

```bash
gemini mcp list
```

### gemini mcp remove

Deletes a server from the configuration:

```bash
gemini mcp remove <name>
```

### gemini mcp enable / disable

Temporarily enable or disable a server:

```bash
gemini mcp enable <name>
gemini mcp disable <name>
```

## In-Session Commands

During an active session, these commands are also available as slash commands:
- `/mcp` — Display server status, connection details, and available tools
- `/mcp auth` — Manage OAuth authentication
- `/mcp enable <name>` — Enable a disabled server
- `/mcp disable <name>` — Disable a server

## See Also

- [[mcp-server]] — MCP server overview
- [[mcp-server-integration]] — Integration architecture
- [[session-management]] — Session handling in Gemini CLI