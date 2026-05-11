---
type: entity
title: "Generalist Agent"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "subagent"
  - "built-in"
  - "general-purpose"
related:
  - "[[subagents]]"
  - "[[gemini-cli]]"
sources: ["III. 15. Subagents.md"]
---

# Generalist Agent

The `generalist` is a built-in subagent in Gemini CLI that provides a general, all-purpose agent with inherited tool access and configurations from the main agent.

## Purpose

The generalist is designed for executing broad, resource-heavy subtasks in an isolated conversation. It optimizes the main agent's context by returning only the final result of a given task.

## When to Use

Use the generalist agent when a task:
- Requires many steps
- Handles large volumes of information
- Needs the same full capabilities as the main agent

## Ideal Scenarios

### Multi-file Modifications

Applying refactors or fixing errors across several files at once. The generalist can make multiple edits while keeping the main conversation clean.

### High-volume Execution

Running commands or tests that produce extensive terminal output. Results are summarized and returned to the main agent.

### Action-oriented Research

Investigations where the agent needs to both search code and run commands or make edits to find a solution.

## Invocation

Explicit invocation using `@syntax`:
```
@generalist Refactor all error handling in the auth module to use the new Result type pattern.
```

## Key Features

- **Inherited tools:** Uses the same tool access as the main agent
- **Token savings:** Main conversation only receives the final result, not the entire execution trace
- **Isolated context:** Runs in its own conversation loop

## Configuration

Enabled by default. Override in `settings.json` under `agents.overrides` if needed.

## See Also

- [[subagents]] — General subagent documentation
- [[codebase-investigator]] — Code analysis subagent
- [[cli-help]] — CLI help subagent
- [[browser-agent]] — Browser automation subagent