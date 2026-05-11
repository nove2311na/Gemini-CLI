---
type: concept
title: "A2A Protocol"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "A2A"
  - "agent-to-agent"
  - "protocol"
  - "interoperability"
  - "standards"
related:
  - "[[remote-subagents]]"
  - "[[agent-card]]"
  - "[[gemini-cli]]"
sources: ["III. 16. Remote Subagents.md"]
---

# A2A Protocol

The Agent-to-Agent (A2A) protocol is a communication standard that enables inter-agent messaging and task delegation. It allows AI agents from different providers to discover each other's capabilities and collaborate seamlessly.

## Overview

A2A provides a standardized way for agents to:
- Discover capabilities via agent cards
- Exchange messages and task results
- Handle authentication securely
- Support various transport mechanisms

## Protocol Structure

### Agent Card

The [[agent-card]] is the foundational element of A2A. It provides self-describing metadata that enables:

- **Capability discovery** — What can this agent do?
- **Skill enumeration** — What specialized tasks does it support?
- **Security schemes** — What authentication does it require?
- **Protocol versioning** — Which A2A version does it implement?

### Communication Flow

1. **Discovery**: Client fetches the agent card to understand capabilities
2. **Authentication**: Client configures auth based on the card's security schemes
3. **Task delegation**: Client sends tasks via A2A messages
4. **Result delivery**: Agent returns results through the protocol

## Security Schemes

A2A defines security scheme alignment with the following types:

| Scheme | Description | Compatibility |
|--------|-------------|----------------|
| `apiKey` | Static API key in HTTP header | Direct match |
| `http Bearer` | Bearer token authentication | Matches google-credentials output |
| `oauth2` | OAuth 2.0 Authorization Code with PKCE | Full OAuth flow |

## Version Compatibility

The protocol uses semantic versioning (e.g., `0.3.0`). Gemini CLI supports agent cards declaring specific protocol versions. Sample implementations demonstrating compliance are available in:

- [ADK Samples (Python)](https://github.com/google/adk-samples/tree/main/python)
- [ADK Python Contributing Samples](https://github.com/google/adk-python/tree/main/contributing/samples)

## Key Features

- **Streaming support**: Agents can advertise `streaming: true` capability
- **Extended agent cards**: Enable richer metadata structures
- **Input/output modes**: Define supported content types (text, JSON, etc.)
- **Skills routing**: Enable targeted task delegation to specific capabilities

## Relationship to Gemini CLI

Gemini CLI implements the A2A client-side, enabling it to:
- Connect to any compliant remote agent
- Fetch and validate agent cards
- Authenticate using standard security schemes
- Delegate tasks and receive results

This makes Gemini CLI an orchestration hub for the broader A2A agent ecosystem.

## External Reference

For the official specification, see [A2A Protocol Specification](https://a2a-protocol.org/latest/specification/).