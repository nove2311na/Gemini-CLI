---
---
type: concept
title: "JSONL streaming"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "streaming"
  - "output-format"
  - "automation"
  - "events"
related:
  - "[[headless-mode]]"
  - "[[json-output]]"
  - "[[exit-codes]]"
  - "[[background-processes]]"
sources: ["III. 5. Headless mode reference.md"]
---

# JSONL streaming

JSONL streaming (newline-delimited JSON streaming) is an event-based output format for Gemini CLI headless mode. It streams individual JSON events as they occur, enabling real-time monitoring and progress tracking for long-running operations.

## Overview

Each line in the output is a complete JSON object representing a single event. Events are emitted as the session progresses, covering the full lifecycle from initialization to final result.

## Event Types

### init

Session metadata emitted at the start of the session.

```json
{"type": "init", "session_id": "abc123", "model": "gemini-2.5-pro"}
```

### message

User and assistant message chunks streamed during conversation.

```json
{"type": "message", "role": "assistant", "content": "Thinking..."}
```

### tool_use

Tool call requests with their arguments.

```json
{"type": "tool_use", "tool": "shell", "args": {"command": "ls -la"}}
```

### tool_result

Output from executed tools.

```json
{"type": "tool_result", "tool": "shell", "output": "total 42\ndrwxr-xr-x  3 user staff  128 Jan 15 09:30 ."}
```

### error

Non-fatal warnings and system errors encountered during execution.

```json
{"type": "error", "code": "RATE_LIMIT", "message": "Rate limit approaching"}
```

### result

Final outcome with aggregated statistics and per-model token usage breakdowns.

```json
{"type": "result", "success": true, "tokens": 1420, "latency_ms": 2340, "cost_usd": 0.021}
```

## Usage

Streaming JSONL is selected via the `--output-format` flag:

```bash
gemini -p "Complex task" --output-format stream
```

## Use Cases

- **Long-running operations** — Monitor progress in real-time
- **Real-time dashboards** — Pipe output to monitoring tools
- **Debugging** — Track exactly what happens at each stage
- **Interactive UIs** — Build custom interfaces on top of CLI

## Comparison with JSON Output

| Aspect | JSONL Streaming | JSON Output |
|--------|-----------------|-------------|
| Output timing | Incremental (as events occur) | Synchronous (waits for complete response) |
| Event-based | Yes | No |
| Progress visibility | High | None until complete |
| Processing model | Stream consumer | Single object parser |

## Related Concepts

- [[background-processes]] — Streaming works well with detached background operations
- [[exit-codes]] — Exit codes provide final status; error events provide detailed diagnostics

## See Also

- [[headless-mode]] — Parent feature documentation
- [[json-output]] — Alternative synchronous output format