---
type: concept
title: "Real-time research steering"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "technique"
  - "research"
  - "steering"
related:
  - "[[model-steering]]"
  - "[[mid-turn-refinement]]"
  - "[[plan-mode]]"
  - "[[web-research-workflow]]"
sources: ["7. Use Plan Mode with model steering for complex tasks.md"]
---

# Real-time research steering

Real-time research steering is the practice of correcting the agent's research direction during active processing—specifically during the research phase of [[plan-mode]]. This technique maximizes efficiency by catching misdirection before significant effort is invested.

## Concept Overview

Unlike general [[model-steering]] which can apply throughout a conversation, real-time research steering focuses specifically on the research phase. The goal is to ensure the agent explores the right directories, considers relevant dependencies, and gathers accurate context before proposing a design.

## Why Research Phase Matters

The research phase sets the foundation for everything that follows. Research steering is emphasized over draft-phase steering because:

1. **Foundational impact**: Corrections during research affect all downstream decisions
2. **Efficiency gain**: Catching errors early prevents wasted draft iterations
3. **Confidence building**: Well-researched plans produce higher confidence implementations

## Workflow

```
Research → Steer if needed → Propose → Draft → Steer if needed → Implement
     ↑
   HERE: Most efficient point for corrections
```

## Practical Example

From the tutorial, when implementing a notification service:

1. Agent begins researching existing codebase structure
2. Agent calls `list_directory` and `grep_search` to understand project layout
3. User notices agent missing key directory (`packages/common/queues`)
4. User provides hint while spinner is active
5. Agent immediately incorporates the hint in next turn

## Contrast with Draft-phase Steering

| Aspect | Research-phase Steering | Draft-phase Steering |
|--------|------------------------|---------------------|
| Timing | During active tool calls | During plan drafting |
| Impact | Sets research context | Changes design approach |
| Efficiency | Higher (catches issues early) | Lower (may require draft restart) |
| Typical corrections | Missing directories, dependencies | Architectural decisions, patterns |

## Related Concepts

- [[mid-turn-refinement]] — The mechanism enabling real-time steering
- [[model-steering]] — Parent concept encompassing all steering techniques
- [[plan-mode]] — The structured environment where research steering applies
- [[web-research-workflow]] — Research steering applied to web searches