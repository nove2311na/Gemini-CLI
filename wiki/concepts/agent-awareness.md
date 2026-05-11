---
type: concept
title: "Agent Awareness"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "session-management"
  - "ai-memory"
  - "context"
related:
  - "[[rewind-feature]]"
  - "[[selective-reversion]]"
  - "[[session]]"
sources: ["III. 17. Rewind.md"]
---

# Agent Awareness

Agent awareness refers to the AI model's memory of conversation context and previously discussed information within a [[session]]. This concept is critical for understanding the implications of [[rewind-feature]] operations, particularly [[selective-reversion]].

## Memory Dynamics

When using rewind with conversation reversion, the AI model loses all memory of the interactions that were removed. This is not a temporary concealment — the model genuinely forgets that these exchanges ever occurred. Any context, decisions, or information established during those interactions is no longer accessible to the AI without re-introduction.

## Practical Implications

| Scenario | Agent Awareness Impact |
|----------|------------------------|
| Full reversion (conversation + code) | Complete memory loss of removed interactions |
| Conversation-only reversion | Memory loss of removed interactions; code changes retained |
| Code-only reversion | Full memory retained; manual notification required about file changes |

## Required User Action

After code-only reversion, the AI retains its conversation memory but files on disk have changed. Users should explicitly inform the model that files have been modified, as the AI cannot independently detect that the external state differs from what it remembers.

## Relationship to Chat Compression

Agent awareness also interacts with [[session]] chat compression. When the session history is automatically summarized to stay within context limits, the detailed memory of compressed interactions becomes less immediately accessible, though the underlying checkpointed data remains available for [[rewind-feature]] reconstruction.

## Why This Matters

Understanding agent awareness helps users:

- Anticipate what context the AI will have after a rewind operation
- Know when to re-explain previously established context
- Recognize why explicit notification is needed after code-only reversion
- Plan conversations knowing the memory implications of different operations