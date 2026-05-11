---
type: concept
title: "Confirmation Prompts"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "safety"
  - "security"
  - "approval"
related:
  - "[[shell-commands]]"
  - "[[sandboxing]]"
  - "[[gemini-cli]]"
sources: ["4. Execute shell commands.md"]
---

# Confirmation Prompts

Confirmation prompts are the primary safety mechanism preventing unauthorized shell command execution in Gemini CLI. Every shell command requested by the AI requires explicit user approval before execution.

## Prompt Format

When the AI requests a shell command, you see a prompt such as:

```
Allow command 'npm test'? [y/N]
```

## Response Options

**Allow once:** Approves the specific command for one execution only. Future executions of the same command will prompt again.

**Allow always:** Trusts this specific command pattern for the remainder of the session. The command will execute without further prompts.

**Deny:** Refuses the command and stops the agent from proceeding with this action.

## Security Considerations

The "Allow always" option creates session-level trust for a command. This is convenient but means the AI can execute that command freely without additional confirmation until the session ends. Consider:

- Only use "Allow always" for trusted, non-destructive commands
- Be cautious with commands that modify files, delete data, or execute code
- Session trust is harder to revoke than per-command approval

## Default Behavior

By default, every shell command requires explicit approval. This default-first approach ensures that no shell command executes without user awareness, even if the AI was instructed to run commands autonomously.

## Relationship to Sandboxing

Confirmation prompts and [[sandboxing]] work together as layered security. Prompts provide human oversight and approval; sandboxing provides containment even after approval is granted.