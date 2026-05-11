---
type: concept
title: "Shell Injection"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "custom-commands"
  - "shell-commands"
  - "dynamic-prompts"
related:
  - "[[custom-commands]]"
  - "[[shell-commands]]"
  - "[[argument-injection]]"
  - "[[confirmation-prompts]]"
sources: ["1. Custom commands.md"]
---

# Shell Injection

Shell injection allows custom commands to execute shell commands directly within prompts and inject their output. This enables dynamic prompts based on live data like git diffs, grep results, or any command output.

## Syntax

Use the `!{...}` syntax to inject shell command output:

```toml
prompt = """
Please generate a Conventional Commit message based on the following git diff:

```diff
!{git diff --staged}
```
"""
```

## How It Works

1. **Inject commands**: The `!{...}` syntax marks commands for execution
2. **Argument substitution**: If `{{args}}` is present inside the block, it is automatically shell-escaped
3. **Security check**: The CLI performs a security check and prompts for confirmation before execution
4. **Error reporting**: If the command fails, the injected content will include stderr and a status line

## Security Features

When `{{args}}` is used inside `!{...}` blocks:
- Arguments are automatically shell-escaped
- The CLI prompts for confirmation showing the exact command to be executed
- This prevents command injection vulnerabilities

## Relationship to Shell Commands

Shell injection in custom commands is a specialized, safer form of [[shell-commands]]. While the general shell command feature provides interactive shell access, shell injection in commands provides a safer wrapper for recurring shell patterns that can be saved and shared.

See also: [[confirmation-prompts]] for the security confirmation UX.