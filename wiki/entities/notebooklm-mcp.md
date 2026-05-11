---
type: entity
title: "NotebookLM MCP"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "notebooklm"
  - "integration"
related:
  - "[[mcp-server]]"
  - "[[gemini-cli]]"
sources: ["https://github.com/jacob-bd/notebooklm-mcp-cli"]
---

# NotebookLM MCP

The NotebookLM MCP server provides programmatic access to Google NotebookLM notebooks, allowing [[gemini-cli]] to query sources, list notebooks, and retrieve information with grounded citations.

## Authentication

Authentication is handled via cookie extraction from a browser session using the `nlm login` command. The credentials are stored locally in `~/.notebooklm-mcp-cli` and shared between the CLI and the MCP server.

## Configuration

The server can be added to Gemini CLI using the `nlm setup add gemini` command, which updates the `mcpServers` section in `settings.json`.

```json
"notebooklm": {
  "command": "python",
  "args": [
    "-m",
    "notebooklm_mcp.server",
    "start"
  ]
}
```

## Tools

The MCP server exposes several tools for interacting with NotebookLM:
- `list_notebooks`: Returns a list of available notebooks.
- `query_notebook`: Performs a query against a specific notebook's sources.
- `get_notebook_details`: Retrieves details about a specific notebook, including its sources.

## Usage

Once configured, Gemini CLI can use these tools to answer questions based on your NotebookLM data. Example: "Sử dụng NotebookLM để tóm tắt các tài liệu trong notebook 'Project X'".
