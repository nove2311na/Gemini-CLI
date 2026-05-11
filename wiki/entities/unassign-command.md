---
type: entity
title: "/unassign Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "command"
  - "issue-management"
  - "community"
  - "contribution-workflow"
related:
  - "[[assign-command]]"
  - "[[issue-command-protocol]]"
  - "[[automated-review-tool]]"
  - "[[review-sh]]"
sources: ["3. Issue and PR automation.md"]
---

# /unassign Command

The `/unassign` command is a self-service mechanism in Gemini CLI that allows contributors to release their claim on an issue by adding a a comment to the issue thread. This slash command complements the [[assign-command]] to provide a complete self-service lifecycle for issue ownership management.

## Usage

When a user executes `/unassign` in an issue or PR comment, the system automatically adds a comment indicating the user's intent to release their claim on that issue.

## Purpose

The command serves the [[issue-command-protocol]] by enabling contributors to voluntarily relinquish ownership of an issue. This is particularly valuable when:

- A contributor's circumstances change and they can no longer work on the issue
- The scope of an issue proves too large or complex for initial assessment
- A better-suited contributor wants to step in

## Relationship to Assign

The `/unassign` command is the inverse of [[assign-command]]. Where `/assign` enforces label requirements and assignment limits, `/unassign` provides a straightforward release mechanism without similar restrictions. This asymmetry reflects the design philosophy that releasing work should be frictionless while claiming work benefits from structured guardrails.

## Integration with Workflow

Combined with `/assign`, these commands enable the self-service contribution model central to the [[automated-review-tool]] ecosystem. Maintainers can focus on high-value review work while the community handles routine claiming and release operations automatically.