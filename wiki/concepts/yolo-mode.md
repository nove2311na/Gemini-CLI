---
type: concept
title: "YOLO Mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "approval"
  - "automation"
  - "cli-flag"
related:
  - "approval-modes"
  - "confirmation-prompts"
  - "/settings-command"
sources: ["2. Enterprise configuration.md", "6. Settings.md"]
---

# YOLO Mode

YOLO mode is the most permissive approval setting in Gemini CLI, automatically approving all tool executions without any confirmation prompts. It represents the opposite end of the security-safety spectrum from the default approval mode.

## Enabling YOLO Mode

> [!CAUTION]
> YOLO mode can only be enabled via command-line flags. It is intentionally not accessible through the `/settings` command or `settings.json` file.

YOLO mode is CLI-only by design:

```bash
gemini --yolo
# or
gemini --approval-mode=yolo
```

## Security Design Rationale

The restriction of YOLO mode to CLI flags only is a deliberate safety choice:

1. **Accidental activation prevention** — Settings files persist and might be shared with unintended configurations
2. **Explicit opt-in per session** — Each invocation requiring YOLO is a conscious decision
3. **Audit trail** — Command-line usage leaves clear history in shell commands

## Security Override Setting

The `security.disableYoloMode` setting can force-disable YOLO mode even if passed via CLI:

```json
{
  "security": {
    "disableYoloMode": true
  }
}
```

This is useful in environments where maximum control is required.

## Related Concepts

- [[approval-modes]] — The full spectrum of approval modes
- [[confirmation-prompts]] — The default approval mechanism
- [[plan-mode]] — Read-only mode at the opposite end of the spectrum
- [[/settings-command]] — Settings that control security behavior