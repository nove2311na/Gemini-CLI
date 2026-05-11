---
type: concept
title: "Hook Security"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "hooks"
  - "security"
  - "fingerprinting"
related:
  - "[[hooks]]"
  - "[[hook-exit-codes]]"
  - "[[sandboxing]]"
sources: ["1. Gemini CLI hooks.md"]
---

# Hook Security

Security is a critical consideration when using hooks, particularly for project-level hooks that may execute in untrusted environments.

## The Golden Rule

**Hooks must output only valid JSON to stdout.** This is the single most important security principle for hook development.

- **Silence is Mandatory**: Your script must not print any plain text to `stdout` other than the final JSON object
- **Even a single `echo` or `print` call before the JSON will break parsing**
- **Pollution = Failure**: If `stdout` contains non-JSON text, parsing fails and the CLI defaults to "Allow"
- **Debug via Stderr**: Use `stderr` for all logging and debugging (e.g., `echo "debug" >&2`)

## Fingerprinting

Gemini CLI **fingerprints project-level hooks** to detect tampering:

- When a hook's name or command changes (e.g., via `git pull`), it is treated as a **new, untrusted hook**
- You will be warned before untrusted hooks execute
- This protects against supply chain attacks where malicious hooks are injected into repositories

## Environment Sanitization

Hooks execute with a sanitized environment containing only:

- `GEMINI_PROJECT_DIR`: The absolute path to the project root
- `GEMINI_PLANS_DIR`: The absolute path to the plans directory
- `GEMINI_SESSION_ID`: The unique ID for the current session
- `GEMINI_CWD`: The current working directory
- `CLAUDE_PROJECT_DIR`: (Alias for compatibility)

## Configuration Precedence

Configuration precedence (highest to lowest) determines which hook definitions take priority:

1. **Project settings**: `.gemini/settings.json` in the current directory
2. **User settings**: `~/.gemini/settings.json`
3. **System settings**: `/etc/gemini-cli/settings.json`
4. **Extensions**: Hooks defined by installed extensions

## Dangerous Default Behavior

If JSON parsing fails, the CLI defaults to "Allow" — this is particularly dangerous for security-oriented hooks. Misconfigured security checks could silently pass, allowing potentially harmful operations.

**Best Practice**: Always validate your hook's JSON output before deploying to production.

## Related Concepts

- [[hook-exit-codes]] — Understanding exit code implications for security hooks
- [[sandboxing]] — Isolation mechanisms for hook execution
- [[hooks]] — The overall hook system
