---
type: concept
title: "Shell Commands"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "shell"
  - "automation"
  - "tool"
related:
  - "[[gemini-cli]]"
  - "[[shell-mode]]"
  - "[[sandboxing]]"
  - "[[confirmation-prompts]]"
  - "[[background-processes]]"
  - "[[run-shell-command-tool]]"
sources: ["4. Execute shell commands.md"]
---

# Shell Commands

Shell commands enable running builds, git management, and system automation directly within the Gemini CLI conversation. This capability bridges natural language interaction with actual command-line operations.

## Direct Execution with `!` Prefix

The `!` prefix provides immediate shell access without AI interpretation. Simply prepend any command with `!` to execute it directly:

```
!ls -la
!git status
!npm test
```

The command executes immediately and output prints to the terminal. Results are recorded in the current session context, allowing the model to reference them in follow-up prompts. Very large outputs may be truncated.

## Key Features

**Session Integration:** Commands and their outputs become part of the conversation history, enabling the AI to reason about command results and build upon them in subsequent prompts.

**Confirmation Required:** Every shell command initiated by the AI requires explicit user approval through confirmation prompts, ensuring no arbitrary code executes without oversight.

**Sandboxing Available:** For untrusted code or exploratory work, all shell commands can run inside Docker containers using the `--sandbox` flag.

## Common Use Cases

- Checking file sizes, git status, or directory contents
- Running builds and tests
- Managing git operations
- Starting development servers
- Executing npm/yarn scripts
- Running linting and formatting tools

## Related Concepts

[[shell-mode]] provides a toggle for continuous shell interaction. [[background-processes]] covers managing long-running tasks. [[confirmation-prompts]] and [[sandboxing]] are the safety mechanisms that make AI shell access secure.