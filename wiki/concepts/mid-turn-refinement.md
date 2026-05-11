---
type: concept
title: "Mid-turn refinement"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "technique"
  - "steering"
  - "real-time"
related:
  - "[[model-steering]]"
  - "[[plan-mode]]"
  - "[[combined-workflows]]"
  - "[[grounding]]"
sources: ["7. Use Plan Mode with model steering for complex tasks.md"]
---

# Mid-turn refinement

Mid-turn refinement is the technique of providing feedback or corrections to the agent while it is actively processing a request—before the current turn completes. This enables immediate course correction rather than waiting for full turn cycles.

## How It Works

When the agent is actively processing (indicated by the spinner being active), users can type hints or corrections that take effect in the next turn. This is more efficient than completing a full research cycle and then correcting the output.

## Example from Tutorial

In the "Use Plan Mode with model steering for complex tasks" tutorial:

1. Agent is actively researching the codebase with `list_directory` and `grep_search` calls
2. User types: `"Don't forget to check packages/common/queues for the existing Redis config."`
3. Agent acknowledges and incorporates the hint in its next turn
4. Agent immediately explores the suggested directory

## Key Benefits

- **Efficiency**: Corrects direction before wasted research effort
- **Precision**: Allows injection of context unavailable from code
- **Speed**: Avoids full turn completion before feedback takes effect

## Use Cases

| Scenario | Without Mid-turn Refinement | With Mid-turn Refinement |
|----------|-----------------------------|--------------------------|
| Wrong directory | Wait for research to complete, then re-direct | Correct immediately while agent is exploring |
| Architectural mismatch | Accept flawed plan, restart or edit | Steer during draft phase |
| Missing context | Post-execution correction | Provide context during research |

## Relationship to Other Concepts

- [[model-steering]] — The mechanism enabling mid-turn corrections
- [[plan-mode]] — Context where mid-turn refinement is particularly valuable
- [[grounding]] — Mid-turn refinement can improve accuracy of agent knowledge
- [[combined-workflows]] — A primary use case for mid-turn refinement

## Best Practices

1. **Be specific**: "use `Logger` class in `src/utils`" is more effective than "do it differently"
2. **Steer early**: Corrections during research are more efficient than during drafting
3. **Use for context injection**: Share knowledge not derivable from code (e.g., deprecation plans)