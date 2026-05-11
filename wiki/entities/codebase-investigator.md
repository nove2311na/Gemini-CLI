---
type: entity
title: "Codebase Investigator"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "subagent"
  - "built-in"
  - "code-analysis"
related:
  - "[[subagents]]"
  - "[[gemini-cli]]"
sources: ["III. 15. Subagents.md"]
---

# Codebase Investigator

The `codebase_investigator` is a built-in subagent in Gemini CLI designed for deep codebase analysis, reverse engineering, and understanding complex dependencies.

## Purpose

When asked about how code systems work, this subagent performs focused research by examining the actual codebase rather than relying on potentially outdated documentation or general knowledge.

## Usage Scenarios

- "How does the authentication system work?"
- "Map out the dependencies of the `AgentRegistry` class"
- "What files are involved in the payment processing flow?"
- "Trace the execution path from user login to session creation"

## Configuration

The subagent is enabled by default. Override settings in `settings.json` under `agents.overrides`:

```json
{
  "agents": {
    "overrides": {
      "codebase_investigator": {
        "modelConfig": { "model": "gemini-3-flash-preview" },
        "runConfig": { "maxTurns": 50 }
      }
    }
  }
}
```

## Key Features

- **Focused context:** Operates in its own context loop, saving tokens in main conversation
- **Specialized tools:** Has access to code reading and search tools
- **Independent context window:** Research results reported back to main agent

## Invocation

Can be invoked explicitly using `@syntax`:
```
@codebase_investigator Map out the relationship between the AgentRegistry and the LocalAgentExecutor.
```

## See Also

- [[subagents]] — General subagent documentation
- [[cli-help]] — Another built-in subagent for CLI help
- [[generalist]] — General-purpose subagent
- [[browser-agent]] — Experimental browser automation subagent