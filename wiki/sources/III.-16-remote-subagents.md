---
type: source
title: "Remote Subagents"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "remote-agents"
  - "A2A"
  - "authentication"
  - "gcp"
related:
  - "[[remote-subagents]]"
  - "[[a2a-protocol]]"
  - "[[remote-agent-authentication]]"
  - "[[agent-card]]"
  - "[[google-adc]]"
sources: ["III. 16. Remote Subagents.md"]
---

# Remote Subagents

This source documents Gemini CLI's support for connecting to remote subagents via the Agent-to-Agent (A2A) protocol. It provides comprehensive coverage of agent definition formats, authentication methods, proxy configuration, and management commands.

## Key Topics

- **A2A Protocol Integration**: Connect to any A2A-compliant external agent
- **Agent Definition Format**: Markdown files with YAML frontmatter for declarative configuration
- **Authentication Methods**: Four types including apiKey, http, google-credentials, and oauth
- **Dynamic Secret Resolution**: Environment variables, command execution, and escape sequences
- **Agent Management**: Built-in `/agents` command group for lifecycle management

## Authentication Coverage

The source details four authentication approaches: API key authentication for simple static keys, HTTP Bearer/Basic authentication for token-based access, Google Application Default Credentials for seamless GCP integration, and OAuth 2.0 with PKCE for interactive flows. Each method includes configuration examples and security considerations.

## Security Features

Key security mechanisms include allowed host restrictions for google-credentials (limiting tokens to `*.googleapis.com` and `*.run.app`), automatic token caching and refresh, auth retry behavior for handling expired credentials, and agent card validation against declared security schemes.

## Source Details

- **URL**: https://geminicli.com/docs/core/remote-agents/
- **Published**: 2026-04-10
- **Coverage**: Feature documentation with configuration examples and reference tables