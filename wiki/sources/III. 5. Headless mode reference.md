---
type: source
title: "Headless mode reference"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "reference"
  - "automation"
  - "CLI"
related:
  - "[[headless-mode]]"
  - "[[json-output]]"
  - "[[jsonl-streaming]]"
  - "[[exit-codes]]"
sources: ["III. 5. Headless mode reference.md"]
---

# Headless mode reference

**Source:** [Official documentation](https://geminicli.com/docs/cli/headless/)

Headless mode provides a programmatic interface to Gemini CLI, returning structured text or JSON output without an interactive terminal UI. This enables automation, scripting, and CI/CD pipeline integration.

## Key Concepts

- [[headless-mode]] — Programmatic interface returning structured output without interactive TTY
- [[json-output]] — Synchronous single-JSON response with response, stats, and optional error
- [[jsonl-streaming]] — Event-based streaming with 6 event types for real-time output
- [[exit-codes]] — Standardized CLI codes (0, 1, 42, 53) for automation error handling

## Trigger Conditions

Headless mode activates when:
- CLI runs in a non-TTY (automated) environment
- Query provided via `-p`/`--prompt` flag

## Next Steps

- Follow the [[Automation tutorial]] for practical scripting examples
- See the [[CLI reference]] for all available flags

## Metadata

- **Published:** 2026-03-11
- **Documentation URL:** https://geminicli.com/docs/cli/headless/