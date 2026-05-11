---
type: entity
title: "JSON-RPC 2.0"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "protocol"
  - "api"
  - "communication"
related:
  - "[[agent-client-protocol]]"
  - "[[acp-mode]]"
sources: ["2. ACP Mode.md"]
---

# JSON-RPC 2.0

**JSON-RPC 2.0** is a lightweight, stateless, remote procedure call protocol that uses JSON for data format. It serves as the transport mechanism for [[agent-client-protocol]] communication in [[acp-mode]].

## Protocol Basics

JSON-RPC 2.0 operates through:

- **Requests**: Client-initiated calls with method name and parameters
- **Responses**: Server replies with result or error
- **Notifications**: One-way messages without response expected

## Usage in ACP

In ACP mode, all communication between the client (IDE) and [[gemini-cli]] happens over standard input/output using JSON-RPC 2.0 messages. This includes:

- `initialize`: Establish connection
- `authenticate`: Authenticate user
- `newSession` / `loadSession`: Manage sessions
- `prompt`: Send prompts
- `cancel`: Cancel operations
- `setSessionMode`: Control tool call approval

## Message Format

A typical JSON-RPC 2.0 request looks like:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "prompt",
  "params": {
    "prompt": "Explain this code",
    "sessionId": "abc123"
  }
}
```

## Benefits for ACP

- **Simplicity**: Easy to implement and parse
- **Language agnostic**: Works with any programming language
- **Stateless**: No connection state to maintain between requests
- **stdio compatible**: Works seamlessly over standard input/output streams