---
type: entity
title: "Rewind Feature"
created: 2026-01-15
updated: 2026-05-05
tags:
  - "session-management"
  - "undo"
  - "file-reversion"
related:
  - "[[selective-reversion]]"
  - "[[checkpointing]]"
  - "[[session]]"
  - "[[5-manage-sessions-and-history]]"
  - "[[III. 17. Rewind.md]]"
sources: ["III. 17. Rewind.md"]
---

# Rewind Feature

The rewind feature in [[gemini-cli]] provides a granular undo capability for conversation history and file changes, functioning as a Ctrl+Z-style mechanism for workflow state. It is triggered via the `/rewind` command or by pressing **Esc** twice.

## Interface Flow

When triggered, the rewind feature displays an interactive selection list of previous interactions in reverse chronological order. Users navigate with Up/Down arrow keys, previewing user prompts and file change counts before confirming selection with Enter. A subsequent dialog presents available reversion options based on what changes occurred since the selected point.

## Trigger Methods

| Method | Description |
|--------|-------------|
| `/rewind` command | Type directly into input prompt |
| Double Esc | Keyboard shortcut alternative |

## Selective Reversion Modes

The feature implements the [[selective-reversion]] system with three distinct modes:

1. **Conversation and code** — Full reversion of chat history and file modifications
2. **Conversation only** — Preserves file state while resetting conversation history
3. **Code only** — Reverts files while maintaining conversation context

Options related to code reversion automatically hide when no file changes occurred since the target interaction.

## Important Limitations

Understanding these limitations prevents unintended data loss:

- **Destructive operation:** Rewinding permanently removes session history and may revert file state
- **Agent memory loss:** The AI model loses all memory of removed interactions; after code-only reversion, users should inform the model about changed files
- **Scope restriction:** Only reverts changes made by AI edit tools; manual edits and shell tool (`!`) changes are **not** reverted
- **Cross-compression support:** The underlying [[checkpointing]] mechanism reconstructs history from stored session data, enabling rewinds across chat compression boundaries

## Use Cases

- Undoing mistaken deletions or unwanted code generation
- Exploring alternative approaches by returning to earlier decision points
- Cleaning up session history for privacy or clarity
- Resetting file state without disrupting ongoing conversation context

## Related Documentation

Official documentation: [[III. 17. Rewind.md]]