---
type: entity
title: "gemini-2.5-pro"
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
  - "[[gemini-2-5-flash]]"
sources: ["III. 10. Model routing.md"]
---

# gemini-2.5-pro

gemini-2.5-pro is a Google AI model that serves as the tertiary (final) fallback in the internal silent fallback chain for Gemini CLI's internal utility calls.

## Role in Fallback Chain

gemini-2.5-pro represents the last resort in the silent fallback chain for internal operations. If both [[gemini-2-5-flash-lite]] and [[gemini-2.5-flash]] fail during internal utility calls, the system routes to this model before potentially escalating to user-facing error handling.

## Position in the Chain

The silent fallback chain progresses as follows:

1. gemini-2.5-flash-lite (primary for internal calls)
2. gemini-2.5-flash (secondary fallback)
3. gemini-2.5-pro (tertiary fallback)

This chain operates silently without changing the configured model, ensuring internal operations remain resilient while maintaining the user's intended model selection for visible interactions.

## Related Concepts

- [[model-routing]] — The broader resilience feature this model participates in
- [[silent-fallback-chain]] — The specific mechanism for internal operations