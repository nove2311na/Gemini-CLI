---
type: concept
title: "Contribution Workflow"
created: 2026-05-05
updated: 2026-05-05
tags: ["contribution", "workflow", "pull-requests", "github"]
related: ["gemini-cli", "contributor-license-agreement", "self-assignment", "atomic-pull-requests", "conventional-commits", "preflight-checks", "review-frontend", "development-environment"]
sources: ["1. Contribution guide.md"]
---

# Contribution Workflow

The contribution workflow for Gemini CLI defines the complete process from finding an issue to getting a pull request merged. It establishes mandatory requirements, recommended practices, and automated tooling to ensure quality contributions.

## Process Overview

The workflow follows these sequential steps: first, a Contributor License Agreement (CLA) must be signed at [cla.developers.google.com](https://cla.developers.google.com/). Contributors then find `help-wanted` labeled issues they wish to work on. After forking the repository and creating a branch, they make changes in the `packages/` directory, run preflight checks to verify quality, and open a pull request linked to the original issue.

## Issue Assignment

The project uses a self-assignment system for community contribution. Contributors add a comment containing only `/assign` to claim an issue, and `/unassign` to release it. The system enforces a maximum of 3 assigned issues per contributor at any time. Only issues with the `help-wanted` label can be self-assigned; issues tagged as `🔒Maintainers only` are reserved for project members.

## Pull Request Requirements

All PRs must link to an existing issue (bug report or approved feature proposal). The project strongly favors atomic, focused PRs addressing single issues rather than bundling unrelated changes. Draft PRs are explicitly supported for early feedback before formal review. Documentation updates are required for user-facing changes. Commit messages must follow the Conventional Commits standard, and PR titles should clearly describe the change.

## Review Process

The project provides an automated review tool that detects common anti-patterns, testing issues, and best practices. Contributors are encouraged to run this tool on their own PRs before requesting maintainer review. Reviewers should use the tool to augment their manual review process, not replace it.

## Quality Gates

The `npm run preflight` command serves as the primary quality gate, running all tests, linting, and formatting checks. This must pass before any PR submission. The review tool provides an additional layer of validation for code quality and patterns.

## Related Concepts

- [[self-assignment]] — Issue claiming system with /assign and /unassign
- [[atomic-pull-requests]] — Small, focused PR philosophy
- [[conventional-commits]] — Required commit message format
- [[preflight-checks]] — Quality gate before PR submission
- [[review-frontend]] — Automated review tooling
- [[contributor-license-agreement]] — Mandatory legal requirement