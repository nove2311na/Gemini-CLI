---
type: concept
title: "Atomic Pull Requests"
created: 2026-05-05
updated: 2026-05-05
tags: ["pull-requests", "contribution", "best-practices", "code-review"]
related: ["contribution-workflow", "conventional-commits"]
sources: ["1. Contribution guide.md"]
---

# Atomic Pull Requests

Atomic pull requests are small, focused changes that address a single issue or add one self-contained feature. This approach is strongly preferred in the Gemini CLI project and represents a core contribution philosophy.

## Definition and Characteristics

An atomic PR has these defining characteristics: it fixes exactly one specific bug OR adds exactly one specific feature. It does not bundle unrelated changes such as a bug fix, a new feature, and a refactor into a single submission. The changes are self-contained and can be reviewed, tested, and merged independently of other work.

## Why Atomic?

The atomic approach provides several benefits for both contributors and maintainers. Reviewers can focus on a specific problem without context switching across unrelated changes. Problems can be identified and fixed more precisely since each change is isolated. Merging becomes faster when PRs are small and self-contained. Rollback is simpler when issues arise since the change boundary is clear. Contributors receive faster feedback when they submit focused, digestible changes.

## Implementation Guidelines

When creating a PR, explicitly link it to the relevant issue (e.g., `Fixes #123`). Write a clear PR title using the Conventional Commits format: `feat(cli): Add --json flag to 'config get' command` rather than vague titles like `Made some changes`. In the PR description, explain the "why" behind the changes and provide context for reviewers.

## Breaking Down Large Changes

Large features or refactoring should be broken into a series of smaller, logical PRs that can be reviewed and merged independently. This incremental approach allows for early validation, reduces review complexity, and enables partial value delivery when not all parts are ready simultaneously.

## Related Concepts

- [[contribution-workflow]] — General contribution process
- [[conventional-commits]] — Required commit message format
- [[review-frontend]] — Automated review tool for PR quality