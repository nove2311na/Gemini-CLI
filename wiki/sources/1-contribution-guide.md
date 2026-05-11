---
type: source
title: "How to contribute"
created: 2026-05-05
updated: 2026-05-05
tags: ["contribution", "workflow", "development", "open-source"]
related: ["gemini-cli", "contribution-workflow", "development-environment", "sandboxing"]
sources: ["1. Contribution guide.md"]
authors: []
year: 2025
url: "https://geminicli.com/docs/contributing"
venue: "geminicli.com"
---

# How to contribute

This official guide from Google documents the complete contribution workflow for Gemini CLI. It covers essential prerequisites including the Contributor License Agreement (CLA) requirement, the code contribution process with self-assignment system, development environment setup including Node.js version requirements and sandboxing configuration, and documentation contribution guidelines.

## Key Topics

The guide establishes several critical processes for contributors. The self-assignment system using `/assign` and `/unassign` commands enables community members to claim issues marked with the `help-wanted` label, with a maximum of 3 issues per contributor. The atomic PR philosophy emphasizes small, focused pull requests that address single issues rather than bundling multiple unrelated changes. The Conventional Commits standard (`feat(cli):...`, `fix(ui):...`) is required for all commit messages. The automated review tool (`/review-frontend` or `scripts/review.sh`) helps catch common anti-patterns and testing issues before maintainer review.

## Development Environment

The guide specifies Node.js `~20.19.0` for development (due to an upstream dependency issue) while production only requires `>=20`. Sandboxing is highly recommended via `GEMINI_SANDBOX=true` in `~/.env`. The full build includes both CLI and sandbox container via `npm run build:all`. The preflight check (`npm run preflight`) serves as the quality gate before any PR submission.

## Documentation Structure

Documentation lives in `/docs` with organization controlled by `sidebar.json`. New documentation entries must be added to both the appropriate directory and the sidebar configuration.

## Related Pages

- [[contribution-workflow]] — Detailed process for contributing code
- [[development-environment]] — Complete development setup guide
- [[conventional-commits]] — Commit message standard
- [[atomic-pull-requests]] — Small, focused PR philosophy
- [[self-assignment]] — Issue assignment system
- [[contributor-license-agreement]] — CLA requirement details
- [[review-frontend]] — Automated PR review tool
- [[sandboxing]] — Security isolation (cross-reference from development setup)