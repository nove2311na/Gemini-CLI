---
type: concept
title: "Sandbox Profiles (macOS)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "macos"
  - "seatbelt"
  - "security"
  - "sandbox-exec"
  - "gemini-cli"
related:
  - "[[sandboxing]]"
  - "[[shells-command]]"
sources: ["III. 18. Sandboxing in Gemini CLI.md"]
---

# Sandbox Profiles (macOS)

macOS sandboxing uses Seatbelt (`sandbox-exec`) with predefined restriction profiles. These profiles provide fine-grained control over what operations the sandboxed process can perform, balancing security with usability.

## Available Profiles

| Profile | Write Restrictions | Network | Use Case |
|---------|-------------------|---------|----------|
| `permissive-open` (default) | Write restricted to project | Allowed | General development |
| `permissive-proxied` | Write restricted to project | Via proxy only | Restricted network environments |
| `restrictive-open` | Strict write restrictions | Allowed | Untrusted code execution |
| `restrictive-proxied` | Strict write restrictions | Via proxy only | Maximum local security |
| `strict-open` | Read/write restrictions | Allowed | Sensitive file operations |
| `strict-proxied` | Read/write restrictions | Via proxy only | Isolated sensitive operations |

## Setting the Profile

Set the profile using the `SEATBELT_PROFILE` environment variable:

```bash
export SEATBELT_PROFILE=restrictive-open
gemini -s -p "analyze code"
```

## Profile Selection Guidelines

- **permissive-open/proxied**: Default for most development tasks
- **restrictive-open/proxied**: When working with potentially untrusted code
- **strict-open/proxied**: For sensitive file operations requiring maximum isolation

## Related Concepts

- [[sandboxing]] — Core sandboxing concept
- [[shells-command]] — Shell execution with sandboxing