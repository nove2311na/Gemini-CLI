---
type: entity
title: "MCP Server Integration"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "mcp"
  - "sdk"
  - "tools"
  - "server"
related:
  - "[[extensions]]"
  - "[[gemini-extension-manifest]]"
  - "[[@modelcontextprotocol/sdk]]"
sources: ["2. Build Gemini CLI extensions.md"]
---

# MCP Server Integration

MCP (Model Context Protocol) servers are the standard way to expose tools and data sources to the Gemini CLI model. They enable the AI to perform actions beyond its base capabilities.

## Overview

An MCP server is a process that communicates with Gemini CLI via stdin/stdout using the MCP protocol. It registers tools, resources, and system instructions that become available to the model during conversation.

## Setting Up an MCP Server

### 1. Install the SDK

```bash
npm install @modelcontextprotocol/sdk zod
```

### 2. Create the Server

```javascript
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';

const server = new McpServer({
  name: 'prompt-server',
  version: '1.0.0',
});
```

### 3. Register Tools

Tools are actions the model can invoke:

```javascript
server.registerTool(
  'tool_name',
  {
    description: 'Description of what the tool does.',
    inputSchema: z.object({...}).shape,
  },
  async (args) => {
    // Tool implementation
    return {
      content: [
        {
          type: 'text',
          text: JSON.stringify(result),
        },
      ],
    };
  }
);
```

### 4. Connect the Transport

```javascript
const transport = new StdioServerTransport();
await server.connect(transport);
```

## StdioServerTransport Pattern

The `StdioServerTransport` uses standard input/output for communication with Gemini CLI. This makes servers simple to deploy and debug.

## When to Use MCP Servers

| Scenario | Recommendation |
|----------|----------------|
| Fetching data from APIs | Use MCP server |
| Querying databases | Use MCP server |
| Controlling local applications | Use MCP server |
| Exposing resources | Use MCP resources |
| Defining system behavior | Use system instructions |

## Manifest Configuration

Register your server in `gemini-extension.json`:

```json
{
  "mcpServers": {
    "nodeServer": {
      "command": "node",
      "args": ["${extensionPath}${/}example.js"],
      "cwd": "${extensionPath}"
    }
  }
}
```

## Testing

1. Link the extension with `gemini extensions link .`
2. Restart your Gemini CLI session
3. Ask the model to use the tool

The model will invoke registered tools when relevant to the conversation.