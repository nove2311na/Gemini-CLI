---
type: concept
title: "Conventional Commits"
created: 2026-05-05
updated: 2026-05-05
tags: ["commits", "contribution", "standards", "code-style"]
related: ["contribution-workflow", "atomic-pull-requests"]
sources: ["1. Contribution guide.md"]
---

# Conventional Commits

Conventional Commits is a standardized format for commit messages required by the Gemini CLI project. This specification provides an easy set of rules for creating consistent commit history, making it easier to write automated tools on top of.

## Format Structure

The conventional commit format follows this pattern: `<type>(<scope>): <description>`

**Type values** include `feat` for new features, `fix` for bug fixes, `docs` for documentation changes, `style` for formatting (no code logic changes), `refactor` for code refactoring, `test` for adding tests, and `chore` for maintenance tasks.

**Scope** is optional but typically indicates the affected package or component, such as `cli`, `ui`, `api`, `sandbox`, or `docs`.

**Description** must be concise, written in imperative mood, and without a trailing period.

## Examples

| Type | Format | Example |
|------|--------|---------| 
| Feature | `feat(cli): Add --json flag to 'config get' command` | |
| Bug fix | `fix(ui): Correct scroll position on mobile` | |
| Documentation | `docs(readme): Update installation instructions` | |
| Refactor | `refactor(sandbox): Simplify process isolation logic` | |

## Good vs Bad Titles

**Good:** Descriptive and specific about what changed, follows the format, uses imperative mood. Examples: `feat(cli): Add --json flag to 'config get' command`, `fix(api): Handle empty response from model`

**Bad:** Vague, doesn't follow format, uses past tense. Examples: `Made some changes`, `Fixed stuff`, `Updated file`

## PR Titles vs Commit Messages

Both PR titles and commit messages should follow the Conventional Commits standard. The PR title becomes the squash-merged commit message, so clarity at the PR level directly impacts the project's git history quality.

## Related Concepts

- [[contribution-workflow]] — General contribution process
- [[atomic-pull-requests]] — Small, focused PR philosophy
- [[preflight-checks]] — Quality gate that validates commit format