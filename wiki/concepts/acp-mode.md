---
type: concept
title: "ACP Mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "ide-integration"
  - "programmatic-control"
  - "json-rpc"
related:
  - "[[agent-client-protocol]]"
  - "[[gemini-cli]]"
  - "[[mcp-model-context-protocol]]"
  - "[[acp-client-server-architecture]]"
  - "[[acp-file-system-proxy]]"
  - "[[acp-telemetry]]"
sources: ["2. ACP Mode.md"]
---

# ACP Mode

ACP Mode is a special operational mode of [[gemini-cli]] that enables programmatic control of the agent via external clients, primarily for IDE and developer tool integrations.

## Starting ACP Mode

Launch Gemini CLI in ACP mode using the `--acp` flag:

```bash
gemini --acp
```

For debugging output, add the `--debug` flag:

```bash
gemini --acp --debug
```

## Communication Protocol

All ACP communication uses [[json-rpc-2-0]] over standard input/output. This allows any ACP-compliant tool to send requests to and receive responses from [[gemini-cli]].

## Client-Server Model

See [[acp-client-server-architecture]] for detailed explanation of the communication model.

## Core Methods

### Connection Methods
- `initialize`: Establish initial connection, register MCP server
- `authenticate`: Authenticate the user

### Session Methods
- `newSession`: Start a new chat session
- `loadSession`: Load a previous session

### Interaction Methods
- `prompt`: Send a prompt to the agent
- `cancel`: Cancel an ongoing prompt

### Configuration Methods
- `setSessionMode`: Change approval level for tool calls
- `unstable_setSessionModel`: Change the model for current session

## MCP Extension

ACP mode supports [[mcp-model-context-protocol]] extension. During initialization, clients can register MCP servers that expose IDE tools to the Gemini model.

## Security

All file operations go through the [[acp-file-system-proxy]], ensuring the agent only accesses files explicitly allowed by the client.

## Debugging

See [[acp-telemetry]] for environment variables and configuration options to debug ACP communication.