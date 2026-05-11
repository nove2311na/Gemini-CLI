---
type: concept
title: "Remote Subagents"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "remote-agents"
  - "A2A"
  - "agent-orchestration"
  - "extensibility"
related:
  - "[[a2a-protocol]]"
  - "[[agent-card]]"
  - "[[remote-agent-authentication]]"
  - "[[gemini-cli]]"
  - "[[extensions]]"
sources: ["III. 16. Remote Subagents.md"]
---

# Remote Subagents

Remote subagents enable Gemini CLI to delegate tasks to external AI agents via the Agent-to-Agent (A2A) protocol. This extensibility mechanism allows Gemini CLI to tap into a broader ecosystem of A2A-compliant agents, expanding its capabilities beyond built-in features.

## Overview

Remote subagents are external AI agents that communicate with Gemini CLI using the [[a2a-protocol]]. Unlike [[extensions]] which package capabilities locally (prompts, MCP servers, commands), remote agents are separate services that Gemini CLI orchestrates over the network.

## Agent Definition Format

Remote subagents are defined as Markdown files (`.md`) with YAML frontmatter. This declarative format allows agents to be version-controlled, shared across teams, and easily configured.

### File Locations

Agents can be placed in two locations:

| Location | Path | Scope |
|----------|------|-------|
| Project-level | `.gemini/agents/*.md` | Shared with your team |
| User-level | `~/.gemini/agents/*.md` | Personal agents only |

### Configuration Schema

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `kind` | string | Yes | Must be `remote` |
| `name` | string | Yes | Unique slug identifier (lowercase, numbers, hyphens, underscores) |
| `agent_card_url` | string | Yes* | URL to A2A card endpoint (*if `agent_card_json` not provided) |
| `agent_card_json` | string | Yes* | Inline A2A card JSON (*if `agent_card_url` not provided) |
| `auth` | object | No | Authentication configuration |

### Single Agent Example

```markdown
---
kind: remote
name: my-remote-agent
agent_card_url: https://example.com/agent-card
auth:
  type: apiKey
  key: $MY_API_KEY
---
```

### Multi-Agent Definition

A single Markdown file can define multiple agents using a YAML list:

```markdown
---
- kind: remote
  name: remote-1
  agent_card_url: https://example.com/1
- kind: remote
  name: remote-2
  agent_card_url: https://example.com/2
---
```

## Management Commands

Use the `/agents` command group to manage subagents:

- `/agents list` — Display all available local and remote subagents
- `/agents reload` — Reload the agent registry (after adding/modifying files)
- `/agents enable <agent_name>` — Enable a specific subagent
- `/agents disable <agent_name>` — Disable a specific subagent

## Disabling Remote Agents

Remote agents are enabled by default. To disable globally, set `enableAgents` to `false` in `settings.json`:

```json
{
  "experimental": {
    "enableAgents": false
  }
}
```

## Proxy Support

Gemini CLI routes traffic through configured HTTP/HTTPS proxies:

- `settings.json`: `"general": { "proxy": "http://my-proxy:8080" }`
- Environment variables: `HTTP_PROXY`, `HTTPS_PROXY`

## Related Concepts

- [[a2a-protocol]] — The communication protocol enabling inter-agent messaging
- [[agent-card]] — The metadata schema describing agent capabilities
- [[remote-agent-authentication]] — Authentication configuration options
- [[google-adc]] — Google Application Default Credentials for GCP auth