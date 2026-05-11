---
type: source
title: "Use Plan Mode with model steering for complex tasks"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "tutorial"
  - "plan-mode"
  - "model-steering"
  - "workflow"
related:
  - "[[plan-mode]]"
  - "[[model-steering]]"
  - "[[combined-workflows]]"
  - "[[mid-turn-refinement]]"
sources: ["7. Use Plan Mode with model steering for complex tasks.md"]
url: "https://geminicli.com/docs/cli/tutorials/plan-mode-steering/"
---

# Use Plan Mode with model steering for complex tasks

This tutorial demonstrates how combining [[plan-mode]] with [[model-steering]] enables precise guidance through complex development tasks. The workflow leverages real-time corrections during active processing to improve architectural outcomes.

## Core Workflow

The tutorial presents a four-step process for implementing a notification service using Redis:

1. **Start a complex task** — Enter Plan Mode and initiate research on the codebase
2. **Steer the research phase** — Provide hints while the agent is actively processing
3. **Refine the design mid-turn** — Adjust architectural decisions during the draft phase
4. **Approve and implement** — Exit Plan Mode with confidence

## Key Techniques

### Mid-turn Refinement

The ability to provide feedback while the spinner is active enables more efficient corrections. Instead of waiting for a full research turn to complete, users can redirect attention immediately when they notice gaps or misdirections.

### Early Steering Benefits

Steering during the research phase is emphasized as more efficient than correcting the final draft. This proactive approach catches architectural issues before significant effort is invested.

## Example Scenario

The notification service implementation demonstrates practical steering:
- Initial goal: Implement Redis-based notification service
- Steering hint: "Don't forget to check packages/common/queues for the existing Redis config"
- Design correction: "Use a Publisher/Subscriber pattern instead of a simple queue"

## Tips for Effective Steering

| Guideline | Example |
|-----------|---------|
| Be specific | "use the existing `Logger` class in `src/utils`" rather than "do it differently" |
| Steer early | Provide feedback during research vs. waiting for final plan |
| Use for context | Share information not derivable from code (e.g., "We are planning to deprecate this module next month") |

## Related Features

- [[agent-skills]] — Mentioned as next step for adding specialized expertise to planning turns
- [[combined-workflows]] — General concept of integrating multiple Gemini CLI features
- [[mid-turn-refinement]] — Technique demonstrated in the tutorial