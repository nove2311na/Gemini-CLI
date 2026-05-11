---
type: entity
title: "Model tiers (Pro, Flash, Flash-Lite)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "model-selection"
  - "ai-models"
related:
  - "[[model-selection]]"
  - "[[gemini-cli]]"
  - "[[model-command]]"
sources: ["III. 11. Gemini CLI model selection (`model` command).md"]
---

# Model tiers (Pro, Flash, Flash-Lite)

Gemini CLI supports three distinct model tiers that offer different trade-offs between intelligence and speed. Understanding these tiers helps users optimize their workflow for specific task requirements.

## Tier Overview

| Tier | Primary Use Case | Characteristics |
|------|------------------|-----------------|
| **Pro** | Complex reasoning and creative tasks | Highest reasoning and creativity capabilities |
| **Flash** | Speed-critical simple tasks | Fast response times, good for routine operations |
| **Flash-Lite** | Fastest simple tasks | Minimal latency for straightforward queries |

## Tier Selection Guidance

According to the official documentation:

- **Default to Auto** for most users — the system automatically selects the appropriate model based on task complexity
- **Switch to Pro** when results are insufficient, particularly for complex debugging, multi-stage reasoning, or architectural decisions
- **Switch to Flash or Flash-Lite** for quick simple tasks like format conversion, basic queries, or repetitive operations

## Context in [[model-selection]]

These tiers form the foundation of [[model-selection]] strategy in [[gemini-cli]]. The Auto mode leverages both Pro and Flash tiers, dynamically selecting based on the complexity of each sub-task within a conversation. Manual mode allows explicit tier selection when the default behavior does not meet specific requirements.