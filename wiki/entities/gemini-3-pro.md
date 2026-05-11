---
type: entity
title: "Gemini 3 Pro"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-3"
  - "ai-model"
  - "flagship"
  - "gemini-cli"
related:
  - "[[gemini-cli]]"
  - "[[gemini-3-flash]]"
  - "[[model-routing]]"
  - "[[usage-limits]]"
  - "[[gemini-code-assist]]"
sources:
  - "6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md"
---

# Gemini 3 Pro

Gemini 3 Pro is Google's latest flagship AI model available in [[gemini-cli]] starting from version 0.21.1. It represents the most capable model option for complex tasks, offering enhanced reasoning and generation capabilities.

## Capabilities

As the flagship model, Gemini 3 Pro handles complex prompts including architectural decisions, multi-step reasoning, and detailed code generation. When enabled via `/model` and selected as "Auto (Gemini 3)" or "Pro" routing, it processes requests requiring sophisticated understanding.

## Usage Limits and Fallback

Gemini 3 Pro operates under daily usage limits. When users reach their limit, [[gemini-cli]] presents three options:

1. Switch to Gemini 2.5 Pro
2. Upgrade to higher limits
3. Stop processing

The system also indicates when the daily limit resets, enabling users to plan their work accordingly.

### Fallback Chain

The fallback mechanism follows a predictable chain:

```
Gemini 3 Pro → (limit reached) → Gemini 2.5 Pro → (limit reached) → Stop
```

## Capacity Errors

During server-side overload, users receive a prompt to either:

- Continue attempting Gemini 3 Pro
- Fall back to Gemini 2.5 Pro

This user-controlled decision provides flexibility during high-demand periods.

## Model Routing Integration

Gemini 3 Pro integrates with [[model-routing]] in two modes:

### Auto Routing

Auto routing evaluates each prompt's complexity. For simple tasks, it automatically selects [[gemini-3-flash]] instead. For complex tasks, if Gemini 3 Pro is enabled, it uses the flagship model.

### Pro Routing

Pro routing prioritizes the most capable model available. When Gemini 3 Pro is enabled, it serves as the primary model for all requests regardless of apparent complexity.

## Enterprise Availability

In [[gemini-code-assist]] environments, Gemini 3 Pro requires both administrator enablement of the "Preview" release channel and individual user activation of "Preview Features" in settings.