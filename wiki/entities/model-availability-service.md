---
type: entity
title: "ModelAvailabilityService"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "internal-service"
  - "routing"
  - "model-management"
related:
  - "[[model-routing]]"
  - "[[gemini-cli]]"
sources: ["III. 10. Model routing.md"]
---

# ModelAvailabilityService

ModelAvailabilityService is an internal component of Gemini CLI that manages model routing and health monitoring. It continuously monitors the health status of available models and automatically routes requests to available models based on defined policies.

## Role in Model Routing

The ModelAvailabilityService serves as the core mechanism for the [[model-routing]] feature. When the primary model fails due to quota errors, server errors, or other availability issues, this service initiates the fallback process and determines which backup model should receive the request.

## Key Responsibilities

- **Health monitoring:** Continuously checks the availability and responsiveness of configured models
- **Fallback initiation:** Detects failures and triggers the appropriate fallback chain
- **Policy enforcement:** Applies routing policies including silent fallback for internal utility calls
- **Request routing:** Directs requests to the selected fallback model without user interruption when policy allows

## Related Concepts

[[model-routing]] provides the user-facing description of this service's functionality. [[silent-fallback-chain]] describes the specific silent routing behavior for internal operations.