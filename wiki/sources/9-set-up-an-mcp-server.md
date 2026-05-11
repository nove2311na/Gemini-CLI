---
type: source
title: "Set up an MCP server"
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/tutorials/mcp-setup/"
venue: "geminicli.com"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "clippings"
  - "tutorial"
  - "mcp"
related:
  - "[[mcp-servers]]"
  - "[[github-mcp-server]]"
  - "[[settings-json]]"
  - "[[extensions]]"
sources: ["9. Set up an MCP server.md"]
---

# Set up an MCP server

This tutorial demonstrates how to connect Gemini CLI to external services using the Model Context Protocol (MCP). It provides a step-by-step guide for installing the GitHub MCP server to manage repositories directly from the CLI.

## Key Topics

### Prerequisites

- Gemini CLI installed
- Docker (for running MCP servers as containers)
- GitHub Personal Access Token with appropriate permissions

### Credential Setup

The guide explains how to create a fine-grained PAT with Read access to Metadata and Contents, and Read/Write access to Issues and Pull Requests. Credentials are stored in environment variables for secure access.

### Configuration

MCP servers are declared in `~/.gemini/settings.json` using a declarative JSON structure with `command`, `args`, and `env` fields. The example shows how to configure the GitHub MCP server using a Docker container.

### Verification and Usage

The `/mcp list` command verifies server connectivity. Tool usage is transparent—natural language requests trigger MCP tool calls automatically without special commands.

## Core Findings

1. **MCP enables external service integration** — Gemini CLI can call tools exposed by MCP servers
2. **Declarative configuration** — Servers are defined in `settings.json` with Docker as the typical execution model
3. **Environment-based authentication** — Credentials passed via the `env` block
4. **Transparent tool invocation** — No special commands needed; natural language triggers tool calls

## Next Steps

After completing this tutorial, users can explore the MCP servers reference for SSE and HTTP transports, and browse the official MCP server list for additional connectors.