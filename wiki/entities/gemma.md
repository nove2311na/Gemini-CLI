---
type: entity
title: "Gemma"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google"
  - "open-model"
  - "local-model"
  - "routing"
related:
  - "[[local-model-routing]]"
  - "[[model-routing]]"
  - "[[gemma-local-routing]]"
sources: ["III. 10. Model routing.md"]
---

# Gemma

Gemma is a Google open model used for local model routing in Gemini CLI. Unlike hosted Gemini models, Gemma runs entirely on the local machine, providing a cost-effective and privacy-preserving alternative for making routing decisions.

## Local Routing with Gemma

When enabled, Gemma handles routing decisions instead of sending these decisions to a hosted model. This approach offers several advantages over traditional hosted routing approaches.

## Benefits

- **Cost reduction:** Eliminates API costs associated with routing decisions since Gemma runs locally
- **Privacy:** Routing decisions stay on the local machine, ensuring sensitive context is not sent externally
- **Similar quality:** Provides routing decision latency and quality comparable to hosted routing
- **Availability:** Works independently of external API availability

## Experimental Status

Gemma-based local routing is an experimental feature. Users should be aware of the following considerations when enabling this feature:

- Limited support compared to production features
- May have different update cadence and quality expectations
- Configuration may require manual intervention for advanced options

## Setup

The easiest way to configure Gemma for local routing is using the automated `gemini gemma setup` command. This command handles the initial configuration and ensures Gemma is properly integrated with Gemini CLI's routing system.