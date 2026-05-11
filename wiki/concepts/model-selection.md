---
type: concept
title: "Model selection"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "configuration"
  - "ai-models"
related:
  - "[[gemini-cli]]"
  - "[[model-command]]"
  - "[[auto-mode]]"
  - "[[manual-mode]]"
sources: ["III. 11. Gemini CLI model selection (`model` command).md"]
---

# Model selection

Model selection in [[gemini-cli]] refers to the process of choosing which AI model powers CLI interactions. This configuration directly impacts the quality, speed, and capability of AI-assisted responses throughout a [[session]].

## Overview

Model selection provides control over the balance between result quality and response speed. The `/model` command serves as the primary interface for this configuration, offering both automatic and manual selection modes.

## Selection Modes

### Auto mode

The recommended default for most users. Auto mode allows the system to dynamically select the optimal model based on task complexity. Two Auto options are available:

- **Auto (Gemini 3)** — Uses the latest Gemini 3 models (gemini-3-pro-preview, gemini-3-flash-preview)
- **Auto (Gemini 2.5)** — Uses proven Gemini 2.5 models (gemini-2.5-pro, gemini-2.5-flash)

### Manual mode

Allows explicit selection of any available model. This mode is useful when specific model behaviors are required or when debugging model-specific issues.

## Best Practices

1. **Default to Auto** — Provides optimal balance between speed and performance for mixed-task scenarios
2. **Use Pro for complexity** — Switch when tasks involve complex reasoning, multi-stage debugging, or architectural decisions
3. **Use Flash for speed** — Choose for simple format conversions, basic queries, and rapid iterations

## Startup Configuration

The `--model` flag enables configuration at launch for automation and scripting:

```bash
gemini --model gemini-2.5-flash
```

This is particularly useful for CI/CD pipelines and predefined workflows.

## Connection to Session Management

Model selection interacts with [[session-management]] as changes apply to all subsequent interactions. When resuming sessions or forking conversations, the model selection persists across the session lifecycle.