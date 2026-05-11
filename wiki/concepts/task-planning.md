---
type: concept
title: "Task Planning"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "workflow"
  - "task-planning"
  - "context-window"
related:
  - "[[todo-list]]"
  - "[[write-todos-tool]]"
  - "[[plan-mode]]"
  - "[[session-management]]"
sources: ["6. Plan tasks with todos.md"]
---

# Task Planning

Task planning is the practice of breaking complex development jobs into structured, reviewable steps before execution. It serves as a proactive solution to the context window limitations that affect standard LLMs.

## The Context Window Problem

Standard language models have a limited context window and can "forget" the original goal after approximately 10 turns of code generation. This creates several risks:

- **Goal drift:** The agent gradually moves away from the original objective
- **Lost context:** Earlier decisions and requirements become inaccessible
- **Inefficient recovery:** Users must re-explain the project from scratch

## Core Benefits

Task planning addresses these limitations by providing:

1. **Visibility:** Users see exactly what the agent plans to do *before* execution begins
2. **Focus:** The agent knows precisely which step it's working on at any moment
3. **Resilience:** If the agent gets stuck, the plan provides a clear path back on track

## The Living Document Approach

Unlike static plans, task planning in Gemini CLI treats the plan as a living document. Users can:

- Add missing steps mid-execution
- Reorder tasks based on discovered dependencies
- Cancel or skip items that become unnecessary or risky
- Request modifications: "You forgot to add a step for..."

This dynamic adjustment prevents the rigidity that makes traditional project plans brittle.

## Relationship to Plan Mode

Task planning complements but differs from [[plan-mode]]. While Plan Mode provides a structured environment for research, propose, and draft workflows, task planning focuses on execution-oriented decomposition. Users may combine both: Plan Mode for architectural decisions, task planning for implementation steps.

## Related Concepts

- [[todo-list]] — The real-time CLI checklist that displays task progress
- [[write-todos-tool]] — The internal tool that generates structured task plans
- [[session-management]] — Allows saving plans across sessions for completion later