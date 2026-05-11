---
type: comparison
title: "Forking Conversations vs. Git Worktrees"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "session-management"
  - "parallel-work"
  - "isolation"
related:
  - "[[forking-conversations]]"
  - "[[git-worktrees]]"
  - "[[session-management]]"
sources: ["III. 6. Git Worktrees (experimental).md"]
---

# Forking Conversations vs. Git Worktrees

Both features enable parallel work in [[gemini-cli]], but they operate at different levels of isolation and suit different scenarios.

## Quick Comparison

| Feature | Forking Conversations | Git Worktrees |
|---------|------------------------|---------------|
| Isolation level | Conversation only | Filesystem + branch |
| File conflicts | Possible (same files) | Prevented (separate directories) |
| Setup required | None | Enable experimental + create worktree |
| Cleanup | Automatic | Manual (Git commands) |
| Use case | Exploring alternatives | Parallel task execution |
| Overhead | Minimal | Higher (separate working directory) |

## When to Use Forking Conversations

- **Same codebase, different approaches**: Explore alternative implementation strategies in the same files
- **Quick exploration**: Need to test an idea without committing to filesystem changes
- **Low overhead**: Prefer minimal setup and automatic cleanup
- **Conversation branching**: Want to preserve multiple reasoning paths without file duplication

## When to Use Git Worktrees

- **File conflict prevention**: Multiple sessions modifying overlapping files
- **True parallelism**: Need to run builds, tests, or long operations simultaneously
- **Branch isolation**: Want each session on its own branch with independent commits
- **Long-running tasks**: Sessions that may run for extended periods without interference
- **Explicit isolation**: Require clear separation between work contexts

## Operational Differences

### Cleanup

**Forking conversations:**
- Automatic through session deletion
- No filesystem artifacts remain

**Git worktrees:**
- Manual cleanup required
- Must remove directory and branch separately
- Risk of accumulation if not managed

### Session Resumption

**Forking conversations:**
- List available forks via `/resume` browser
- No directory navigation required

**Git worktrees:**
- Must `cd` to worktree directory first
- Use `--resume` with session ID
- Directory context matters

## Combining Approaches

In complex workflows, you may use both strategies:

1. Create a git worktree for the primary parallel task
2. Within that worktree, fork conversations to explore alternative approaches
3. Use [[checkpointing]] to save progress at key decision points

This layered approach provides both filesystem-level and conversation-level isolation when needed.