---
type: concept
title: "Session Management"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "workflow"
  - "history"
  - "productivity"
related:
  - "[[session]]"
  - "[[rewind-feature]]"
  - "[[forking-conversations]]"
sources: ["5-manage-sessions-and-history.md"]
---

# Session Management

Session management involves the tools and techniques used to organize, resume, and navigate through past conversations in Gemini CLI. Robust session management allows for non-linear workflows and the ability to handle long-running projects across multiple days.

## Resuming Sessions

The primary way to manage sessions is via resumption.

### The `-r` Flag
- `gemini -r latest`: Resumes the most recent conversation in the current workspace.
- `gemini -r 5`: Resumes the session at index 5.
- `gemini -r <id>`: Resumes a specific session by its unique ID.

### The `/resume` Command
Within an interactive session, typing `/resume` opens a visual session browser. Users can:
- See a list of recent sessions with timestamps and turn counts.
- Preview the first message of each session.
- Select a session to switch contexts immediately.

## Session Cleanup

Maintaining a clean workspace often requires deleting old or irrelevant sessions.

- **Interactive Deletion:** In the `/resume` browser, users can delete sessions directly.
- **Command Line Deletion:** `gemini --delete-session <id>` removes a session.
- **Exit with Deletion:** `/exit --delete` (or `/quit --delete`) ends the current session and wipes it from history, useful for privacy-sensitive tasks.

## Naming and Saving

Users can create named checkpoints to branch their work.
- `/resume save <name>`: Creates a named checkpoint (fork) of the current session state.

## See Also

- [[session]] — Definition of the session object
- [[forking-conversations]] — Branching from existing sessions
- [[rewind-feature]] — Granular undo within a session
