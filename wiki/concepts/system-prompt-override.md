---
type: concept
title: "System Prompt Override"
created: 2026-05-05
updated: 2026-05-05
tags: ["system-prompt", "configuration", "customization", "advanced", "project-level"]
related: ["gemini-system-md", "gemini-write-system-md", "system-md-file", "variable-substitution", "gemini-env-file", "session"]
sources: ["7. System prompt override.md"]
---

# System Prompt Override

A mechanism that allows complete replacement of Gemini CLI's built-in system instructions with a custom Markdown file, enabling project-specific behavior enforcement or persona customization.

## Definition

System prompt override is a full replacement model — when enabled, the custom Markdown file completely supersedes the built-in default instructions. This is distinct from a merge or patch approach, meaning users must explicitly include any original instructions they wish to preserve.

## How It Works

1. A custom Markdown file contains system instructions
2. The `GEMINI_SYSTEM_MD` environment variable points to this file
3. Gemini CLI reads and uses the custom file instead of its built-in defaults
4. A `|⌐■_■|` indicator appears in the UI to signal custom mode

## Key Characteristics

| Aspect | Description |
|--------|-------------|
| **Replacement type** | Full replacement, not merge |
| **Scope** | Per-project when using `.gemini/system.md` |
| **Persistence** | Via `.gemini/.env` or shell export |
| **Visual feedback** | `|⌐■_■|` UI indicator |
| **Error handling** | Errors if file missing when override enabled |

## Use Cases

- **Strict project standards**: Enforce specific coding conventions, review requirements, or commit message formats
- **Custom personas**: Create specialized assistants for different tasks (code reviewer, documentation writer, security auditor)
- **Domain-specific guidance**: Include project architecture, domain vocabulary, or business rules in system instructions
- **Team consistency**: Share standardized behaviors across team members via version control

## Relationship to Sessions

The system prompt lives within [[session]] context. When override is configured per-project via `.gemini/.env`, it applies to all sessions in that project directory. The [[session-management]] system preserves this configuration alongside conversation history.

## Comparison with Extensions

[[Extensions]] package prompts, tools, and commands for sharing. System prompt override operates at a lower level, replacing the foundational instructions that govern all interactions. Extensions can complement overrides by providing additional tools or commands referenced within custom prompts.

## Best Practices

1. **Export before overriding**: Use `GEMINI_WRITE_SYSTEM_MD=1` to review built-in defaults first
2. **Preserve safety rules**: Ensure custom prompts include necessary safety and tool-operation instructions
3. **Use variable substitution**: Leverage placeholders to include dynamic content without manual maintenance
4. **Distinguish firmware from strategy**: Keep `system.md` minimal and operational; use `GEMINI.md` for high-level guidance

## See Also

- [[gemini-system-md]] — The primary environment variable
- [[gemini-write-system-md]] — Export workflow before overriding
- [[variable-substitution]] — Dynamic content injection
- [[system-md-file]] — The default file location
- [[gemini-env-file]] — Persistent configuration storage