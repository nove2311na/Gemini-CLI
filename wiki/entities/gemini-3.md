---
type: entity
title: "Gemini 3"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "model"
  - "ai-model"
related:
  - "[[gemini-cli]]"
  - "[[model-routing]]"
  - "[[model-selection]]"
sources: ["1. Gemini CLI documentation.md"]
---

# Gemini 3

Gemini 3 is the latest generation of the Gemini AI model, now supported in [[gemini-cli]]. This model brings enhanced capabilities for code understanding, task automation, and workflow integration.

## Gemini 3 in Gemini CLI

The official documentation provides dedicated coverage: [Gemini 3 on Gemini CLI](https://geminicli.com/docs/get-started/gemini-3)

This guide explains:
- How to enable and use Gemini 3
- Specific capabilities unique to Gemini 3
- Configuration options for Gemini 3
- Comparison with other available models

## Key Capabilities

Gemini 3 builds on previous Gemini versions with improvements in:

- **Code understanding** — Better comprehension of complex codebases
- **Context retention** — Improved handling of large context windows
- **Reasoning** — Enhanced logical reasoning and problem-solving
- **Tool use** — More reliable integration with external tools and APIs

## Model Selection

When using Gemini 3, you can leverage [[model-routing]] for automatic fallback resilience. The system can automatically switch to alternative models when needed, ensuring reliable task completion.

For manual model selection, refer to [Model selection](https://geminicli.com/docs/cli/model).

## Configuration

Gemini 3 supports fine-tuning through model configuration settings:

- Temperature adjustments
- Thinking budget allocation
- Token limits
- Custom system prompts

See [Model configuration](https://geminicli.com/docs/cli/generation-settings) for detailed options.

## Documentation Links

- [Gemini 3 on Gemini CLI](https://geminicli.com/docs/get-started/gemini-3)
- [Model selection](https://geminicli.com/docs/cli/model)
- [Model configuration](https://geminicli.com/docs/cli/generation-settings)
- [Model routing](https://geminicli.com/docs/cli/model-routing)