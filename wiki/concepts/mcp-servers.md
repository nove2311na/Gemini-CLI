---
type: concept
title: "MCP servers"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "extensions"
  - "integration"
related:
  - "[[extensions]]"
  - "[[github-mcp-server]]"
  - "[[settings-json]]"
  - "[[docker]]"
  - "[[sandboxing]]"
sources: ["9. Set up an MCP server.md"]
---

# MCP servers

Model Context Protocol (MCP) servers extend Gemini CLI by connecting to external tools and data sources. They expose capabilities that the AI agent can invoke through natural language requests without requiring special commands.

## Overview

MCP servers are one category within the broader [[extensions]] system. While extensions can also include prompts, commands, themes, hooks, sub-agents, and agent skills, MCP servers specifically handle tool invocation through a standardized protocol that enables Gemini to communicate with external services.

## Configuration

MCP servers are declared in [[settings-json]] using a declarative JSON structure:

```json
{
  "mcpServers": {
    "server-name": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "-e", "CREDENTIAL_VAR", "image:name"],
      "env": {
        "CREDENTIAL_VAR": "${CREDENTIAL_VAR}"
      }
    }
  }
}
```

### Configuration Fields

| Field | Purpose |
|-------|---------|
| `command` | The executable to run (typically `docker`) |
| `args` | Command-line arguments including environment variable references |
| `env` | Environment variables to pass, referencing shell variables with `${VAR}` syntax |

## Authentication

Most MCP servers require credentials, which are handled securely through environment variables:

1. Set credentials in your shell (e.g., `export GITHUB_PERSONAL_ACCESS_TOKEN="..."`)
2. Reference them in the `env` block of `settings.json`
3. The MCP server receives them as runtime environment variables

This approach keeps sensitive credentials out of configuration files while still enabling server authentication.

## Execution Model

### Docker-based Execution

The standard deployment model runs MCP servers as Docker containers. This provides:

- **Isolation** — Each server runs in its own container, similar to [[sandboxing]]
- **Reproducibility** — Consistent environment across machines
- **Security** — Network and filesystem access controlled by container boundaries

### Alternative Transports

Beyond Docker, MCP servers can also use SSE (Server-Sent Events) and HTTP transports for remote server connections. This enables connecting to servers running on other machines or in cloud environments.

## Tool Discovery and Invocation

Once configured, MCP tools become available transparently:

1. **Automatic detection** — The CLI queries server capabilities on startup
2. **Natural language triggers** — Requests matching tool capabilities invoke them automatically
3. **No special commands required** — Users interact through normal prompts

Example: Asking "List the open PRs in the google/gemini-cli repository" triggers the GitHub MCP tool without any explicit `/mcp` command.

## Management Commands

| Command | Purpose |
|---------|---------|
| `/mcp list` | Show all configured servers and their connection status |
| `/mcp reload` | Force the CLI to re-query servers for updated capabilities |

### Troubleshooting

If servers show as `Disconnected`:
- Verify Docker is running
- Confirm API tokens are valid and set in environment
- Run the Docker command manually to see error output

## Available Servers

The official MCP server list includes connectors for:
- GitHub (shown in the tutorial)
- Slack
- Postgres
- Google Drive
- And many more services

## Relationship to Extensions

MCP servers are one type of [[extensions]] package. While all MCP servers are extensions, not all extensions are MCP servers. The extension system provides a unified packaging format, but MCP specifically handles the tool invocation protocol for external services.

## Security Considerations

- Credentials should only be stored in environment variables, never hardcoded
- Docker containers provide network isolation but consider the security implications of each server's access requirements
- Review the permissions granted to tokens before configuring servers