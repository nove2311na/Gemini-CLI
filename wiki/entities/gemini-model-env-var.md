---
type: entity
title: "GEMINI_MODEL"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "environment-variable"
  - "configuration"
  - "model-selection"
related:
  - "[[model-selection-precedence]]"
  - "[[model-routing]]"
  - "[[settings-json]]"
sources: ["III. 10. Model routing.md"]
---

# GEMINI_MODEL

GEMINI_MODEL is an environment variable that specifies the default model for Gemini CLI. It provides a convenient way to override model selection without modifying configuration files or using command-line flags.

## Role in Model Selection

GEMINI_MODEL occupies the second position in the [[model-selection-precedence]] hierarchy. When set, this environment variable takes precedence over the `model.name` property in [[settings-json]] but is overridden by the `--model` command-line flag.

## Usage

### Setting the Environment Variable

```bash
# Linux/macOS
export GEMINI_MODEL=gemini-2.5-pro

# Windows (Command Prompt)
set GEMINI_MODEL=gemini-2.5-pro

# Windows (PowerShell)
$env:GEMINI_MODEL="gemini-2.5-pro"
```

### Verification

After setting the environment variable, launching Gemini CLI will use the specified model unless overridden by the `--model` flag at runtime.

## Precedence Comparison

| Priority | Source | GEMINI_MODEL Role |
|----------|--------|-------------------|
| Highest | `--model` flag | Overridden |
| High | GEMINI_MODEL env var | Primary source |
| Medium | settings.json | Ignored |
| Low | Gemma local router | Ignored |
| Lowest | Default (`auto`) | Ignored |

## Related Concepts

- [[model-selection-precedence]] — The complete precedence hierarchy
- [[model-routing]] — The resilience feature that applies to any selected model
- [[settings-json]] — Alternative configuration method (lower precedence)