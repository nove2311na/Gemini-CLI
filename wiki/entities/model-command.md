---
type: entity
title: "/model command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "command"
  - "model-selection"
related:
  - "[[gemini-cli]]"
  - "[[model-selection]]"
  - "[[auto-mode]]"
  - "[[manual-mode]]"
sources: ["III. 11. Gemini CLI model selection (`model` command).md"]
---

# /model command

The `/model` command is a built-in command in [[gemini-cli]] that allows users to configure which AI model powers CLI interactions. This command provides direct control over the quality and speed characteristics of AI responses.

## Overview

Running `/model` opens an interactive dialog with three configuration options:

- **Auto (Gemini 3)** — System selects the best Gemini 3 model (gemini-3-pro-preview or gemini-3-flash-preview)
- **Auto (Gemini 2.5)** — System selects the best Gemini 2.5 model (gemini-2.5-pro or gemini-2.5-flash)
- **Manual** — User explicitly selects any available model

## Startup Configuration

For automation and scripting scenarios, the `--model` flag can be used at startup to set the desired model:

```bash
gemini --model gemini-2.5-flash
```

Changes made through `/model` apply to all subsequent interactions within the current session.

## Usage Context

Model selection affects the outcomes of all [[session]] interactions, making it a fundamental configuration choice for [[gemini-cli]] usage. The [[model-selection]] concept page provides best practices and guidance for choosing between options.