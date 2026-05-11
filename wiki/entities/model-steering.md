---
type: entity
title: "Model Steering"
created: 2026-01-15
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "experimental"
  - "real-time-guidance"
  - "agent-control"
related:
  - "[[plan-mode]]"
  - "[[mid-turn-refinement]]"
  - "[[steering-hints]]"
  - "[[context-injection]]"
  - "[[agent-skills]]"
sources:
  - "III. 12. Model steering (experimental).md"
---

# Model Steering

Model steering is an experimental feature in [[gemini-cli]] that enables real-time feedback during active task execution. It allows users to provide guidance, correct course, add missing context, or skip unnecessary steps without stopping and restarting the agent.

## Overview

When enabled, model steering treats any text typed while the agent is working as a steering hint. The hint is acknowledged immediately and injected into the model's context for the next turn, enabling the most immediate course correction possible.

## Enabling Model Steering

The feature is disabled by default and requires opt-in. Two methods are available:

**Via `/settings` command:**
1. Type `/settings` in Gemini CLI
2. Search for **Model Steering**
3. Set the value to **true**

**Via settings.json:**
```json
{
  "experimental": {
    "modelSteering": true
  }
}
```

## Technical Mechanism

Model steering operates through a two-step process:

1. **Immediate acknowledgment:** A small, fast model generates a one-sentence acknowledgment so users know their hint was received
2. **Context injection:** An internal instruction is prepended to the hint that tells the main agent to:
   - Re-evaluate the active plan
   - Classify the update (for example, as a new task or extra context)
   - Apply minimal-diff changes to affected tasks

The hint is delivered to the agent at the beginning of its next turn, ensuring the most immediate course correction possible.

## Common Use Cases

Model steering is particularly useful during complex [[plan-mode]] workflows or long-running subagent executions. Examples include:

- **Correcting a path:** "Actually, the utilities are in `src/common/utils`."
- **Skipping a step:** "Skip the unit tests for now and just focus on the implementation."
- **Adding context:** "The `User` type is defined in `packages/core/types.ts`."
- **Redirecting effort:** "Stop searching the codebase and start drafting the plan now."
- **Handling ambiguity:** "Use the existing `Logger` class instead of creating a new one."

## Relationship to Mid-Turn Refinement

Model steering provides a structured mechanism for [[mid-turn-refinement]], allowing corrections during active processing rather than requiring costly reversion or session restart. This real-time guidance capability is especially valuable for complex tasks where the agent might otherwise diverge from the intended approach.

## See Also

- [[steering-hints]] — The user-submitted feedback text that triggers the steering mechanism
- [[context-injection]] — The technical process of adding steering hints to model context
- [[plan-mode]] — Workflow where model steering is "particularly useful"
- [[agent-skills]] — Next steps for extending agent capabilities