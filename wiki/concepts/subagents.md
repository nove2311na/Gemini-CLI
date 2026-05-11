---
type: concept
title: "Subagents"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "multi-agent"
  - "delegation"
  - "specialization"
  - "context-management"
related:
  - "[[gemini-cli]]"
  - "[[codebase-investigator]]"
  - "[[cli-help]]"
  - "[[generalist]]"
  - "[[browser-agent]]"
  - "[[agent-definition-files]]"
  - "[[tool-isolation]]"
sources: ["III. 15. Subagents.md"]
---

# Subagents

Subagents are specialized agents that operate within your main Gemini CLI session. They are "specialists" designed to handle specific, complex tasks without cluttering the main agent's context or toolset.

## Core Concept

Subagents provide a modular approach to AI delegation:

- **Focused context:** Each subagent has its own system prompt and persona
- **Specialized tools:** Subagents can have restricted or specialized tool access
- **Independent context window:** Interactions happen in a separate context loop, saving tokens in main conversation history
- **Exposed as tools:** Subagents appear as tools the main agent can invoke

## How Subagents Work

When the main agent calls a subagent tool, it delegates the task. Once complete, the subagent reports back with findings. This enables:

1. Task-specific expertise without full context switching
2. Token-efficient processing by isolating conversation history
3. Fine-grained control over tool access and permissions

## Invocation Methods

### Automatic Delegation

Gemini CLI's main agent is instructed to use specialized subagents when a task matches their expertise. Example: asking "How does the auth system work?" may trigger the `codebase_investigator` subagent.

### Explicit Invocation (@ syntax)

Force routing to a specific subagent using `@` symbol:

```bash
@codebase_investigator Map out the relationship between the AgentRegistry and the LocalAgentExecutor.
```

This injects a system note that nudges the primary model to use that specific subagent immediately.

## Built-in Subagents

| Subagent | Purpose | Use Case |
|----------|---------|----------|
| `codebase_investigator` | Deep codebase analysis | Understanding complex dependencies |
| `cli_help` | Gemini CLI documentation | Configuration and usage questions |
| `generalist` | General-purpose tasks | Multi-file refactors, high-volume execution |
| `browser_agent` | Web browser automation | Form filling, navigation, data extraction |

## Custom Subagents

Create custom subagents using Markdown files with YAML frontmatter:

- **Project-level:** `.gemini/agents/*.md`
- **User-level:** `~/.gemini/agents/*.md`

See [[agent-definition-files]] for the full schema and examples.

## Security Features

### Tool Isolation

Subagents can have restricted tool access, preventing unintended side effects and state contamination. See [[tool-isolation]] for details.

### Recursion Protection

Subagents **cannot** call other subagents, preventing infinite loops and excessive token usage.

### Policy Engine Integration

Subagent-specific rules can be defined in the Policy Engine TOML configuration:

```toml
[[rules]]
name = "Allow pr-creator to push code"
subagent = "pr-creator"
action = "allow"
toolName = "run_shell_command"
commandPrefix = "git push"
```

## Managing Subagents

### Interactive Management

Use `/agents` command in an interactive session for quick enable/disable/configure operations.

### Persistent Configuration

Use `settings.json` for global overrides:

```json
{
  "agents": {
    "overrides": {
      "security-auditor": {
        "enabled": false,
        "runConfig": {
          "maxTurns": 20,
          "maxTimeMinutes": 10
        }
      }
    }
  }
}
```

## Remote Subagents

Gemini CLI can delegate to remote subagents using the Agent-to-Agent (A2A) protocol. See the remote agents documentation for configuration details.

## Extension Support

Extensions can bundle and distribute subagents, enabling sharing of specialized agents across teams.

## See Also

- [[codebase-investigator]] — Built-in code analysis subagent
- [[cli-help]] — Built-in CLI help subagent
- [[generalist]] — Built-in general-purpose subagent
- [[browser-agent]] — Experimental browser automation subagent
- [[agent-definition-files]] — Custom subagent creation
- [[tool-isolation]] — Security and permission control