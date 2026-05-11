---
type: concept
title: "Sandbox Expansion"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "permissions"
  - "dynamic-access"
  - "gemini-cli"
related:
  - "[[sandboxing]]"
  - "[[confirmation-prompts]]"
  - "[[shells-command]]"
sources: ["III. 18. Sandboxing in Gemini CLI.md"]
---

# Sandbox Expansion

Sandbox expansion is a dynamic permission system that allows Gemini CLI to request additional permissions for a command when needed. When a sandboxed command encounters permission restrictions or when a command is identified as requiring extra permissions, Gemini CLI presents a "Sandbox Expansion Request" to the user for approval.

## How It Works

The sandbox expansion workflow consists of three stages:

1. **Detection**: Gemini CLI detects a sandbox denial (e.g., restricted file paths, network access) or proactively identifies a command that requires extra permissions (like `npm install`)
2. **Request**: A modal dialog appears, explaining which additional permissions are required (specific directories or network access)
3. **Approval**: If approved, the command executes with extended permissions for that specific run

## Security Implications

This mechanism ensures users maintain control over what the AI can access while eliminating the need to manually re-run commands with more permissive sandbox settings. Each expansion request is specific to a single execution, preventing broad permission grants.

## Including External Files

By default, the sandbox only has access to the current project workspace. To grant access to files or directories outside the project workspace, use the `SANDBOX_MOUNTS` environment variable with comma-separated mount definitions:

```bash
export SANDBOX_MOUNTS="/path/on/host:/path/in/container:rw,/another/path:ro"
```

Format: `from:to:opts` where:
- `from`: Absolute path on host (required)
- `to`: Path inside container (defaults to same as `from`)
- `opts`: `rw` (read-write) or `ro` (read-only, default)

## Related Concepts

- [[sandboxing]] — Core sandboxing concept
- [[confirmation-prompts]] — User approval mechanisms
- [[shells-command]] — Commands that trigger sandbox expansion