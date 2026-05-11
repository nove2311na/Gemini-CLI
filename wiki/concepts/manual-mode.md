---
type: concept
title: "Manual mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "model-selection"
  - "configuration"
related:
  - "[[model-selection]]"
  - "[[gemini-cli]]"
  - "[[auto-mode]]"
  - "[[model-command]]"
sources: ["III. 11. Gemini CLI model selection (`model` command).md"]
---

# Manual mode

Manual mode is a model selection option in [[gemini-cli]] that allows users to explicitly choose any available model for their CLI interactions. Unlike [[auto-mode]], this approach gives direct control over which model handles each task.

## Usage

When selecting Manual mode via the `/model` command, users can choose from any model currently available in the Gemini model lineup. This includes models across all tiers (Pro, Flash, Flash-Lite) and families (Gemini 2.5, Gemini 3).

## When to use Manual mode

Manual mode is appropriate in these scenarios:

- **Specific model requirements** — When a project or workflow requires consistent behavior from a particular model version
- **Debugging model-specific issues** — Isolating whether a problem relates to model selection
- **Performance optimization** — When the optimal model is known ahead of time based on task characteristics
- **Testing and evaluation** — Comparing outputs across different models

## Startup flag

For programmatic or scripted scenarios, the `--model` flag provides equivalent functionality at startup:

```bash
gemini --model gemini-2.5-pro
```

This allows automation scripts to pin specific models without interactive selection.

## Trade-offs

While Manual mode provides control, it requires users to understand model differences and make informed selections. The official documentation recommends [[auto-mode]] as the default for most users, as it removes this burden while still optimizing for task requirements.