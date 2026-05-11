---
type: source
title: "Checkpointing"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "safety"
  - "file-operations"
  - "version-control"
related:
  - "[[restore-command]]"
  - "[[checkpointing]]"
  - "[[rewind-feature]]"
  - "[[shadow-git-repository]]"
  - "[[selective-reversion]]"
sources: ["III. 4. Checkpointing.md"]
---

# Checkpointing

**Source:** [Official Gemini CLI Documentation](https://geminicli.com/docs/cli/checkpointing/)
**Published:** 2026-04-10

## Summary

Checkpointing is an automatic safety mechanism that captures a complete snapshot of project state before any AI-powered tools modify the filesystem. When a user approves a file-modifying tool (such as `write_file` or `replace`), the system creates a checkpoint containing three components: a Git snapshot in a shadow repository, the full conversation history, and the exact tool call that triggered the save. This allows complete restoration of project state at any point.

## Key Features

**Automatic Trigger:** Checkpoints are created automatically when approving tools that modify files—no manual intervention required once enabled.

**Three-Component Architecture:**

1. **Git Snapshot:** A commit in the shadow Git repository (`~/.gemini/history/<project_hash>`) captures the complete file state without touching the user's project repository
2. **Conversation History:** The entire session context up to that point is preserved
3. **Tool Call Preservation:** The exact operation that prompted the checkpoint is stored, enabling re-proposal or modification

**Shadow Repository Isolation:** The checkpoint Git repository is completely separate from any user project repositories, ensuring no interference with existing version control workflows.

**Restoration Capabilities:** Using `/restore` reverts files to the checkpoint state, restores conversation context, and re-proposes the original tool call for re-execution, modification, or dismissal.

## Configuration

**Status:** Disabled by default
**Enable Method:** Edit `settings.json` with:
```json
{
  "general": {
    "checkpointing": {
      "enabled": true
    }
  }
}
```

## Checkpoint File Naming

Checkpoint files follow the format: `<timestamp>-<filename>-<tool_name>`

Example: `2025-06-22T10-00-00_000Z-my-file.txt-write_file`

## Storage Locations

- **Git snapshots:** `~/.gemini/history/<project_hash>`
- **Conversation & tool call data:** `~/.gemini/tmp/<project_hash>/checkpoints`

## Relationship to Rewind

Checkpointing serves as the foundational mechanism that enables the [[rewind-feature]]. While `/restore` provides full state restoration, the rewind feature offers more granular control through its [[selective-reversion]] modes (conversation-only, code-only, or both).