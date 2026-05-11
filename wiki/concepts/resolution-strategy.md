---
type: concept
title: "Resolution Strategy"
created: 2026-05-05
updated: 2026-05-05
tags: ["model-configuration", "resolution", "algorithm", "configuration"]
related:
  - "[[model-configuration]]"
  - "[[model-aliases]]"
  - "[[model-overrides]]"
  - "[[override-specificity]]"
  - "[[ModelConfigService]]"
sources: ["4. Model configuration.md"]
---

# Resolution Strategy

The Resolution Strategy is the two-step algorithm implemented by [[ModelConfigService]] to determine the final configuration for a model request. It ensures predictable, deterministic configuration finalization.

## Overview

When a model request is made, the system does not immediately use the requested configuration. Instead, it passes through a structured resolution process that considers aliases, inheritance chains, and conditional overrides.

## Step 1: Alias Resolution

The first step resolves the base configuration through alias lookup and inheritance.

### Process

1. The requested model string is looked up in the merged map of system aliases and user `customAliases`
2. If found, the system recursively resolves the `extends` chain
3. Settings are merged from parent to child (child wins)
4. This results in a base `ResolvedModelConfig`
5. If not found, the requested string is treated as the raw model name

### Inheritance Chain

The recursive resolution handles nested inheritance. For example, if alias A extends B, and B extends C, the system resolves C first, then merges B, then merges A.

## Step 2: Override Application

The second step applies dynamic overrides to the base configuration.

### Process

1. **Filtering**: All matching overrides are identified based on the request context (model and overrideScope)
2. **Sorting**: Matches are prioritized by [[override-specificity]] (number of matched keys)
3. **Merging**: The configurations from sorted overrides are merged sequentially onto the base configuration

### Specificity Sorting

Overrides with more matched keys rank higher than those with fewer matches. For example, an override matching both `model` and `overrideScope` applies before one matching only `model`.

## Merge Order Summary

The complete merge order is:

1. Parent alias settings (from extends chain)
2. Child alias settings (overriding parent)
3. Override configurations (sorted by specificity)
4. Last-override-wins for ties at equal specificity

## Determinism Guarantees

The resolution strategy provides determinism through:

- Clear precedence rules (alias inheritance, specificity ranking)
- Documented tie-breaking (definition order preserved)
- Sequential merging (predictable accumulation)

## Limitations

The system does not validate for cyclic inheritance in extends chains. A misconfigured alias with circular references could cause infinite recursion.

## Relationship to Configuration

The resolution strategy applies to all [[model-aliases]] and [[model-overrides]] configured in the `modelConfigs` section.