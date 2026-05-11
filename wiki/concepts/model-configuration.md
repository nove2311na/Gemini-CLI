---
type: concept
title: "Model Configuration"
created: 2026-05-05
updated: 2026-05-05
tags: ["model-configuration", "hyperparameters", "power-user"]
related:
  - "[[ModelConfigService]]"
  - "[[model-aliases]]"
  - "[[model-overrides]]"
  - "[[resolution-strategy]]"
  - "[[model-selection]]"
  - "[[model-command]]"
  - "[[agent-awareness]]"
sources: ["4. Model configuration.md"]
---

# Model Configuration

Model Configuration is a decoupled system for controlling model generation parameters in Gemini CLI. It provides deterministic, context-aware control over how models behave by separating the requested model identifier from the underlying API configuration.

## Overview

The Model Configuration system enables precise hyperparameter tuning, environment-specific behavior customization, and agent-scoped settings. It is designed for researchers, AI quality engineers, and advanced users who need rigorous control over generative model behavior.

## Core Components

The system rests on two primitives:

- **[[model-aliases]]**: Static, reusable configuration presets with optional inheritance via extends
- **[[model-overrides]]**: Conditional rules evaluated at runtime based on model and overrideScope match criteria

## Resolution

The [[resolution-strategy]] ensures predictable configuration finalization through a two-step process: alias resolution followed by override application.

## Relationship to Other Concepts

Model configuration serves as the lower-level mechanism underlying [[model-selection]], providing more explicit and persistent control than the quick model switching available through the [[model-command]]. While [[model-tiers]] categorize models by capability, configuration customizes behavior within those tiers.

Overrides can target specific agents via overrideScope, connecting to [[agent-awareness]]. The system can be integrated into [[combined-workflows]] for complex research tasks.

## Usage Context

> [!CAUTION]
> This is a power-user feature. Configuration values are passed directly to the model provider with minimal validation. Incorrect settings may result in runtime errors from the API.

## Practical Applications

Three common use cases demonstrate the system's capabilities:

1. **Deterministic Baseline**: Creating aliases for tasks requiring high precision with zero temperature
2. **Agent-Specific Injection**: Applying specific settings when a particular agent is active
3. **Experimental Routing**: Redirecting traffic to preview models for A/B testing