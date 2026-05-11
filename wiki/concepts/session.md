---
type: concept
title: "Session"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "context"
  - "memory"
  - "history"
related:
  - "[[session-management]]"
  - "[[gemini-cli]]"
  - "[[checkpointing]]"
sources: ["5-manage-sessions-and-history.md"]
---

# Session

A session in Gemini CLI represents a single continuous conversation thread between the user and the AI agent. It encapsulates the conversation history, the project context (files read, shell commands executed), and the agent's short-term memory.

## Key Components of a Session

1. **Conversation History:** A sequence of turns (user prompts and agent responses).
2. **Context:** The specific set of files and directory structures the agent has analyzed.
3. **State:** The current progress of active tasks or plans.
4. **Checkpointing:** Automatic snapshots taken to ensure state can be recovered or reverted.

## Session Lifecycle

- **Creation:** A new session starts when `gemini` is run without the `-r` (resume) flag.
- **Persistence:** Sessions are automatically saved to the local database.
- **Resumption:** Users can return to a previous session using the `/resume` command or the `-r` flag.
- **Termination:** A session ends when the user exits the CLI.

## Interactive Sessions vs. Headless Mode

- **Interactive Sessions:** Provide a REPL (Read-Eval-Print Loop) for real-time collaboration.
- **Headless Mode:** Single-turn or script-driven execution where the session typically ends after the response is delivered, though it can still be resumed later.

## See Also

- [[session-management]] — Techniques for managing multiple sessions
- [[checkpointing]] — The technical mechanism for session persistence
- [[rewind-feature]] — Reverting a session to a previous state
