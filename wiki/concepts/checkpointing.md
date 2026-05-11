---
type: concept
title: "Checkpointing"
created: 2026-01-15
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "safety"
  - "file-operations"
  - "version-control"
related:
  - "[[restore-command]]"
  - "[[rewind-feature]]"
  - "[[selective-reversion]]"
  - "[[shadow-git-repository]]"
  - "[[session-management]]"
sources: ["III. 4. Checkpointing.md"]
---

# Checkpointing

Checkpointing is an automatic safety mechanism that captures complete project state snapshots before AI-powered tools modify the filesystem. It serves as the foundational technology enabling [[rewind-feature]] and safe file experimentation.

## How It Works

When you approve a file-modifying tool (such as `write_file` or `replace`), the CLI automatically creates a "checkpoint" containing three components:

1. **Git Snapshot:** A commit in a dedicated shadow repository captures the complete file state
2. **Conversation History:** The entire session context up to that point is preserved
3. **Tool Call:** The exact operation that prompted the save is stored for re-proposal

## Architecture

### Shadow Git Repository

Checkpoints use a separate Git repository at `~/.gemini/history/<project_hash>` that is completely isolated from any user project repositories. This ensures that checkpoint operations never interfere with existing version control workflows.

### Three-Component Snapshot

Unlike simple file backups, checkpointing preserves:

- **Complete file state:** Via Git snapshot for precise restoration
- **Conversation context:** Enabling full session restoration
- **Tool call metadata:** Allowing re-proposal and modification of the original operation

### Storage Locations

- **Git snapshots:** `~/.gemini/history/<project_hash>`
- **Conversation and tool call data:** `~/.gemini/tmp/<project_hash>/checkpoints`

## Configuration

**Status:** Disabled by default

To enable, edit `settings.json`:

```json
{
  "general": {
    "checkpointing": {
      "enabled": true
    }
  }
}
```

## Using Checkpoints

The [[restore-command]] `/restore` manages checkpoint interaction:

- `/restore` — Lists all available checkpoints
- `/restore <checkpoint_file>` — Restores project state from that checkpoint

Restoration restores files, conversation history, and re-proposes the original tool call.

## Relationship to Rewind

Checkpointing provides the underlying mechanism for [[rewind-feature]]. The `/restore` command performs full state restoration, while [[selective-reversion]] offers more granular undo controls built on top of the same checkpoint infrastructure.

Key distinction: `/restore` only works with explicitly created checkpoints, while rewind can navigate to any previous conversation state with selective modes.

## Tool Call Preservation

A powerful feature of checkpointing is the ability to re-propose the original tool call after restoration. This enables:

- Running the same operation again unchanged
- Modifying the tool call before execution
- Simply reviewing what was about to happen

This capability is unique to checkpointing and supports iterative refinement of AI-assisted file operations.