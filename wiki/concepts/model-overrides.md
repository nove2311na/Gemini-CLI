---
type: concept
title: "Model Overrides"
created: 2026-05-05
updated: 2026-05-05
tags: ["model-configuration", "overrides", "conditional", "runtime"]
related:
  - "[[model-configuration]]"
  - "[[model-aliases]]"
  - "[[resolution-strategy]]"
  - "[[override-specificity]]"
  - "[[ModelConfigService]]"
  - "[[agent-awareness]]"
sources: ["4. Model configuration.md"]
---

# Model Overrides

Model Overrides are conditional rules in the [[model-configuration]] system that inject configuration based on the runtime context. They enable dynamic, context-sensitive parameter adjustment without code changes.

## Definition

Overrides are defined in the `overrides` array within the `modelConfigs` section of the configuration file. Each override contains a `match` object and a `modelConfig` to apply when matched.

## Match Criteria

Overrides apply when the request context matches the specified match properties:

- **model**: Matches the requested model name or alias
- **overrideScope**: Matches the distinct scope of the request (typically the agent name, for example `codebaseInvestigator`)

## Match Combinations

Overrides can use either criterion individually or combine both:

- **Model-only match**: Applies when a specific model is requested
- **Scope-only match**: Applies when a specific agent or scope is active
- **Combined match**: Applies only when both criteria are satisfied (highest specificity)

## Override Specificity

The [[override-specificity]] system prioritizes matches by the number of matched keys. More specific matches (with more matched keys) override broader matches.

### Tie-Breaking

When specificity is equal (same number of matched keys), the order of definition in the overrides array is preserved. The last matching override wins.

## Merge Semantics

After filtering and sorting, configurations from sorted overrides are merged sequentially onto the base configuration. This merge process applies the [[resolution-strategy]] step 2.

## Practical Use Cases

- **Agent-Specific Injection**: Enforce extended thinking budgets for a specific agent without altering global defaults
- **Model Routing**: Redirect a specific model to an experimental version for A/B testing
- **Environment Differentiation**: Apply different settings for testing vs. production contexts

## Integration with Agent Awareness

Overrides can target specific agents via overrideScope, connecting to [[agent-awareness]]. This enables applying configuration tailored to the active agent's context.