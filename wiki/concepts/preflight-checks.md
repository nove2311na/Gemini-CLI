---
type: concept
title: "Preflight Checks"
created: 2026-05-05
updated: 2026-05-05
tags: ["quality", "testing", "linting", "contribution", "ci"]
related: ["contribution-workflow", "conventional-commits", "review-frontend"]
sources: ["1. Contribution guide.md"]
---

# Preflight Checks

Preflight checks (`npm run preflight`) serve as the mandatory quality gate that must pass before any pull request can be submitted to Gemini CLI. This command runs all tests, linting, and formatting checks to ensure code consistency and quality standards are met.

## What Pre-flight Runs

The preflight command is a composite check that validates multiple quality dimensions. It runs the full test suite to verify functionality, executes linting to catch code style issues and potential bugs, and checks formatting to ensure consistent code style across the codebase. This comprehensive validation prevents issues from reaching reviewers and maintains high code quality standards.

## When to Run

Contributors should run `npm run preflight` locally before opening a pull request. This allows catching and fixing issues immediately rather than waiting for CI feedback, which saves time and reduces friction in the review process. Running it frequently during development (not just at the end) helps maintain a clean codebase and makes the final PR submission smooth.

## Relationship to CI

All PRs automatically run preflight checks through CI. Local preflight passing is necessary but not sufficient—CI may run additional checks or encounter environment-specific issues. Keeping local and CI environments reasonably synchronized helps avoid surprises.

## Related Concepts

- [[contribution-workflow]] — General contribution process
- [[conventional-commits]] — Commit standards validated by linting
- [[review-frontend]] — Additional automated review tool for PR quality
- [[development-environment]] — Setting up local environment for preflight