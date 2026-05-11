---
type: source
title: "Rewind"
author: []
year: 2026
url: "https://geminicli.com/docs/cli/rewind/"
venue: "geminicli.com"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "session-management"
  - "undo"
  - "file-reversion"
related:
  - "[[rewind-feature]]"
  - "[[selective-reversion]]"
  - "[[checkpointing]]"
  - "[[5-manage-sessions-and-history]]"
sources: ["III. 17. Rewind.md"]
---

# Rewind

The `/rewind` command provides a granular undo mechanism for both conversation history and file changes in Gemini CLI sessions. This official documentation describes the interface flow, mode options, and important limitations for the rewind feature.

## Interface and Workflow

The rewind feature is triggered via the `/rewind` command or by pressing **Esc** twice. Upon activation, an interactive selection list displays previous interactions in reverse chronological order (most recent at bottom). Navigation uses Up/Down arrow keys with preview of user prompts and file change counts. Confirmation selects the target interaction, followed by a dialog presenting available reversion modes.

## Three Modes of Selective Reversion

The feature supports three distinct reversion modes:

1. **Rewind conversation and revert code changes** — Full reversion of both chat history and file modifications to pre-interaction state
2. **Rewind conversation only** — Reverts chat history while preserving all file changes
3. **Revert code changes only** — Reverts file modifications while preserving conversation context

Options related to code reversion are hidden when no file changes occurred since the selected point.

## Key Considerations and Limitations

The documentation highlights critical limitations:

- **Destructive action:** Rewinding permanently removes session history and potentially reverts file state
- **Agent awareness:** AI model loses all memory of removed interactions; manual notification required after code-only reversion
- **Scope limitation:** Only reverts changes made by AI edit tools; manual edits and shell tool (`!`) changes are unaffected
- **Compression compatibility:** Rewind reconstructs history from stored session data, enabling operation across chat compression boundaries

## Connections to Related Concepts

This source serves as the canonical documentation for [[rewind-feature]] and informs the [[selective-reversion]] concept. The underlying [[checkpointing]] mechanism enables history reconstruction across compression points.