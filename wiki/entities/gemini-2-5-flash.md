---
type: entity
title: "gemini-2.5-flash"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google"
  - "ai-model"
  - "fallback"
related:
  - "[[model-routing]]"
  - "[[silent-fallback-chain]]"
  - "[[gemini-2-5-flash-lite]]"
  - "[[gemini-2-5-pro]]"
sources: ["III. 10. Model routing.md"]
---

# gemini-2.5-flash

gemini-2.5-flash is a Google AI model that serves as the secondary fallback in the internal silent fallback chain for Gemini CLI's internal utility calls.

## Role in Fallback Chain

gemini-2.5-flash occupies the second position in the silent fallback chain for internal operations. When [[gemini-2-5-flash-lite]] fails during internal utility calls, the system automatically routes to this model without user prompting.

## Position in the Chain

The silent fallback chain progresses as follows:

1. gemini-2.5-flash-lite (primary for internal calls)
2. gemini-2.5-flash (secondary fallback)
3. [[gemini-2-5-pro]] (tertiary fallback)

This chain operates silently without changing the configured model, ensuring internal operations remain resilient while maintaining the user's intended model selection for visible interactions.

## Related Concepts

- [[model-routing]] — The broader resilience feature this model participates in
- [[silent-fallback-chain]] — The specific mechanism for internal operations