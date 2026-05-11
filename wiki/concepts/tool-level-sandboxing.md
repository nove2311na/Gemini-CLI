---
type: concept
title: "Tool-Level Sandboxing"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "granular-isolation"
  - "gemini-cli"
related:
  - "[[sandboxing]]"
  - "[[run-shell-command-tool]]"
  - "[[shells-command]]"
sources: ["III. 18. Sandboxing in Gemini CLI.md"]
---

# Tool-Level Sandboxing

Tool-level sandboxing provides granular isolation for individual tool executions (such as `shell_exec` and `write_file`) instead of sandboxing the entire Gemini CLI process. This approach offers better integration with the local environment for non-tool tasks while still providing security for tool-driven operations.

## How It Differs from Full-Process Sandboxing

| Aspect | Full-Process Sandbox | Tool-Level Sandbox |
|--------|--------------------|--------------------|
| **Scope** | Entire CLI process | Individual tools only |
| **Local Integration** | Limited | Better (UI, config loading) |
| **Isolation** | Stronger | Per-tool granularity |
| **UX Impact** | Higher isolation, lower convenience | Lower isolation, higher convenience |

## Configuration

Tool-level sandboxing is enabled by default. To disable it and use full-process isolation instead, set `security.toolSandboxing` to `false` in `settings.json`:

```json
{
  "security": {
    "toolSandboxing": false
  }
}
```

## Use Cases

- **Prefer Tool-Level When**: You need seamless local environment integration, configuration loading works better locally, UI interactions function normally
- **Prefer Full-Process When**: Maximum isolation is required, working with untrusted code, security is paramount over convenience

## Trade-off Considerations

Tool-level sandboxing offers better user experience but provides less isolation than full-process sandboxing. The choice depends on:
- Security requirements of the task
- Need for local environment integration
- Tolerance for potential risks

## Related Concepts

- [[sandboxing]] — Core sandboxing concept
- [[run-shell-command-tool]] — Tool being isolated by sandboxing
- [[shells-command]] — Shell execution context