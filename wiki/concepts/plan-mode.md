---
type: concept
title: "Plan Mode"
created: 2026-01-15
updated: 2026-05-05
tags:
  - "plan-mode"
  - "safety"
  - "workflow"
  - "research"
  - "design"
related:
  - "[[policy-engine]]"
  - "[[approval-modes]]"
  - "[[automatic-model-routing]]"
  - "[[tool-restrictions]]"
  - "[[combined-workflows]]"
  - "[[model-steering]]"
  - "[[task-planning]]"
  - "[[todo-list]]"
sources: ["III. 14. Plan Mode.md", "6. Plan tasks with todos", "7-use-plan-mode-with-model-steering-for-complex-tasks"]
---

# Plan Mode

Plan Mode is a read-only environment for researching, designing, and planning robust solutions before implementation. It provides a safe, structured workspace where developers can explore their codebase, evaluate trade-offs, and align on execution strategy without risking accidental code changes.

## Overview

Plan Mode transforms complex development tasks into a controlled three-phase workflow: research (read-only exploration), design (evaluate trade-offs), and plan (formalize execution strategy). This structure prevents the common pitfall of diving into implementation before fully understanding the problem space.

The mode integrates seamlessly into development workflows through multiple entry mechanisms: keyboard shortcuts, natural language commands, or explicit configuration. This flexibility allows developers to switch between planning and execution modes as naturally as they would discuss a problem with a colleague.

## Core Workflow

### Phase 1: Research

Enter Plan Mode and explore the codebase in a strictly read-only state. Gemini CLI can:

- Read files with `read_file`
- List directories and find files with `glob`
- Search code patterns with `grep_search`
- Access web resources for documentation with `google_web_search` and `web_fetch`
- Invoke research subagents like `codebase_investigator` and `cli_help`

### Phase 2: Design

Discuss findings and proposed strategy with Gemini CLI. The agent uses `ask_user` to:

- Present different implementation options
- Clarify requirements and constraints
- Evaluate trade-offs between approaches
- Reach informal agreement before proceeding

**Key safety checkpoint:** Gemini CLI will stop and wait for your confirmation before drafting the formal plan.

### Phase 3: Plan

Once agreement is reached, Gemini CLI creates a detailed Markdown implementation plan. You can:

- View the plan file directly
- Press **Ctrl+X** to open in external editor
- Add comments or modify steps directly
- Approve, iterate, or cancel the plan

## Entry Mechanisms

| Method | Command/Shortcut | Description |
|--------|------------------|-------------|
| Keyboard | Shift+Tab | Cycle through approval modes |
| Command | `/plan [goal]` | Enter with optional goal context |
| Natural Language | "Start a plan for..." | Triggers `enter_plan_mode` tool |
| Settings | `/settings` | Set default approval mode to Plan |
| CLI Flag | `--approval-mode=plan` | Launch directly in Plan Mode |

## Tool Restrictions

Plan Mode enforces strict safety policies to prevent accidental modifications. Only these tools are allowed:

- **Read-only file operations:** `read_file`, `list_directory`, `glob`
- **Search tools:** `grep_search`, `google_web_search`, `web_fetch`, `get_internal_docs`
- **Research subagents:** `codebase_investigator`, `cli_help`
- **Interaction:** `ask_user`
- **MCP tools:** Read-only MCP tools and core resources
- **Planning writes:** `write_file` and `replace` only for `.md` files in plans directory
- **Memory:** `save_memory`
- **Skills:** `activate_skill` (read-only activation)

These restrictions are managed by the [[policy-engine]] and defined in `plan.toml`.

## Customization Options

### Agent Skills

Use specialized skills to customize planning for specific domains:

- **Database Migration** skill ensures data safety checks and rollback strategies
- **Security Audit** skill prompts exploration for specific vulnerabilities
- **Frontend Design** skill guides UI components and accessibility standards

Request a skill with: "Use the `<skill-name>` skill to plan..."

### Custom Policies

Extend tool restrictions via `~/.gemini/policies/` directory. Examples include:

- Auto-approving read-only MCP tools
- Allowing git commands for repository exploration
- Enabling custom research subagents

### Custom Plan Directories

Store plans in project directories (e.g., `.gemini/plans`) instead of the default temporary location. Requires updating policy configurations to allow writes to the custom directory.

### Hooks

Automate workflows on mode transitions:

```json
{
  "hooks": {
    "AfterTool": [{
      "matcher": "exit_plan_mode",
      "hooks": [{
        "name": "archive-plan",
        "type": "command",
        "command": "~/.gemini/hooks/archive-plan.sh"
      }]
    }]
  }
}
```

## Automatic Model Routing

When using auto model selection, Plan Mode automatically optimizes model routing:

1. **Planning Phase:** Routes to high-reasoning **Pro** model for robust architectural decisions
2. **Implementation Phase:** Switches to high-speed **Flash** model for faster implementation

Disable with:
```json
{
  "general": {
    "plan": {
      "modelRouting": false
    }
  }
}
```

## Collaborative Plan Editing

Directly edit plan files for precise refinement:

1. Press **Ctrl+X** to open plan in external editor
2. Modify, reorder, or comment on implementation steps
3. Save and close the editor
4. Gemini CLI detects changes and presents a refined plan

## Non-Interactive Execution

For CI/CD and headless environments:

```bash
gemini --approval-mode plan -p "Analyze telemetry and suggest improvements"
```

The CLI automatically:
- Approves `enter_plan_mode` and `exit_plan_mode` tools
- Switches to YOLO mode for automated implementation

## Cleanup

Plan files are automatically cleaned up with session data:

- **Default retention:** 30 days
- **Manual deletion:** `gemini --delete-session <index|id>` or via session browser
- **Custom directories:** Files must be managed manually

## Related Concepts

- [[task-planning]] — Creating structured task lists for complex goals
- [[todo-list]] — Real-time progress tracking during execution
- [[model-steering]] — Real-time corrections during active processing
- [[policy-engine]] — System for managing tool restrictions
- [[approval-modes]] — Framework for Default, Auto-Edit, Plan, and YOLO modes