---
type: source
title: "Subagents"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "subagents"
  - "multi-agent"
  - "delegation"
  - "browser-automation"
related:
  - "[[subagents]]"
  - "[[browser-agent]]"
  - "[[agent-definition-files]]"
  - "[[tool-isolation]]"
sources: ["III. 15. Subagents.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/core/subagents/"
venue: "gemini-cli documentation"
---

# Subagents

This source documents Gemini CLI's subagent system for specialized AI delegation. Subagents are "specialists" that operate in isolated context loops, providing focused expertise without cluttering the main agent's context or toolset.

## Key Features

**Delegation Mechanisms:**
- Automatic delegation: Main agent decides when to use specialist subagents
- Explicit invocation: Use `@syntax` to force specific subagent routing

**Built-in Subagents:**
- `codebase_investigator`: Deep codebase analysis and dependency mapping
- `cli_help`: Gemini CLI help and documentation lookup
- `generalist`: General-purpose agent for resource-heavy subtasks
- `browser_agent`: Experimental web browser automation via Chrome DevTools

**Custom Subagents:**
- Markdown files with YAML frontmatter
- Configurable tools, models, and persona
- Project-level (`.gemini/agents/`) or user-level (`~/.gemini/agents/`) placement

**Security Features:**
- Tool isolation: Restrict subagent access to specific tools
- Recursion protection: Subagents cannot call other subagents
- Policy Engine integration for subagent-specific rules

## Browser Agent Capabilities

The experimental browser agent provides visual automation:
- Session modes: persistent, isolated, or existing Chrome profiles
- Visual agent: Screenshot analysis with coordinate-based interactions
- Security: Domain restrictions, blocked URL patterns, sensitive action confirmation

## See Also

- [[subagents]] — Main concept page
- [[browser-agent]] — Detailed browser automation capabilities
- [[agent-definition-files]] — Custom subagent creation reference
- [[visual-agent]] — Screenshot-based automation
- [[tool-isolation]] — Security and permission control