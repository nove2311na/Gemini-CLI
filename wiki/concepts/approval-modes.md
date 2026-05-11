---
type: concept
title: "Approval Modes"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "approval"
  - "safety"
  - "settings"
related:
  - "/settings-command"
  - "settings-json"
  - "confirmation-prompts"
  - "yolo-mode"
sources: ["5. Gemini CLI cheatsheet.md", "6. Settings.md"]
---

# Approval Modes

Approval modes control how Gemini CLI handles authorization for tool execution. They represent a spectrum of security-safety trade-offs, from requiring explicit approval for every action to fully automated execution.

## Mode Hierarchy

| Mode | Setting Value | Behavior |
|------|---------------|----------|
| Default | `"default"` | Prompts for approval before tool execution |
| Auto-edit | `"auto_edit"` | Auto-approves edit tools, prompts for others |
| Plan | `"plan"` | Read-only mode, no tool execution |
| YOLO | CLI flag only | Auto-approves all actions |

## Default Mode

The default mode (`"default"`) requires user confirmation before any tool executes. This provides maximum safety and visibility into what the AI is doing.

```json
{
  "general": {
    "defaultApprovalMode": "default"
  }
}
```

## Auto-edit Mode

Auto-edit mode (`"auto_edit"`) automatically approves file editing operations while prompting for other potentially more impactful actions like shell commands.

Suitable for users who trust the model's file editing capabilities but want to review destructive operations.

## Plan Mode

Plan mode (`"plan"`) prevents any tool execution, making Gemini CLI read-only. This is useful for:

- Reviewing proposed changes before execution
- Writing plans and documentation without side effects
- Auditing what the AI would do before committing

Related to [[plan-mode]] which provides a structured planning environment within this mode.

## YOLO Mode

> [!IMPORTANT]
> YOLO mode can only be enabled via CLI flags (`--yolo` or `--approval-mode=yolo`). It is intentionally not available through `/settings` or `settings.json`.

YOLO mode auto-approves all actions without any confirmation prompts. This is the fastest mode but offers no safety net.

**Use cases:**
- Trusted scripts and automation
- Experienced users running well-understood operations
- Batch processing where interaction overhead is prohibitive

## Security Settings Interaction

Additional security settings refine approval behavior:

- `security.disableAlwaysAllow` — Remove "Always allow" option from dialogs
- `security.enablePermanentToolApproval` — Enable "Allow for all future sessions"
- `security.autoAddToPolicyByDefault` — Make permanent approval the default choice

## Related Concepts

- [[confirmation-prompts]] — The UI mechanism for approval dialogs
- [[yolo-mode]] — The CLI-only fully automated mode
- [[plan-mode]] — Read-only mode with structured planning
- [[/settings-command]] — Configuring approval modes via settings