---
type: concept
title: "Model Routing"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "model-selection"
  - "performance"
  - "cost-management"
related:
  - "[[gemini-cli]]"
  - "[[gemini-3-pro]]"
  - "[[gemini-3-flash]]"
  - "[[model-steering]]"
sources:
  - "6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md"
---

# Model Routing

Model routing determines how [[gemini-cli]] distributes requests between available AI models based on selected strategies. This pre-turn selection mechanism differs from [[model-steering]], which operates mid-turn for behavioral corrections.

## Routing Strategies

### Auto Routing (Default)

Auto routing evaluates each prompt's complexity before model assignment:

1. **Simple prompts**: Automatically select [[gemini-3-flash]] for fast response
2. **Complex prompts**: If [[gemini-3-pro]] is enabled, route to the flagship model; otherwise use Gemini 2.5 Pro

This approach optimizes for both speed and capability by matching task requirements to appropriate resources.

### Pro Routing

Pro routing prioritizes maximum capability over automatic optimization:

- Selects the most powerful available model for every request
- Overrides automatic complexity assessment
- Useful when users want consistent top-tier performance regardless of prompt type

## Implementation

Users control routing via the `/model` command:

```
/model
```

This opens an interactive selection interface where users choose between:

- Auto routing with Gemini 3 (default)
- Pro routing for maximum capability

## Relationship to Model Steering

While both features influence model behavior, they operate at different stages:

| Aspect | Model Routing | Model Steering |
|--------|--------------|----------------|
| **Timing** | Pre-turn selection | Mid-turn correction |
| **Purpose** | Model assignment | Behavior adjustment |
| **Scope** | Which model processes request | How selected model responds |
| **Control** | Static configuration | Dynamic intervention |

## Usage Considerations

### Auto Routing Misconception

Some users may assume "Auto" means the selected model handles all requests. In reality, auto routing actively decides between models based on complexity, potentially routing simple prompts to Flash even when Pro is available.

### Pro Routing Trade-offs

Pro routing ensures consistent quality but consumes [[usage-limits]] more rapidly, as even simple prompts receive flagship model treatment.

## Enterprise Context

In [[gemini-code-assist]] environments, model routing availability depends on both administrator enablement of the Preview release channel and individual user activation of Preview Features in settings.