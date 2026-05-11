---
type: concept
title: "Auto mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "model-selection"
  - "configuration"
related:
  - "[[model-selection]]"
  - "[[gemini-cli]]"
  - "[[manual-mode]]"
  - "[[model-command]]"
sources: ["III. 11. Gemini CLI model selection (`model` command).md"]
---

# Auto mode

Auto mode is the recommended configuration option in [[gemini-cli]] that enables automatic model selection based on task complexity. When enabled, the system dynamically chooses between different model tiers (Pro, Flash) to optimize for both performance and speed.

## How it works

Auto mode analyzes each task or sub-task within a conversation and selects the most appropriate model from the available options. For example, during a web application development session, the system might:

- Select **Pro** models for complex tasks like architecture planning or multi-stage debugging
- Select **Flash** models for simple tasks like CSS generation or format conversion

## Available Auto options

| Option | Model Family | Included Models |
|--------|--------------|-----------------|
| Auto (Gemini 3) | Gemini 3 (preview) | gemini-3-pro-preview, gemini-3-flash-preview |
| Auto (Gemini 2.5) | Gemini 2.5 (stable) | gemini-2.5-pro, gemini-2.5-flash |

## When to use Auto mode

Auto mode is ideal for:

- Mixed-complexity workflows with varying task types
- Users unfamiliar with model differences
- General-purpose development assistance
- Scenarios where optimal speed/quality balance is desired

## Comparison with Manual mode

Unlike [[manual-mode]], Auto mode removes the burden of model selection from the user. It is the recommended default per official documentation, while Manual mode serves users who need explicit control or want to optimize for specific use cases.