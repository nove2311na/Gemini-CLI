---
type: entity
title: "Notification service"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "use-case"
  - "messaging"
  - "implementation"
related:
  - "[[redis]]"
  - "[[pub-sub-pattern]]"
  - "[[plan-mode]]"
  - "[[model-steering]]"
sources: ["7. Use Plan Mode with model steering for complex tasks.md"]
---

# Notification service

The notification service is a concrete use case featured in the "Use Plan Mode with model steering for complex tasks" tutorial. It demonstrates how [[combined-workflows]] enable precise implementation of complex features.

## Scenario Overview

The tutorial walks through implementing a new notification service that leverages Redis for queue-based message handling. The scenario showcases:

1. **Research phase**: Agent explores codebase to identify where the new service should live
2. **Steering phase**: User provides hints about existing Redis configurations
3. **Design phase**: User corrects architectural approach (queue vs. Pub/Sub)
4. **Implementation phase**: Exit from Plan Mode into execution

## Key Steering Moments

### Redis Config Discovery

When the agent begins researching, a steering hint directs attention to `packages/common/queues` where existing Redis configuration resides. This demonstrates how domain knowledge unavailable from code inspection can be injected mid-turn.

### Architectural Correction

During the draft phase, the user corrects the agent's initial approach from "simple queue" to [[pub-sub-pattern]]. This mid-turn refinement prevents implementation of a less suitable design.

## Related Entities

- [[redis]] — Underlying technology stack
- [[pub-sub-pattern]] — Alternative architectural pattern
- [[agent-skills]] — Potential enhancement for notification-specific expertise