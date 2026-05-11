---
type: concept
title: "Self-Assignment"
created: 2026-05-05
updated: 2026-05-05
tags: ["contribution", "issues", "workflow", "community"]
related: ["contribution-workflow", "help-wanted-label", "gemini-cli"]
sources: ["1. Contribution guide.md"]
---

# Self-Assignment

Self-assignment is a system that allows contributors to claim issues for themselves without requiring maintainer intervention. This enables community-driven contribution while maintaining coordination across multiple contributors.

## Commands

To assign an issue to yourself, add a comment containing only `/assign`. To release an issue, add a comment containing only `/unassign`. The comment must contain only that text and nothing else for the command to work correctly.

## Constraints

The system enforces two key constraints. First, contributors can have a maximum of 3 issues assigned at any given time. Attempting to assign a fourth issue will be rejected until one is released. Second, only issues labeled with `help-wanted` can be self-assigned. Issues tagged as `🔒Maintainers only` are reserved for project maintainers and cannot be claimed by community members.

## Help-Wanted Label

The `help-wanted` label marks issues that are explicitly open for community contribution. Only maintainers can apply this label after reviewing whether an issue is suitable for external contributors. Community members can request consideration by commenting on an issue, but only maintainers have authority to apply the label.

## Workflow Integration

Self-assignment works within the larger contribution workflow: find a `help-wanted` issue → self-assign with `/assign` → fork and create branch → make changes → open PR linked to the issue. If circumstances change, release the issue promptly with `/unassign` so others can pick it up.

## Related Concepts

- [[contribution-workflow]] — Overall contribution process
- [[help-wanted-label]] — Label that enables self-assignment
- [[gemini-cli]] — The project receiving contributions