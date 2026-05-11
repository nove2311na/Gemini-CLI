---
type: source
title: "Integration testing"
created: 2026-05-05
updated: 2026-05-05
tags: ["documentation", "testing", "clippings"]
related: []
sources: ["2. Integration testing.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/integration-testing"
venue: "geminicli.com"
---

# Integration testing

This source documents how integration tests are configured and executed for [[gemini-cli]].

## Key Points

- Integration tests validate end-to-end functionality and are **not included** in the default `npm run test` command
- Run tests explicitly with `npm run test:e2e`
- Forked repositories require a `GEMINI_API_KEY` GitHub Repository Secret to be configured

## Usage

```bash
npm run test:e2e
```

## Forks

When forking the repository, add a GitHub Repository Secret named `GEMINI_API_KEY` with a valid API key to enable the integration tests to run.

## Related Concepts

The integration testing system connects to [[shell-commands]] workflows commonly used in CI/CD pipelines, and complements [[session-management]] by validating end-to-end user flows across sessions.