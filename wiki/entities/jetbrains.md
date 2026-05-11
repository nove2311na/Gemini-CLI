---
type: entity
title: "JetBrains"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "ide"
  - "editor"
  - "acp-compatible"
related:
  - "[[agent-client-protocol]]"
  - "[[acp-agent-registry]]"
  - "[[zed]]"
sources: ["2. ACP Mode.md"]
---

# JetBrains

**JetBrains** is a software development company known for providing a suite of professional IDEs including IntelliJ IDEA, PyCharm, WebStorm, PhpStorm, and many others.

## ACP Integration

JetBrains IDEs are compatible with the [[agent-client-protocol]], enabling integration with ACP-compatible agents like [[gemini-cli]]. This allows developers to use AI-powered assistance directly within their preferred JetBrains environment.

## How It Works

Through the ACP protocol:

1. The JetBrains IDE acts as an ACP client
2. It connects to Gemini CLI running in [[acp-mode]]
3. The agent's capabilities become available in the IDE workflow
4. MCP extensions can expose IDE-specific features to the agent

## Discovery

JetBrains IDEs can discover available ACP-compatible agents through the [[acp-agent-registry]].

## Related

- [IDE Integration Documentation](https://geminicli.com/docs/ide-integration)