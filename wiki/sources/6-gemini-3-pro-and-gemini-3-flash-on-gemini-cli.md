---
type: source
title: "Gemini 3 Pro and Gemini 3 Flash on Gemini CLI"
authors: []
year: 2026
url: "https://geminicli.com/docs/get-started/gemini-3/"
venue: "geminicli.com"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-3"
  - "gemini-cli"
  - "model-selection"
  - "enterprise"
related:
  - "[[gemini-cli]]"
  - "[[gemini-3-pro]]"
  - "[[gemini-3-flash]]"
  - "[[model-routing]]"
  - "[[usage-limits]]"
  - "[[gemini-code-assist]]"
sources:
  - "6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md"
---

# Gemini 3 Pro and Gemini 3 Flash on Gemini CLI

This source documents how to use Gemini 3 Pro and Gemini 3 Flash models within [[gemini-cli]]. It covers the two-tier enterprise enablement process, usage limits and fallback behavior, and model routing strategies.

## Key Findings

### Getting Started with Gemini 3

To access Gemini 3, users must upgrade to version 0.21.1 or later via `npm install -g @google/gemini-cli@latest`. Once installed, running `/model` and selecting "Auto (Gemini 3)" enables the model.

### Usage Limits and Fallback Chains

The source documents a two-stage fallback mechanism:

1. **Gemini 3 Pro limit reached**: Users can switch to Gemini 2.5 Pro, upgrade to higher limits, or stop.
2. **Gemini 2.5 Pro limit reached**: Automatic prompt to fallback to Gemini 2.5 Flash.

### Capacity Errors

Server-side overload situations require user intervention, allowing choice between retrying Gemini 3 Pro or falling back to Gemini 2.5 Pro.

### Model Routing Strategies

Two routing modes control request distribution:

- **Auto routing**: Evaluates prompt complexity, using Flash for simple tasks and Pro for complex ones.
- **Pro routing**: Prioritizes the most capable available model regardless of complexity.

### Enterprise Enablement via Gemini Code Assist

The source reveals a two-step administrative process for enterprise environments:

1. **Administrator step**: Google Cloud Settings Admin must enable "Preview" release channel.
2. **User step**: Individual users must set "Preview Features" to `true` in `/settings`.

## Connection to Model Steering

While [[model-steering]] provides mid-turn correction capabilities, model routing operates at the pre-turn selection level, determining which model receives each request before processing begins.

## Source Quality

Strong technical documentation with specific version requirements, concrete commands, and official Google Cloud administrative instructions. The fallback chains are clearly specified.