---
type: concept
title: "Git Worktrees"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "session-management"
  - "isolation"
  - "parallel-work"
  - "experimental"
related:
  - "[[session-management]]"
  - "[[forking-conversations]]"
  - "[[checkpointing]]"
  - "[[settings-json]]"
sources: ["III. 6. Git Worktrees (experimental).md"]
---

# Git Worktrees

Git worktrees allow running multiple [[gemini-cli]] sessions on the same codebase simultaneously without file conflicts. Each worktree provides filesystem-level isolation through separate working directories that share repository history but maintain independent file state and branch state.

## Enabling the Feature

Git worktrees are experimental and require explicit opt-in:

**Via settings command:**
1. Run `/settings`
2. Search for **Enable Git Worktrees** and set to `true`

**Via settings.json:**
```json
{
  "experimental": {
    "worktrees": true
  }
}
```

## Creating Worktrees

Use the `--worktree` (or `-w`) flag to create an isolated worktree:

```bash
# Named worktree (directory and branch both named)
gemini --worktree feature-search

# Random name (e.g., worktree-a1b2c3d4)
gemini --worktree
```

The worktree is created in `.gemini/worktrees/` with the specified name becoming both the directory and branch name.

## Resuming Sessions

Worktrees persist after session exit. To resume:

```bash
cd .gemini/worktrees/feature-search
gemini --resume <session_id>
```

## Exit Behavior

When exiting with `/quit` or `Ctrl+C`, the worktree and all changes are preserved, including:
- Modified files
- Staged changes
- Untracked files
- New commits

This safe exit model prevents data loss but requires manual cleanup.

## Manual Cleanup

Worktrees are not auto-deleted. Clean up when finished:

```bash
# Remove worktree and delete branch
git worktree remove .gemini/worktrees/feature-search --force
git branch -D worktree-feature-search
```

## Manual Worktree Creation

For advanced control over location and branch configuration:

```bash
git worktree add ../project-feature-search -b feature-search
cd ../project-feature-search && gemini
```

## Comparison with Forking Conversations

| Aspect | [[forking-conversations]] | [[git-worktrees]] |
|--------|---------------------------|-------------------|
| Isolation level | Conversation context only | Filesystem + conversation |
| Use case | Exploring alternatives in same files | Parallel tasks with file conflicts |
| Setup required | None | Enable experimental, create worktree |
| Cleanup | Automatic (session deletion) | Manual Git commands |

See [[forking-conversations-vs-git-worktrees]] for detailed comparison.

## Limitations

- **Experimental status**: Feature may change or have undocumented limitations
- **Manual cleanup**: Accumulation risk if worktrees are not regularly removed
- **No auto-resume**: Must manually navigate to directory and use `--resume` flag
- **Random naming**: Auto-generated names make directory management harder