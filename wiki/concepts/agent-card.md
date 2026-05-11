---
type: concept
title: "Agent Card"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "agent-card"
  - "A2A"
  - "metadata"
  - "capabilities"
  - "self-description"
related:
  - "[[a2a-protocol]]"
  - "[[remote-subagents]]"
  - "[[remote-agent-authentication]]"
sources: ["III. 16. Remote Subagents.md"]
---

# Agent Card

An agent card is a JSON metadata document that describes an A2A agent's capabilities, security requirements, and configuration. It serves as the self-describing interface that enables clients like Gemini CLI to discover and interact with agents.

## Card Structure

### Core Fields

| Field | Type | Description |
|-------|------|-------------|
| `protocolVersion` | string | A2A protocol version (e.g., `0.3.0`) |
| `name` | string | Human-readable agent name |
| `description` | string | Agent description and purpose |
| `version` | string | Agent implementation version |
| `url` | string | Agent endpoint base URL |

### Capabilities

| Field | Type | Description |
|-------|------|-------------|
| `streaming` | boolean | Whether agent supports streaming responses |
| `extendedAgentCard` | boolean | Whether extended card format is supported |

### Input/Output Modes

| Field | Type | Description |
|-------|------|-------------|
| `defaultInputModes` | string[] | Supported input content types |
| `defaultOutputModes` | string[] | Supported output content types |

Common modes include `text/plain`, `application/json`, `text/markdown`.

### Skills

Skills define specialized capabilities within an agent:

```json
{
  "id": "ExampleSkill",
  "name": "Example Skill Assistant",
  "description": "A description of what this example skill does.",
  "tags": ["example-tag"],
  "examples": ["Show me an example."]
}
```

### Security Schemes

The `securitySchemes` object declares authentication requirements:

```json
{
  "securitySchemes": {
    "apiKeyAuth": {
      "type": "apiKey",
      "in": "header",
      "name": "X-API-Key"
    },
    "bearerAuth": {
      "type": "http",
      "scheme": "Bearer"
    },
    "oauth2Auth": {
      "type": "oauth2",
      "flows": {
        "authorizationCode": {
          "authorizationUrl": "https://auth.example.com/authorize",
          "tokenUrl": "https://auth.example.com/token",
          "scopes": {
            "read": "Read access",
            "write": "Write access"
          }
        }
      }
    }
  }
}
```

## Agent Card Fetching

### Standard Endpoint

Agent cards are typically served at `/.well-known/agent.json`:

```
https://my-agent-xyz.run.app/.well-known/agent.json
```

### Inline Configuration

For agents without a public endpoint, the card can be embedded directly in the agent definition using `agent_card_json`:

```markdown
---
kind: remote
name: my-agent
agent_card_json: |
  {
    "protocolVersion": "0.3.0",
    "name": "My Agent",
    "version": "1.0.0",
    "url": "https://my-agent.example.com",
    "capabilities": {
      "streaming": true,
      "extendedAgentCard": false
    }
  }
---
```

### JSON Formatting Options

When embedding JSON in YAML, three formats are supported:

| Format | Use Case | Escaping |
|--------|----------|----------|
| **Block scalar (`|`)** | Multiline JSON | None required (recommended) |
| **Single quotes** | Short single-line JSON | Internal quotes allowed |
| **Double quotes** | Compatibility | Internal quotes must be escaped |

## Fetching with Authentication

Gemini CLI fetches agent cards in two stages:

1. **Without auth**: Attempt to fetch the card publicly
2. **With auth**: If the endpoint returns 401/403, retry with configured authentication

This hybrid approach supports:
- Public agent cards with protected task endpoints
- Both endpoints protected behind auth
- Fully public agents

## Authentication Validation

When loading an agent, Gemini CLI validates the configured auth against the card's `securitySchemes`. If the agent requires authentication that isn't configured, an error describes what's missing.

`google-credentials` is treated as compatible with `http` Bearer schemes since it produces Bearer tokens.