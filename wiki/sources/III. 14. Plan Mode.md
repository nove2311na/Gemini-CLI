---
type: source
title: "Plan Mode"
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/plan-mode/"
venue: "geminicli.com"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "plan-mode"
  - "feature-documentation"
  - "safety"
  - "policy-engine"
  - "model-routing"
related:
  - "[[plan-mode]]"
  - "[[policy-engine]]"
  - "[[approval-modes]]"
  - "[[automatic-model-routing]]"
  - "[[tool-restrictions]]"
sources: ["III. 14. Plan Mode.md"]
---

# Plan Mode

**Plan Mode** is a read-only environment for architecting robust solutions before implementation. It enables structured exploration, design, and planning without risking accidental code changes.

## Key Characteristics

- **Read-only safety:** Enforces strict tool restrictions to prevent accidental modifications during research and design phases
- **Three-phase workflow:** Research (read-only exploration) → Design (evaluate trade-offs) → Plan (formalize execution strategy)
- **Collaborative planning:** Allows direct editing of plan files for precise refinement
- **Automatic model routing:** Uses Pro models for planning quality, Flash models for implementation speed

## Entry Mechanisms

| Method | Description |
|--------|-------------|
| Shift+Tab | Cycle through approval modes |
| `/plan [goal]` | Enter Plan Mode with optional goal context |
| Natural language | Ask to "start a plan for..." |
| Settings | Configure "Default Approval Mode" to "Plan" |
| Command line | `gemini --approval-mode=plan` |

## Tool Restrictions

Plan Mode allows only read-only and planning tools:

- **FileSystem (Read):** `read_file`, `list_directory`, `glob`
- **Search:** `grep_search`, `google_web_search`, `web_fetch`, `get_internal_docs`
- **Research Subagents:** `codebase_investigator`, `cli_help`
- **Interaction:** `ask_user`
- **MCP (Read):** Read-only MCP tools and core resources
- **Planning (Write):** `write_file` and `replace` only for `.md` files in plans directory
- **Memory:** `save_memory`
- **Skills:** `activate_skill` (read-only activation)

## Customization Options

- **Agent Skills:** Specialized instructions for domain-specific planning (e.g., Security Audit, Database Migration)
- **Custom Policies:** Extend tool restrictions via `~/.gemini/policies/` directory
- **Custom Plan Directory:** Store plans in project directories like `.gemini/plans`
- **Hooks:** Automate workflows on `enter_plan_mode` and `exit_plan_mode` transitions
- **Custom Subagents:** Enable additional research subagents via policy rules

## Automatic Model Routing

When using auto model selection:

1. **Planning Phase:** Routes to high-reasoning **Pro** model for robust architectural decisions
2. **Implementation Phase:** Switches to high-speed **Flash** model after plan approval

Configurable via `settings.json` with `general.plan.modelRouting: false` to disable.

## Non-Interactive Execution

Optimized for CI/CD and headless environments:

- Auto-approves `enter_plan_mode` and `exit_plan_mode` tools
- Switches to **YOLO mode** for automated implementation execution
- Command: `gemini --approval-mode plan -p "Analyze telemetry and suggest improvements"`

## See Also

- [[policy-engine]] — System for managing tool restrictions
- [[approval-modes]] — Framework for Default, Auto-Edit, Plan, and YOLO modes
- [[automatic-model-routing]] — Phase-based model optimization
- [[tool-restrictions]] — Detailed list of allowed/restricted tools
- [[combined-workflows]] — Integration patterns with other CLI features
- [[model-selection]] — Contrast with manual model selection
- [[7-use-plan-mode-with-model-steering-for-complex-tasks]] — Tutorial on combining Plan Mode with model steering