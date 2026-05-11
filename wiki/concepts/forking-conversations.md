---
type: concept
title: "Forking Conversations"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "workflow"
  - "branching"
  - "experimentation"
related:
  - "[[session]]"
  - "[[session-management]]"
  - "[[git-worktrees]]"
sources: ["5-manage-sessions-and-history.md"]
---

# Forking Conversations

Forking allows a developer to branch a conversation history into two or more independent paths. This is similar to creating a branch in Git, enabling experimentation without affecting the main line of progress.

## Why Fork?

1. **Alternative Approaches:** Try two different architectural solutions to the same problem.
2. **Safe Experimentation:** Test a risky refactoring while keeping a "stable" conversation state to return to.
3. **Template Workflows:** Start a session, set up complex context (read many files), and then fork that "prepared" state for different sub-tasks.

## How to Fork

Forking is achieved using the `/resume save` command:

1. **Prepare State:** Interact with Gemini CLI until you reach the point where you want to branch.
2. **Create Fork:** Run `/resume save <branch-name>`.
3. **Switch/Resume:** You can now resume the main session or the new named fork independently using `gemini -r <branch-name>`.

## Relationship to Git Worktrees

While forking manages the *conversation* state, it does not automatically isolate the *filesystem* state unless combined with [[git-worktrees]]. 

- **Forking only:** Independent AI memories, but both share the same local files.
- **Forking + Worktrees:** Complete isolation of both AI memory and physical file changes.

## See Also

- [[session-management]] — The system that handles forks
- [[git-worktrees]] — Filesystem-level isolation for parallel work
- [[rewind-feature]] — A different way to manage history by going backward
