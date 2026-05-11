---
type: entity
title: "/restore command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "command"
  - "checkpointing"
  - "restoration"
related:
  - "[[checkpointing]]"
  - "[[rewind-feature]]"
  - "[[selective-reversion]]"
  - "[[shadow-git-repository]]"
sources: ["III. 4. Checkpointing.md"]
---

# /restore command

The `/restore` command is the primary interface for managing and applying checkpoints in Gemini CLI. It provides both checkpoint discovery and state restoration capabilities.

## Functionality

### Listing Checkpoints

Running `/restore` without arguments displays all available checkpoints for the current project:

```
/restore
```

The CLI presents a list of checkpoint files named with the pattern: `<timestamp>-<filename>-<tool_name>`

Example output:
```
2025-06-22T10-00-00_000Z-my-file.txt-write_file
2025-06-22T10-15-30_000Z-config.json-replace
```

### Restoring a Checkpoint

To restore project state from a specific checkpoint, provide the checkpoint filename:

```
/restore <checkpoint_file>
```

Example:
```
/restore 2025-06-22T10-00-00_000Z-my-file.txt-write_file
```

## What Happens During Restoration

When a checkpoint is restored, three things occur simultaneously:

1. **File Reversion:** All project files revert to their state at checkpoint creation time
2. **Conversation Restoration:** The CLI restores the complete conversation history up to the checkpoint
3. **Tool Call Re-proposal:** The original tool call reappears in the prompt, allowing the user to re-execute, modify, or ignore it

This comprehensive restoration enables safe experimentation—users can undo changes completely or iterate on the same operation with adjustments.

## Comparison with Rewind

While `/restore` performs full state restoration, the [[rewind-feature]] provides more granular undo capabilities through [[selective-reversion]]:

| Aspect | /restore | /rewind |
|--------|----------|---------|
| Scope | Full restoration | Selective restoration |
| Modes | Single mode (complete) | Three modes (conversation, code, both) |
| Trigger | Checkpoints created before file modifications | Available for any conversation state |
| Tool call preservation | Yes | Limited |

The checkpointing system likely serves as the underlying mechanism that enables the rewind feature's more sophisticated controls.

## Requirements

The [[checkpointing]] feature must be enabled in `settings.json` for `/restore` to function:

```json
{
  "general": {
    "checkpointing": {
      "enabled": true
    }
  }
}
```

## Checkpoint File Format

Checkpoint files store the tool call that triggered the save alongside the conversation history. This data resides in `~/.gemini/tmp/<project_hash>/checkpoints`, while the associated Git snapshot exists in the [[shadow-git-repository]] at `~/.gemini/history/<project_hash>`.