---
type: entity
title: "Pub/Sub pattern"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "architecture"
  - "messaging"
  - "design-pattern"
related:
  - "[[notification-service]]"
  - "[[plan-mode]]"
  - "[[model-steering]]"
sources: ["7. Use Plan Mode with model steering for complex tasks.md"]
---

# Pub/Sub pattern

The Publisher/Subscriber (Pub/Sub) pattern is an architectural approach for messaging where publishers send messages to topics without knowing who will receive them, and subscribers receive messages from topics they have subscribed to.

## Context in Gemini CLI Tutorial

In the "Use Plan Mode with model steering for complex tasks" tutorial, Pub/Sub emerges as a [[model-steering]] correction during the draft phase:

1. Agent initially proposes a simple queue-based notification service
2. User steers: "Actually, let's use a Publisher/Subscriber pattern instead"
3. Agent re-evaluates and drafts a new plan using Pub/Sub architecture

This demonstrates how [[mid-turn-refinement]] can redirect architectural decisions before implementation begins.

## Comparison to Simple Queue

| Aspect | Simple Queue | Pub/Sub Pattern |
|--------|--------------|-----------------|
| Message delivery | Point-to-point | One-to-many |
| Decoupling | Publisher knows consumer | Publisher and subscriber independent |
| Scalability | Limited to queue depth | Multiple subscribers, topic-based filtering |
| Complexity | Lower | Higher, but more flexible |

## Related Concepts

- [[notification-service]] — The use case where Pub/Sub was applied
- [[combined-workflows]] — How this correction fit into the planning workflow
- [[mid-turn-refinement]] — The technique enabling this change