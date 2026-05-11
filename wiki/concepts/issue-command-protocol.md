---
type: concept
title: "Issue Command Protocol"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "protocol"
  - "slash-commands"
  - "issue-management"
  - "community"
  - "workflow-automation"
related:
  - "[[assign-command]]"
  - "[[unassign-command]]"
  - "[[automated-review-tool]]"
  - "[[review-sh]]"
sources: ["3. Issue and PR automation.md"]
---

# Issue Command Protocol

The issue command protocol refers to the system of slash commands that automate self-service issue management for community contributors. It implements a structured approach to claiming and releasing work through lightweight comment-based commands with built-in guardrails.

## Definition

An issue command protocol is a workflow automation pattern that enables community members to self-manage issue ownership through natural language commands. Unlike traditional assignment workflows requiring maintainer action, slash commands provide immediate, automated response to contributor requests.

## Implementation in Gemini CLI

Gemini CLI implements this protocol through two slash commands:

- [[assign-command]]: Allows self-assignment with label verification and assignment limits
- [[unassign-command]]: Allows self-release without restrictions

The protocol enforces structured guardrails through the `/assign` command, requiring the "help wanted" label and capping assignments at 3 per contributor.

## Design Principles

The issue command protocol reflects several community management principles:

1. **Frictionless participation**: Contributors can claim work immediately without waiting for maintainer approval
2. **Protected labels**: The "help wanted" requirement ensures only explicitly available work is claimed
3. **Fair distribution**: The 3-issue cap prevents any individual from monopolizing available work
4. **Low overhead release**: Unassigning requires no justification, encouraging honest release when circumstances change

## Relationship to Automated Review

The protocol complements the [[automated-review-tool]] by addressing different aspects of the contribution workflow. While the automated review tool ensures code quality, the issue command protocol ensures community coordination. Together, they represent a hybrid automation approach that covers both technical and social dimensions of contribution management.

## Comparison to Alternatives

Traditional issue assignment requires direct maintainer intervention for each claiming and release action. The issue command protocol reduces this overhead while maintaining structural constraints that prevent workflow disruption. This represents a middle ground between fully open claiming (no restrictions) and fully controlled assignment (maintainer-only).