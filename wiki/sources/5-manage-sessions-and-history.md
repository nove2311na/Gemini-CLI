---
type: source
title: "Manage Sessions and History"
created: 2026-01-15
updated: 2026-05-05
tags:
  - "tutorial"
  - "session-management"
  - "workflow"
related:
  - "[[session]]"
  - "[[session-management]]"
  - "[[rewind-feature]]"
  - "[[selective-reversion]]"
  - "[[forking-conversations]]"
  - "[[checkpointing]]"
sources: ["5. Manage sessions and history.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/tutorials/session-management/"
venue: "Gemini CLI Documentation"
---

# Manage Sessions and History

This tutorial from the official Gemini CLI documentation covers the complete workflow for managing conversation sessions, including resumption, deletion, rewind, and forking capabilities.

## Core Capabilities

### Session Resumption

Gemini CLI provides multiple ways to resume past conversations:

- **Quick resume** (`gemini -r`) — Instantly restores the most recent session with full chat history and memory
- **Interactive browser** (`/resume`) — Searchable list showing timestamps, first messages, and turn counts for all past sessions

The resumption feature is designed specifically for context-switching scenarios, allowing developers to pause work on one task and seamlessly continue on another.

### Session Deletion

Sessions can be removed at multiple levels:

1. **Inline browser deletion** — Navigate to a session in `/resume` and press `x` to permanently delete
2. **CLI deletion** — `gemini --delete-session <id>` for targeted removal
3. **Exit-time cleanup** — `/exit --delete` removes the current session's history and tool output files before exiting

The `/exit --delete` pattern is particularly useful for privacy-sensitive tasks or one-off interactions where no session history should remain.

### The Rewind Feature

The rewind mechanism operates as a three-part decision process:

1. **Choose the restore point** — Select which interaction to undo from a list of recent exchanges
2. **Choose what to revert**:
   - **Conversation only** — Removes chat history while preserving file changes (useful when code is good but conversation went off-track)
   - **Code changes only** — Keeps conversation but undoes file edits (useful for retrying implementation while preserving context)
   - **Both** — Restores everything to the previous state
3. **Confirm** — Finalize the reversion

### Forking Conversations

The forking workflow enables branching exploration of alternative approaches:

```plaintext
/resume save decision-point     # Create a named checkpoint
# ... try first approach ...
/resume resume decision-point   # Fork back to checkpoint to try different approach
```

This creates a new branch of history without losing the original work, enabling side-by-side comparison of solutions.

## Key Commands Reference

| Command | Function |
|---------|----------|
| `gemini -r` | Resume last session |
| `/resume` | Open interactive session browser |
| `/resume save <name>` | Create named checkpoint |
| `/resume resume <name>` | Fork conversation to checkpoint |
| `gemini --list-sessions` | List all sessions with IDs |
| `gemini --delete-session <id>` | Delete specific session |
| `/exit --delete` | Exit and delete current session |
| `/rewind` or `Esc Esc` | Trigger rewind |

## Connection to Other Features

Session management is built on the [[checkpointing]] foundation, which enables history reconstruction across compression boundaries. The [[session-management]] concept page provides the broader context for these individual commands.

## External Resources

- [Checkpointing documentation](https://geminicli.com/docs/cli/checkpointing) — Understanding the underlying safety mechanism
- [Task planning tutorial](https://geminicli.com/docs/cli/tutorials/task-planning) — Organizing complex sessions
- [Command reference](https://geminicli.com/docs/reference/commands) — Complete `/resume` options and aliases