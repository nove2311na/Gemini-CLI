---
type: entity
title: "Gemini 3 Flash"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-3"
  - "ai-model"
  - "lightweight"
  - "gemini-cli"
related:
  - "[[gemini-cli]]"
  - "[[gemini-3-pro]]"
  - "[[model-routing]]"
sources:
  - "6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md"
---

# Gemini 3 Flash

Gemini 3 Flash is a lightweight variant of Google's Gemini 3 model family, optimized for speed and efficiency with simple prompts. It serves as the default selection for straightforward tasks under [[model-routing]]'s auto mode.

## Role in Model Routing

When using auto routing in [[gemini-cli]], the system evaluates each prompt's complexity:

- **Simple prompts**: Automatically routed to Gemini 3 Flash for fast response
- **Complex prompts**: Routed to [[gemini-3-pro]] if enabled, otherwise Gemini 2.5 Pro

This automatic evaluation ensures efficient resource allocation while maintaining quality for demanding tasks.

## Fallback Destination

Beyond its role in initial routing, Gemini 3 Flash serves as a fallback destination when users exhaust their Gemini 2.5 Pro daily limits. The system prompts users to switch to the Flash variant when the 2.5 Pro quota is depleted.

## Comparison with Other Flash Models

The document references "Gemini 2.5 Flash" as an additional lightweight option in the model hierarchy. The naming reflects both version differences (Gemini 2.5 vs Gemini 3) and capability tiers.

## Relationship to Gemini 3 Pro

Unlike [[gemini-3-pro]], which operates under strict daily usage limits, Gemini 3 Flash targets scenarios where speed matters more than maximum capability. The two models work in concert: Flash handles lightweight tasks while Pro handles complex ones.