---
type: concept
title: "Usage Limits"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "quotas"
  - "fallback"
  - "capacity"
related:
  - "[[gemini-cli]]"
  - "[[gemini-3-pro]]"
  - "[[gemini-3-flash]]"
  - "[[model-routing]]"
  - "[[authentication-methods]]"
sources:
  - "6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md"
---

# Usage Limits

Usage limits define the daily quotas and constraints governing how users interact with Gemini models in [[gemini-cli]]. These limits trigger fallback mechanisms and capacity management features.

## Daily Limits and Fallback Chains

### Gemini 3 Pro Limits

When users exhaust their Gemini 3 Pro daily quota, [[gemini-cli]] presents three options:

1. **Switch to Gemini 2.5 Pro**: Continue with a slightly less capable model
2. **Upgrade for higher limits**: Explore paid or organizational options with increased quotas
3. **Stop**: Pause work until the daily limit resets

The system also displays when the limit resets, helping users plan subsequent sessions.

### Gemini 2.5 Pro Limits

If the 2.5 Pro daily limit is reached, the system automatically prompts a fallback to [[gemini-3-flash]], avoiding complete service interruption.

## Complete Fallback Hierarchy

```
Gemini 3 Pro → (limit) → Gemini 2.5 Pro → (limit) → Gemini 3 Flash → (limit) → Stop
```

This chain ensures users can continue working even as quotas deplete, trading capability for availability.

## Capacity Errors

Capacity errors differ from usage limits. They occur when the Gemini 3 Pro servers are overloaded due to demand rather than individual quota exhaustion. During capacity errors, [[gemini-cli]] prompts users to choose between:

- Continue attempting Gemini 3 Pro (retry through overload)
- Fall back to Gemini 2.5 Pro immediately

This user-controlled decision provides flexibility during high-demand periods.

## Impact on Model Routing

[[Model-routing]] strategies interact with usage limits:

- **Auto routing** naturally spreads usage across models, potentially extending the effective daily capacity
- **Pro routing** concentrates requests on flagship models, exhausting their limits faster

## Enterprise Considerations

In [[gemini-code-assist]] environments, enterprise administrators may configure organizational usage limits separately from consumer defaults. The Preview release channel access also impacts which models and limits apply.