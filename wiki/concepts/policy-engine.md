---
type: concept
title: "Policy Engine"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "policy-engine"
  - "security"
  - "tool-restrictions"
  - "customization"
related:
  - "[[plan-mode]]"
  - "[[approval-modes]]"
  - "[[tool-restrictions]]"
sources: ["III. 14. Plan Mode.md"]
---

# Policy Engine

The policy engine is a system that manages tool restrictions, safety policies, and approval modes across Gemini CLI. It provides a configurable framework for controlling which tools can execute in different contexts, ensuring safe and predictable behavior while allowing customization for specific workflows.

## Overview

The policy engine operates on a tiered system of rules that determine tool behavior:

- **Tier 1 (Built-in):** Default policies defined in `plan.toml` and system configurations
- **Tier 2 (Custom):** User-defined policies in `~/.gemini/policies/` directory

This separation ensures that built-in safety guarantees remain intact while allowing users to extend behavior for their specific needs.

## Rule Structure

Policies are defined in TOML format with a consistent structure:

```toml
[[rule]]
toolName = "tool_name"
decision = "allow" | "deny"
priority = 100
modes = ["plan", "default", "autoEdit"]
```

### Rule Properties

| Property | Description |
|----------|-------------|
| `toolName` | Name of the tool to target (supports wildcards with `*`) |
| `commandPrefix` | Match specific command patterns (e.g., `git status`) |
| `mcpName` | Target MCP server name (wildcard supported) |
| `toolAnnotations` | Metadata-based matching (e.g., `readOnlyHint = true`) |
| `decision` | Whether to allow or deny the tool |
| `priority` | Higher priority rules take precedence |
| `modes` | Which approval modes the rule applies to |

## Global vs. Mode-Specific Rules

A fundamental principle of the policy engine is that rules without explicit mode specification apply to **all modes**, including Plan Mode. This ensures consistent safety behavior.

However, the context-aware trust system introduces nuance:

- **Approvals in Default/Auto-Edit:** Do not apply to Plan Mode (maintains research safety)
- **Approvals in Plan Mode:** Treated as intentional global trust and apply to all modes

### Example: Restricting a Tool to Non-Plan Modes

To allow `npm test` in Default and Auto-Edit modes but not in Plan Mode:

```toml
[[rule]]
toolName = "run_shell_command"
commandPrefix = "npm test"
decision = "allow"
priority = 100
modes = ["default", "autoEdit"]
```

By omitting `"plan"` from the modes array, this rule will not be active in Plan Mode.

## Custom Policy Examples

### Auto-Approve Read-Only MCP Tools

By default, read-only MCP tools require confirmation in Plan Mode. Auto-approve them:

`~/.gemini/policies/mcp-read-only.toml`

```toml
[[rule]]
toolName = "*"
mcpName = "*"
toolAnnotations = { readOnlyHint = true }
decision = "allow"
priority = 100
modes = ["plan"]
```

### Allow Git Commands in Plan Mode

Enable repository exploration during planning:

`~/.gemini/policies/git-research.toml`

```toml
[[rule]]
toolName = "run_shell_command"
commandPrefix = ["git status", "git diff"]
decision = "allow"
priority = 100
modes = ["plan"]
```

### Enable Custom Subagents

Allow custom research subagents alongside built-in ones:

`~/.gemini/policies/research-subagents.toml`

```toml
[[rule]]
toolName = "my_custom_subagent"
decision = "allow"
priority = 100
modes = ["plan"]
```

## Custom Plan Directories

When configuring custom plan directories (e.g., `.gemini/plans` within a project), update policies to allow writes:

`~/.gemini/policies/plan-custom-directory.toml`

```toml
[[rule]]
toolName = ["write_file", "replace"]
decision = "allow"
priority = 100
modes = ["plan"]
argsPattern = "\"file_path\":\"[^\"]+[\\\\/]+\\.gemini[\\\\/]+plans[\\\\/]+[\\w-]+\\.md\""
```

## Approval Modes Integration

The policy engine manages the four approval modes:

| Mode | Description |
|------|-------------|
| **Default** | Standard behavior with explicit approvals |
| **Auto-Edit** | Auto-approves non-destructive file modifications |
| **Plan** | Strictly read-only with comprehensive safety policies |
| **YOLO** | Auto-executes all approved tools without confirmation |

Mode-specific rules allow granular control over tool behavior in each context.

## Safety Guarantees

The policy engine enforces several safety guarantees:

1. **Tier 1 policies cannot be weakened** — Custom policies can only add restrictions, not remove built-in ones
2. **Custom directories are bounded** — User-configured paths must reside within the project root
3. **Context-aware approvals** — Tools trusted in implementation mode don't automatically execute during research

## Related Concepts

- [[plan-mode]] — Feature that relies on policy engine restrictions
- [[approval-modes]] — The modes that policy engine manages
- [[tool-restrictions]] — Specific restrictions enforced in Plan Mode