---
type: source
title: "Model steering (experimental)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "experimental"
  - "features"
  - "real-time-guidance"
related:
  - "[[model-steering]]"
  - "[[plan-mode]]"
  - "[[agent-skills]]"
  - "[[steering-hints]]"
  - "[[context-injection]]"
sources:
  - "III. 12. Model steering (experimental).md"
---

# Model Steering (Experimental)

**Source:** [Official Gemini CLI Documentation](https://geminicli.com/docs/cli/model-steering/)

**Published:** 2026-04-10

Model steering is an experimental feature that enables real-time guidance and feedback to Gemini CLI during active task execution. It allows users to correct course, add missing context, or skip unnecessary steps without stopping and restarting the agent. The feature is particularly useful during complex [[plan-mode]] workflows or long-running subagent executions.

## Enabling the Feature

Model steering is disabled by default and requires opt-in. Users can enable it through the `/settings` command or by directly editing `settings.json`.

**Via CLI:**
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

## How Model Steering Works

The feature operates through a two-step process:

1. **Immediate acknowledgment:** A small, fast model generates a one-sentence acknowledgment confirming the hint was received
2. **Context injection:** An internal instruction is prepended to the hint that instructs the main agent to re-evaluate its active plan, classify the update, and apply minimal-diff changes

## Common Use Cases

Steering hints can guide the model in several ways:
- **Correcting a path:** "Actually, the utilities are in `src/common/utils`."
- **Skipping a step:** "Skip the unit tests for now and just focus on the implementation."
- **Adding context:** "The `User` type is defined in `packages/core/types.ts`."
- **Redirecting effort:** "Stop searching the codebase and start drafting the plan now."
- **Handling ambiguity:** "Use the existing `Logger` class instead of creating a new one."

## Next Steps

After learning model steering, users are encouraged to tackle complex tasks with [[plan-mode]] and build custom [[agent-skills]].

## Related Concepts

- [[steering-hints]] — User-submitted feedback during agent operation
- [[context-injection]] — Technical mechanism for adding guidance to model context