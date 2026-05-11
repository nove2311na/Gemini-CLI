---
type: concept
title: "Hook Exit Codes"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "hooks"
  - "exit-codes"
  - "reference"
related:
  - "[[hooks]]"
  - "[[hook-events]]"
  - "[[hook-security]]"
sources: ["1. Gemini CLI hooks.md"]
---

# Hook Exit Codes

Gemini CLI uses exit codes to determine the high-level outcome of a hook execution. Understanding these codes is essential for building reliable hooks.

## Exit Code Reference

| Exit Code | Label | Behavioral Impact |
|-----------|-------|-------------------|
| **0** | **Success** | `stdout` is parsed as JSON. **Preferred code** for all logic, including intentional blocks via `{"decision": "deny"}` |
| **2** | **System Block** | **Critical Block**. Target action (tool, turn, or stop) is aborted. `stderr` is used as rejection reason. High severity; used for security stops or script failures |
| **Other** | **Warning** | Non-fatal failure. A warning is shown, but interaction proceeds using original parameters |

## Recommended Usage

### Preferred: Exit 0 with JSON Decision

```json
{"decision": "deny"}
```

This is the **preferred approach** for graceful blocks. Exit 0 signals success, and the JSON response carries the decision.

```bash
#!/bin/bash
# Check something...
if [ "$dangerous_condition" = true ]; then
  echo '{"decision": "deny", "reason": "Operation blocked: dangerous condition"}' >&1
  exit 0
fi
echo '{"decision": "allow"}' >&1
exit 0
```

### Critical Blocks: Exit 2

Exit 2 should be reserved for critical security stops or when the script itself fails. The `stderr` content is used as the rejection reason shown to the user.

```bash
#!/bin/bash
if [ -z "$required_api_key" ]; then
  echo "ERROR: Required API key not found in environment" >&2
  exit 2
fi
```

### Warning Only: Other Exit Codes

Exit codes other than 0 or 2 indicate non-fatal failures. The operation proceeds despite the warning, making these suitable for non-critical validation.

## Exit Code Selection Guide

| Scenario | Recommended Exit Code |
|----------|------------------------|
| Normal operation (allow) | 0 with `{"decision": "allow"}` |
| Graceful policy denial | 0 with `{"decision": "deny"}` |
| Security critical block | 2 |
| Script failure / crash | 2 |
| Non-critical warning | Other (1, 3, etc.) |
