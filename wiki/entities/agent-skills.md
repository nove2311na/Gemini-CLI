---
type: entity
title: "Agent Skills"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensibility"
  - "agent-customization"
related:
  - "[[model-steering]]"
  - "[[plan-mode]]"
  - "[[extensions]]"
sources: ["1. Gemini CLI documentation.md", "2. Get started with Agent Skills.md", "7. Use Plan Mode with model steering for complex tasks.md", "III. 12. Model steering (experimental).md"]
---

# Agent Skills

Agent Skills are a customization capability in [[gemini-cli]] that allows developers to extend and tailor agent behavior for specific tasks or domains. They represent an advanced extensibility feature that builds upon the foundational capabilities of the CLI.

## Overview

Agent Skills enable developers to define custom behaviors, workflows, and capabilities that the agent can调用 during task execution. This allows for highly specialized agent behavior suited to particular project requirements or development workflows.

## Relationship to Model Steering

Agent Skills are recommended as the next step after learning [[model-steering]]. While model steering provides real-time guidance during execution, Agent Skills enable pre-defined behaviors and responses that the agent can apply automatically.

## Use Cases

Common applications for Agent Skills include:

- **Domain-specific knowledge:** Embedding expertise in particular technical domains
- **Custom workflows:** Defining specialized task execution patterns
- **Tool integrations:** Creating custom tool wrappers or sequences
- **Response formatting:** Establishing output standards for specific project types

## Learning Path

The official documentation suggests the following progression:

1. Start with model steering for real-time guidance
2. Progress to [[plan-mode]] for complex structured tasks
3. Build custom Agent Skills for persistent, automated behavior

## See Also

- [[model-steering]] — Real-time guidance feature
- [[plan-mode]] — Structured environment for complex tasks
- [[extensions]] — Broader packaging system that may include Agent Skills