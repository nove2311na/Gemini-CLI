---
type: entity
title: "gemini-2.5-flash-lite"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google"
  - "ai-model"
  - "fallback"
related:
  - "[[model-routing]]"
  - "[[silent-fallback-chain]]"
  - "[[gemini-2-5-flash]]"
  - "[[gemini-2-5-pro]]"
sources: ["III. 10. Model routing.md"]
---

# gemini-2.5-flash-lite

gemini-2.5-flash-lite is part of the internal silent fallback chain in Gemini CLI. It serves as the primary model for internal utility calls such as prompt completion and classification.

## Role in Fallback Chain

This model is the first link in the silent fallback chain for internal operations. When internal utility calls are needed, the system attempts to use gemini-2.5-flash-lite first due to its optimized performance for these types of operations.

## Silent Fallback Behavior

If gemini-2.5-flash-lite fails during internal utility calls, the system automatically falls back to [[gemini-2-5-flash]] without prompting the user or changing the configured model. This silent fallback ensures internal operations remain uninterrupted while preserving the user-facing model configuration.

## Related Models

- [[gemini-2-5-flash]] — Secondary fallback in the chain
- [[gemini-2-5-pro]] — Tertiary fallback in the chain
- [[model-routing]] — The broader feature this model participates in