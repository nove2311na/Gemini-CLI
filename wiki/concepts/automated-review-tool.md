---
type: concept
title: "Automated Review Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "automation"
  - "code-review"
  - "quality-assurance"
  - "pull-request"
  - "anti-patterns"
related:
  - "[[review-sh]]"
  - "[[issue-command-protocol]]"
  - "[[shell-commands]]"
  - "[[combined-workflows]]"
sources: ["3. Issue and PR automation.md"]
---

# Automated Review Tool

The automated review tool is a script-based system that scans pull requests for code quality issues, including anti-patterns and testing gaps. It represents a key automation component for maintaining contribution standards in Gemini CLI.

## Definition

An automated review tool operates as an automated first-pass reviewer that catches common issues before human maintainers examine a contribution. Unlike manual review, automated tools can apply consistent criteria across all submissions without fatigue or inconsistency.

## Application in Gemini CLI

Gemini CLI implements this concept through the [[review-sh]] script located in the `./scripts/` directory. The tool accepts a PR number and optional model parameter, then performs checks to identify:

- **Anti-patterns**: Code patterns that diverge from project conventions, potentially introducing maintenance burdens or runtime issues
- **Testing issues**: Gaps in test coverage or quality problems in test implementations

## Relationship to Combined Workflows

The automated review tool integrates into [[combined-workflows]] as a quality gate within the contribution pipeline. When combined with [[shell-commands]], it enables maintainers to run programmatic reviews across multiple PRs efficiently. The tool positions itself as a pre-review checkpoint that catches obvious issues, allowing maintainer attention to focus on architectural decisions, design feedback, and nuanced evaluations that require human judgment.

## Design Philosophy

The existence of an automated review tool reflects several underlying principles:

1. **Consistency**: Automated checks apply identical criteria to every submission
2. **Efficiency**: Catching issues early reduces review cycle time and maintainer effort
3. **Education**: Contributors receive immediate feedback about project standards

## Limitations

As documented, this concept has limited technical detail regarding specific anti-patterns detected or testing criteria applied. Further investigation of the `review.sh` implementation would clarify the exact scope of automated detection.