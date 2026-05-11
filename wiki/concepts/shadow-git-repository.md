---
type: concept
title: "Shadow Git Repository"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "version-control"
  - "checkpointing"
  - "architecture"
related:
  - "[[checkpointing]]"
  - "[[restore-command]]"
  - "[[session-management]]"
sources: ["III. 4. Checkpointing.md"]
---

# Shadow Git Repository

The shadow Git repository is a dedicated, isolated version control system that stores file snapshots for the [[checkpointing]] feature. It is located at `~/.gemini/history/<project_hash>` and operates completely independently from any user project repositories.

## Purpose

When a checkpoint is created before a file modification, the shadow repository captures the complete project state as a Git commit. This provides:

- **Precise file restoration:** Git's content-addressable storage ensures exact state recovery
- **Isolation from user workflow:** The shadow repository never touches or interferes with user project repositories
- **Efficient storage:** Git's delta compression minimizes space usage for multiple snapshots

## Architecture

### Location Structure

```
~/.gemini/history/<project_hash>/
```

The `<project_hash>` represents a hash of the project path, ensuring each project has its own isolated snapshot history while sharing the base directory structure.

### Isolation Guarantees

- No commits are made to user project repositories
- No `.git` directories are modified in user projects
- Checkout operations affect only the shadow repository
- User project Git history remains completely untouched

## Relationship to Checkpointing

Each checkpoint includes a Git snapshot from this repository. When using [[restore-command]] to restore a checkpoint:

1. The shadow repository's commit is checked out
2. Files revert to their checkpointed state
3. The operation is atomic and isolated

## Checkpoint Naming

Checkpoints stored in the shadow repository are referenced by filenames following the pattern:
```
<timestamp>-<filename>-<tool_name>
```

Example: `2025-06-22T10-00-00_000Z-my-file.txt-write_file`

This naming convention helps users identify the relevant snapshot when browsing or restoring checkpoints.

## Storage Comparison

| Data Type | Storage Location |
|-----------|------------------|
| Git snapshots | `~/.gemini/history/<project_hash>` |
| Conversation history | `~/.gemini/tmp/<project_hash>/checkpoints` |
| Tool call metadata | `~/.gemini/tmp/<project_hash>/checkpoints` |

The separation of Git snapshots from conversation data allows independent management of file state versus session context.