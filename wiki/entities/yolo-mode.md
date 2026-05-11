---
type: entity
title: "YOLO Mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "approval"
  - "gemini-cli"
related:
  - "[[settings-command]]"
  - "[[sandboxing]]"
  - "[[context-aware-security]]"
  - "[[folder-trust]]"
sources: ["III. 19. Gemini CLI settings (`settings` command).md"]
---

# YOLO Mode

YOLO mode auto-approves all tool execution without requiring user confirmation. It provides the fastest workflow but with maximum risk.

## Overview

When YOLO mode is enabled, Gemini CLI executes all tool actions immediately without prompting for approval. This includes file edits, shell commands, browser actions, and any other tool calls.

## Important Constraints

### CLI-Only Access

**YOLO mode cannot be set via the `/settings` command interface.** It is only available via command-line flags:

```bash
gemini --yolo
gemini --approval-mode=yolo
```

This intentional restriction ensures that:
- Users must consciously enable it per-session
- It cannot be accidentally left enabled via persistent settings
- The security implications are clear at activation time

### Security Settings Interaction

YOLO mode interacts with other security settings:

- `security.disableYoloMode` — When set to `true`, YOLO mode is force-disabled even if the flag is provided
- `security.disableAlwaysAllow` — Disables "Always allow" options in tool confirmation dialogs

## Default Approval Modes

The `/settings` interface supports three default approval modes (not YOLO):

| Mode | Behavior |
|------|----------|
| `"default"` | Prompts for approval on all actions |
| `"auto_edit"` | Auto-approves edit tools only |
| `"plan"` | Read-only mode, no tool execution |

These are configurable via `general.defaultApprovalMode` but YOLO must be set via command-line.

## When to Use YOLO Mode

YOLO mode is appropriate when:
- Running well-tested, non-destructive scripts
- Batch processing with known safe operations
- Debugging with full visibility into what will happen

YOLO mode should be avoided when:
- Running unfamiliar or untrusted code
- Making changes to production systems
- Working with file deletion or modification operations

## Security Recommendations

1. **Use sparingly** — Reserve for trusted, well-understood operations
2. **Combine with sandboxing** — Enable `security.toolSandboxing` when using YOLO mode
3. **Consider Folder Trust** — Use `security.folderTrust.enabled` to limit YOLO effects to trusted workspaces
4. **Check disable flags** — Review `security.disableYoloMode` if security is paramount