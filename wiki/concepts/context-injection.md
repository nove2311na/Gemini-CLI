---
type: concept
title: "Context Injection"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "model-mechanism"
  - "real-time-guidance"
related:
  - "[[model-steering]]"
  - "[[steering-hints]]"
  - "[[grounding]]"
sources:
  - "III. 12. Model steering (experimental).md"
---

# Context Injection

Context injection is the technical mechanism by which [[steering-hints]] are processed and delivered to the agent during active [[model-steering]] execution. It involves prepending internal instructions to user hints and delivering them at the beginning of the agent's next turn.

## Definition

Context injection is the process of adding guidance directly into the model context during active task execution, enabling real-time course correction without stopping or restarting the agent.

## The Two-Step Process

According to the official documentation, context injection involves two sequential steps:

### Step 1: Immediate Acknowledgment

When a steering hint is submitted, a small, fast model generates a one-sentence acknowledgment. This provides immediate user feedback that the hint was received, preventing confusion about whether the input was processed.

### Step 2: Internal Instruction Prepending

An internal instruction is prepended to the steering hint that instructs the main agent to:

1. **Re-evaluate the active plan** — The agent considers whether its current approach is still appropriate
2. **Classify the update** — The agent categorizes the hint (for example, as a new task or extra context)
3. **Apply minimal-diff changes** — The agent makes only the necessary adjustments to affected tasks, rather than wholesale replanning

## Delivery Timing

The steering hint, now enhanced with internal instructions, is delivered to the agent at the beginning of its next turn. This timing ensures the most immediate course correction possible while maintaining the agent's current conversation state.

## Contrast with Grounding

While [[context-injection]] adds user guidance to model context, [[grounding]] ensures the model has access to current, accurate external information. Both mechanisms shape model behavior, but through different means:

- **Context injection** — User-driven guidance during execution
- **Grounding** — External information retrieval for factual accuracy

## See Also

- [[model-steering]] — The feature that enables context injection
- [[steering-hints]] — The user-submitted feedback that triggers context injection
- [[grounding]] — Related mechanism for ensuring factual accuracy