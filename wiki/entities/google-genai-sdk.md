---
type: entity
title: "@google/genai SDK"
created: 2026-05-05
updated: 2026-05-05
tags: ["sdk", "google", "model-provider"]
related:
  - "[[ModelConfigService]]"
  - "[[model-configuration]]"
  - "[[GenerateContentConfig]]"
sources: ["4. Model configuration.md"]
---

# @google/genai SDK

The @google/genai SDK is the official Google library for interacting with Gemini models. The [[ModelConfigService]] passes resolved configurations directly to this SDK's `GenerateContentConfig` interface.

## Role in Model Configuration

When a model request is resolved through the [[resolution-strategy]], the final configuration is formatted as a `GenerateContentConfig` object and passed to this SDK. This means configuration values are passed directly to the model provider with minimal validation.

## Common Parameters

The SDK's `GenerateContentConfig` accepts several common parameters that can be configured through the [[model-configuration]] system:

- **temperature**: Controls output randomness (0.0 for deterministic, higher for creative)
- **topP**: Nucleus sampling probability
- **maxOutputTokens**: Limit on generated response length
- **thinkingConfig**: Configuration for reasoning models including thinkingBudget and includeThoughts

## Important Consideration

Since configuration values pass directly to the SDK without extensive validation, incorrect settings such as incompatible parameter combinations may result in runtime errors from the API.