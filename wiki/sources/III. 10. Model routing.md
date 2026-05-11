---
type: source
title: "Model Routing"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "model-routing"
  - "fallback"
  - "resilience"
  - "configuration"
related:
  - "[[model-routing]]"
  - "[[local-model-routing]]"
  - "[[model-selection-precedence]]"
  - "[[gemini-cli]]"
  - "[[model-steering]]"
sources: ["III. 10. Model routing.md"]
---

# Model Routing

This source documents the model routing feature in Gemini CLI, which provides automatic resilience when the primary model fails.

## Summary

Gemini CLI includes a model routing feature that automatically switches to a fallback model in case of a model failure. This feature is enabled by default and provides resilience when the primary model is unavailable.

## Key Mechanisms

### ModelAvailabilityService

Model routing is managed by the `ModelAvailabilityService`, which monitors model health and automatically routes requests to available models based on defined policies.

### Fallback Process

1. **Model failure:** If the currently selected model fails (for example, due to quota or server errors), the CLI will initiate the fallback process.
2. **User consent:** Depending on the failure and the model's policy, the CLI may prompt you to switch to a fallback model.
3. **Model switch:** If approved, or if the policy allows for silent fallback, the CLI will use an available fallback model for the current turn or the remainder of the session.

### Silent Fallback Chain

Some internal utility calls (such as prompt completion and classification) use a silent fallback chain for `gemini-2.5-flash-lite` and will fall back to `gemini-2.5-flash` and `gemini-2.5-pro` without prompting or changing the configured model.

### Local Model Routing (Experimental)

Gemini CLI supports using a local model for routing decisions. When configured, Gemini CLI will use a locally-running **Gemma** model to make routing decisions instead of sending routing decisions to a hosted model. This feature can help reduce costs associated with hosted model usage while offering similar routing decision latency and quality.

The easiest way to set this up is using the automated `gemini gemma setup` command.

### Model Selection Precedence

The model used by Gemini CLI is determined by the following order of precedence:

1. **`--model` command-line flag**
2. **`GEMINI_MODEL` environment variable**
3. **`model.name` in `settings.json`**
4. **Local model (experimental)**
5. **Default model (`auto`)**