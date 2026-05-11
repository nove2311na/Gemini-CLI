---
type: concept
title: "Headless mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "automation"
  - "CLI"
  - "programmatic"
related:
  - "[[json-output]]"
  - "[[jsonl-streaming]]"
  - "[[exit-codes]]"
  - "[[shell-commands]]"
  - "[[background-processes]]"
  - "[[session]]"
sources: ["1. Gemini CLI documentation.md", "10. Automate tasks with headless mode.md", "III. 5. Headless mode reference.md"]
---

# Headless mode

Headless mode provides a programmatic interface to Gemini CLI, returning structured output without an interactive terminal UI. It enables automation, scripting, and CI/CD pipeline integration.

## Overview

When running in headless mode, Gemini CLI operates without the interactive text-based interface, instead producing machine-readable output suitable for consumption by scripts, automation tools, and build systems.

## Trigger Conditions

Headless mode is activated automatically when:

1. **Non-TTY environment** — The CLI detects it is running in an automated context without a terminal attached
2. **Prompt flag provided** — Using `-p` or `--prompt` flag to pass a query directly on the command line

## Output Formats

Two output formats are supported, controlled via the `--output-format` flag:

### JSON Output

Returns a single synchronous JSON object containing:
- `response` — The model's final answer (string)
- `stats` — Token usage and API latency metrics (object)
- `error` — Error details if the request failed (object, optional)

See [[json-output]] for detailed documentation.

### Streaming JSONL Output

Returns a stream of newline-delimited JSON events covering the full session lifecycle:
- `init` — Session metadata
- `message` — User and assistant message chunks
- `tool_use` — Tool call requests
- `tool_result` — Tool execution output
- `error` — Non-fatal warnings
- `result` — Final outcome with aggregated statistics

See [[jsonl-streaming]] for detailed documentation.

## Use Cases

- **CI/CD pipelines** — Automated testing and deployment workflows
- **Scripted operations** — Batch processing with predefined prompts
- **Programmatic integration** — Embedding Gemini CLI capabilities into other applications
- **Long-running tasks** — Streaming output for monitoring progress

## Related Features

Headless mode complements [[shell-commands]] for automation — headless mode uses query-based interaction while shell commands use command-based execution. Both work well in [[background-processes]] contexts and relate to [[session]] management through the `init` event metadata.

## See Also

- [[exit-codes]] — Understanding CLI exit codes for error handling in scripts
- [[Automation tutorial]] — Practical examples for scripting with headless mode