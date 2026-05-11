---
type: entity
title: "review.sh"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "tool"
  - "automation"
  - "code-review"
  - "pull-request"
  - "script"
related:
  - "[[automated-review-tool]]"
  - "[[assign-command]]"
  - "[[unassign-command]]"
  - "[[issue-command-protocol]]"
sources: ["3. Issue and PR automation.md"]
---

# review.sh

`review.sh` is an automated PR review tool in Gemini CLI that detects common anti-patterns and testing issues in pull request submissions. It serves as a first line of defense for maintaining code quality standards across contributions.

## Usage

```bash
./scripts/review.sh <PR_NUMBER> [model]
```

The script accepts a PR number as a required argument and optionally accepts a model parameter for configuring the review analysis.

## Purpose

The tool performs automated checks on pull requests, focusing on two primary areas:

1. **Anti-pattern Detection**: Identifying code patterns that deviate from project conventions or best practices
2. **Testing Issues**: Ensuring contributions include appropriate test coverage and quality

## Relationship to Workflow

`review.sh` integrates into the [[combined-workflows]] by providing automated quality gates for the contribution process. When combined with [[shell-commands]], it enables maintainers to run batch reviews efficiently. The review results help contributors address issues before maintainer intervention, reducing the review cycle time.

## Technical Context

The script resides in the `./scripts/` directory alongside other development utilities. Its existence reflects the project's commitment to maintaining quality through automation rather than relying solely on manual review processes.