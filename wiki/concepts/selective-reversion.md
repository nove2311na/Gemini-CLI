---
type: concept
title: "Selective Reversion"
created: 2026-01-15
updated: 2026-05-05
tags:
  - "session-management"
  - "undo"
  - "file-reversion"
  - "granular-control"
related:
  - "[[rewind-feature]]"
  - "[[checkpointing]]"
  - "[[session]]"
sources: ["5. Manage sessions and history.md", "III. 17. Rewind.md"]
---

# Selective Reversion

Selective reversion is a three-mode system within the [[rewind-feature]] that provides granular control over what types of changes are undone. This system enables users to keep beneficial changes while discarding unwanted ones, reducing the need for complete session restarts.

## Three Reversion Modes

| Mode | Conversation | Code Files | Use Case |
|------|--------------|------------|----------|
| **Full reversion** | Reverted | Reverted | Complete undo of an interaction |
| **Conversation only** | Reverted | Preserved | Keep code changes, reset conversation |
| **Code only** | Preserved | Reverted | Keep conversation context, undo file changes |

## Mode Selection Interface

When a rewind is triggered, the interface presents available options based on what changes occurred:

- If both conversation and file changes exist: all three options shown
- If only conversation changes exist: conversation-only option shown
- If only file changes exist: code-only option shown
- If no changes exist: options related to that change type are hidden

## Design Rationale

The granular approach addresses common development scenarios:

1. **Conversation-only reversion** — Useful when AI generated helpful code but the conversation became derailed or contains errors worth removing
2. **Code-only reversion** — Useful when conversation context is valuable but file changes should be undone for a fresh approach
3. **Full reversion** — Complete reset when both conversation and code are problematic

## Interaction with Session State

Selective reversion operates on the [[session]] state, leveraging the underlying [[checkpointing]] mechanism to reconstruct history across chat compression boundaries. This ensures rewind functionality remains reliable even after extended sessions that trigger automatic conversation summarization.

## Key Distinction: AI vs Manual Changes

An important limitation: selective reversion only affects changes made by AI edit tools. Manual file edits and changes triggered by shell commands (`!`) are **not** reverted. Users expecting complete undo across all modification sources should be aware of this scope limitation.