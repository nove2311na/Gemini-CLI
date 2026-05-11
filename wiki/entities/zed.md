---
type: entity
title: "Zed"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "ide"
  - "editor"
  - "acp-compatible"
related:
  - "[[agent-client-protocol]]"
  - "[[acp-agent-registry]]"
  - "[[jetbrains]]"
sources: ["2. ACP Mode.md"]
---

# Zed

**Zed** is a high-performance, collaborative code editor designed for speed and efficiency. It supports ACP integration through the [[agent-client-protocol]].

## ACP Integration

Zed can connect to ACP-compatible agents like [[gemini-cli]], allowing developers to leverage AI assistance within the Zed editor workflow.

## How It Works

1. Zed acts as an ACP client
2. It establishes connection to Gemini CLI in [[acp-mode]]
3. The agent's capabilities are exposed within Zed
4. MCP tools from Zed can be made available to the agent

## Discovery

Zed can discover available ACP-compatible agents through the [[acp-agent-registry]], simplifying the setup process for users.

## Related

- [IDE Integration Documentation](https://geminicli.com/docs/ide-integration)