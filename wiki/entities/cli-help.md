---
type: entity
title: "CLI Help Agent"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "subagent"
  - "built-in"
  - "documentation"
related:
  - "[[subagents]]"
  - "[[gemini-cli]]"
sources: ["III. 15. Subagents.md"]
---

# CLI Help Agent

The `cli_help` is a built-in subagent in Gemini CLI that provides expert knowledge about Gemini CLI itself, its commands, configuration options, and documentation.

## Purpose

This subagent specializes in answering questions about how to use Gemini CLI, making it ideal for users who want detailed guidance on features, configuration, and best practices.

## Usage Scenarios

- "How do I configure a proxy for Gemini CLI?"
- "What does the `/rewind` command do?"
- "How do I set up multi-agent collaboration?"
- "What are the available settings for the browser agent?"
- "Explain the difference between session modes"

## Configuration

The subagent is enabled by default. Like other built-in subagents, it can be overridden in `settings.json` under `agents.overrides`.

## Key Features

- **Expert knowledge:** Contains detailed information about all Gemini CLI features
- **Documentation lookup:** Can access and reference official documentation
- **Configuration guidance:** Helps users understand settings and their effects

## Invocation

Can be invoked explicitly using `@syntax`:
```
@cli_help How do I enable the experimental features in settings.json?
```

## See Also

- [[subagents]] — General subagent documentation
- [[codebase-investigator]] — Code analysis subagent
- [[generalist]] — General-purpose subagent
- [[browser-agent]] — Browser automation subagent