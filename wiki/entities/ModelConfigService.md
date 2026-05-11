---
type: entity
title: "ModelConfigService"
created: 2026-05-05
updated: 2026-05-05
tags: ["service", "model-configuration", "core-engine"]
related:
  - "[[model-configuration]]"
  - "[[model-aliases]]"
  - "[[model-overrides]]"
  - "[[resolution-strategy]]"
  - "[[google-genai-sdk]]"
sources: ["4. Model configuration.md"]
---

# ModelConfigService

ModelConfigService is the core engine that resolves and applies model configurations in Gemini CLI. It provides deterministic control over model generation by decoupling the requested model identifier from the underlying API configuration.

## Responsibilities

The service handles two primary operations: alias resolution and override application. It implements the [[resolution-strategy]] algorithm that ensures predictable, context-aware configuration finalization.

### Alias Resolution

When a model string is requested, the service looks it up in the merged map of system aliases and user-defined custom aliases. If found, it recursively resolves the extends chain, merging settings from parent to child (child wins). If not found, the requested string is treated as a raw model name.

### Override Application

The service evaluates the overrides list against the request context, filtering all matching overrides, sorting them by specificity, and merging them sequentially onto the base configuration.

## Integration

ModelConfigService operates as part of the broader [[model-configuration]] system, which connects to [[model-selection]] mechanisms and the [[model-command]] interface. It passes resolved configurations directly to the [[google-genai-sdk]].

## Configuration Interface

The service accepts configuration through the `ModelConfigServiceConfig` interface, which defines the structure for custom aliases and overrides.