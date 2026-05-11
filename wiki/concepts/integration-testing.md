---
type: concept
title: "Integration testing"
created: 2026-05-05
updated: 2026-05-05
tags: ["testing", "development", "quality-assurance"]
related: ["shell-commands", "session-management"]
sources: ["2. Integration testing.md"]
---

# Integration testing

Integration testing validates the complete end-to-end functionality of [[gemini-cli]], ensuring that individual components work together correctly in real-world scenarios.

## Execution

Unlike unit tests run via `npm run test`, integration tests must be executed explicitly:

```bash
npm run test:e2e
```

## Requirements

### For Forked Repositories

When working with forks, a `GEMINI_API_KEY` must be configured as a GitHub Repository Secret. This allows the integration tests to authenticate with the Gemini API and validate the full CLI functionality.

## Relationship to Other Concepts

Integration tests complement [[shell-commands]] by validating that shell command execution works correctly end-to-end. They also support [[session-management]] by testing workflow scenarios that span multiple conversation sessions.

## Open Questions

- What specific functionality do the e2e tests cover?
- Are there local alternatives for running integration tests without GitHub secrets?
- Is there documentation available for writing new integration tests?
- What CI/CD system runs these tests in the main repository?