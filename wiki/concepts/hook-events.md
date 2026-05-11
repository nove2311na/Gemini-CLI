---
type: concept
title: "Hook Events"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "hooks"
  - "lifecycle"
  - "reference"
related:
  - "[[hooks]]"
  - "[[hook-exit-codes]]"
  - "[[session]]"
sources: ["1. Gemini CLI hooks.md"]
---

# Hook Events

Hook events are the trigger points in Gemini CLI's lifecycle that determine when hooks execute and what they can intercept. There are 11 total events across four categories.

## Lifecycle Events

| Event | When It Fires | Impact | Common Use Cases |
|-------|---------------|--------|------------------|
| `SessionStart` | When a session begins (startup, resume, clear) | Inject Context | Initialize resources, load context |
| `SessionEnd` | When a session ends (exit, clear) | Advisory | Clean up, save state |
| `PreCompress` | Before context compression | Advisory | Save state, notify user |
| `Notification` | When a system notification occurs | Advisory | Forward to desktop alerts, logging |

## Turn-Level Events

| Event | When It Fires | Impact | Common Use Cases |
|-------|---------------|--------|------------------|
| `BeforeAgent` | After user submits prompt, before planning | Block Turn / Context | Add context, validate prompts, block turns |
| `AfterAgent` | When agent loop ends | Retry / Halt | Review output, force retry or halt execution |

## Model-Level Events

| Event | When It Fires | Impact | Common Use Cases |
|-------|---------------|--------|------------------|
| `BeforeModel` | Before sending request to LLM | Block Turn / Mock | Modify prompts, swap models, mock responses |
| `AfterModel` | After receiving LLM response | Block Turn / Redact | Filter/redact responses, log interactions |

## Tool-Level Events

| Event | When It Fires | Impact | Common Use Cases |
|-------|---------------|--------|------------------|
| `BeforeToolSelection` | Before LLM selects tools | Filter Tools | Filter available tools, optimize selection |
| `BeforeTool` | Before a tool executes | Block Tool / Rewrite | Validate arguments, block dangerous ops |
| `AfterTool` | After a tool executes | Block Result / Context | Process results, run tests, hide results |

## Impact Types Summary

**Block Turn**: `BeforeAgent`, `BeforeModel` — Can halt execution entirely  
**Filter Tools**: `BeforeToolSelection` — Can restrict available tools  
**Advisory**: `SessionEnd`, `PreCompress`, `Notification` — Inform only, no blocking  
**Tool Control**: `BeforeTool`, `AfterTool` — Can block or modify tool execution

## Matchers

Matchers filter which specific tools or triggers fire a hook:

- **Tool events** (`BeforeTool`, `AfterTool`): Matchers are **Regular Expressions** (e.g., `"write_.*"`)
- **Lifecycle events**: Matchers are **Exact Strings** (e.g., `"startup"`)
- **Wildcards**: `"*"` or empty string matches all occurrences
