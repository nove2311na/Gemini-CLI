---
type: concept
title: "Todo List"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "ui-feature"
  - "task-monitoring"
  - "workflow"
related:
  - "[[task-planning]]"
  - "[[write-todos-tool]]"
  - "[[mid-turn-refinement]]"
sources: ["6. Plan tasks with todos.md"]
---

# Todo List

The todo list is Gemini CLI's real-time CLI checklist that displays tasks with their current status. It provides continuous visibility into task progress during complex workflows.

## Display Location

The todo list appears above the input box, updating automatically as the agent works through a structured plan. For compact views, only the current focus may be shown.

## Task Statuses

Tasks can exist in one of several states:

- **Pending:** Task is queued but not yet started
- **In progress:** Agent is actively working on this task, highlighted with `[IN_PROGRESS]`
- **Done:** Task completed successfully
- **Cancelled:** Task was skipped or removed from the plan

## Monitoring with Ctrl+T

Pressing **Ctrl+T** toggles the full todo list view at any time. This is particularly useful for long-running tasks where the compact view may hide pending items. Users can quickly assess "how much is left?" without scrolling through conversation history.

## Dynamic Updates

The todo list updates in real-time as the agent executes each step. Completed tasks are marked automatically, and the next pending task becomes the current focus. This provides immediate feedback on workflow progress.

## Integration with Task Planning

The todo list is the visible output of [[write-todos-tool]]. When a user requests a plan with prompts like "Please make a plan first," Gemini CLI generates the todo list and displays it for review before execution begins. Users can iterate on the plan before committing to execution.

## Comparison to Mid-Turn Refinement

While [[mid-turn-refinement]] allows correcting agent behavior during active processing, the todo list focuses on monitoring progress through a planned sequence of tasks. Both features contribute to user control, but serve different purposes: refinement for course correction, todo list for progress tracking.