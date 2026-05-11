---
type: entity
title: "/assign Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "command"
  - "issue-management"
  - "community"
  - "contribution-workflow"
related:
  - "[[unassign-command]]"
  - "[[issue-command-protocol]]"
  - "[[automated-review-tool]]"
  - "[[review-sh]]"
sources: ["3. Issue and PR automation.md"]
---

# /assign Command

The `/assign` command is a self-service mechanism in Gemini CLI that allows community contributors to self-assign issues by adding a comment to the issue thread. This slash command implements an automated workflow for claiming work without requiring direct maintainer intervention.

## Usage

When a user executes `/assign` in an issue or PR comment, the system automatically adds a comment indicating the user's intent to work on that issue.

## Requirements and Guardrails

The `/assign` command enforces two key requirements to maintain healthy contribution workflows:

1. **Label Requirement**: The issue must be labeled "help wanted" to be eligible for self-assignment. This ensures contributors only claim issues explicitly marked as available for community contribution, preventing conflicts with internal priorities or sensitive work.

2. **Assignment Limit**: Each user may have a maximum of 3 active assignments at any time. This cap prevents any single contributor from monopolizing available work and ensures distributed participation across the community.

## Purpose

The command serves the [[issue-command-protocol]] by providing a standardized, automated mechanism for issue claiming. This approach reduces maintainer overhead for routine workflow management while still maintaining oversight through the label and limit restrictions.

## Relationship to Unassign

The `/assign` command is paired with [[unassign-command]], which provides the corresponding functionality for releasing claimed issues. Together, these commands form a complete self-service lifecycle for issue ownership in the community workflow.