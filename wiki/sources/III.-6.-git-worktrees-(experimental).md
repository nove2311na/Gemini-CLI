---
type: source
title: "Git Worktrees (experimental)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "session-management"
  - "experimental"
  - "isolation"
related:
  - "[[git-worktrees]]"
  - "[[session-management]]"
  - "[[forking-conversations]]"
sources: ["III. 6. Git Worktrees (experimental).md"]
---

# Git Worktrees (experimental)

Git worktrees enable parallel Gemini CLI sessions by providing filesystem-level isolation. Each worktree has its own working directory and branch while sharing repository history, preventing file conflicts between concurrent sessions working on the same codebase.

## Key Features

- **Parallel task support**: Multiple sessions can work simultaneously without interference
- **Isolated file state**: Each worktree maintains independent files and branch
- **Shared history**: Repository history is shared, optimizing disk space
- **Safe exit model**: Worktrees are preserved after session exit to prevent data loss

## Experimental Status

This feature requires explicit opt-in through the `/settings` command or `settings.json` configuration. The feature is marked experimental, indicating it may change or have limitations not fully documented.

## Setup and Usage

Enable via settings or add `"experimental": { "worktrees": true }` to `settings.json`. Create worktrees using `--worktree` or `-w` flag with an optional name. Resume sessions using `--resume` with the session ID, navigating to the worktree directory first.

## Cleanup

Worktrees are not automatically deleted when sessions end. Users must manually remove worktrees using Git commands (`git worktree remove`) and delete branches as needed.

## Connected Concepts

- [[session-management]] — Worktrees extend session isolation capabilities
- [[forking-conversations]] — Alternative isolation strategy at conversation level
- [[checkpointing]] — Enables worktree state preservation