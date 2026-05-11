---
type: concept
title: "JSON output"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "output-format"
  - "structured-data"
  - "automation"
related:
  - "[[headless-mode]]"
  - "[[jsonl-streaming]]"
  - "[[exit-codes]]"
sources: ["III. 5. Headless mode reference.md"]
---

# JSON output

JSON output is one of two output formats supported by Gemini CLI in headless mode. It returns a single synchronous JSON object containing the complete response and usage statistics.

## Overview

Unlike [[jsonl-streaming]] which streams events incrementally, JSON output waits for the complete response before returning a single structured object. This makes it suitable for simple scripts and one-shot queries where the full result is needed before proceeding.

## Schema

```json
{
  "response": "string",
  "stats": {
    "tokens": "number",
    "latency_ms": "number"
  },
  "error": {
    "code": "string",
    "message": "string"
  }
}
```

### Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `response` | string | Yes | The model's final answer text |
| `stats` | object | Yes | Token usage and API latency metrics |
| `error` | object | No | Error details if the request failed |

## Usage

JSON output is selected via the `--output-format` flag:

```bash
gemini -p "Your prompt here" --output-format json
```

## Comparison with Streaming

| Aspect | JSON Output | JSONL Streaming |
|--------|-------------|-----------------|
| Timing | Synchronous (blocks until complete) | Asynchronous (streams incrementally) |
| Output | Single object | Multiple event objects |
| Use Case | Simple scripts | Long-running operations, real-time monitoring |
| Error Handling | All errors in single `error` field | Errors stream as they occur |

## See Also

- [[headless-mode]] — The parent feature this output format belongs to
- [[jsonl-streaming]] — Alternative streaming output format
- [[exit-codes]] — CLI exit codes that complement JSON error responses