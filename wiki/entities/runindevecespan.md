---
type: entity
title: "runInDevTraceSpan"
created: 2026-05-05
updated: 2026-05-05
tags: ["api", "tracing", "instrumentation", "typescript"]
related: ["tracing", "instrumenting-code", "gemini-cli"]
sources: ["4. Local development.md"]
---

# runInDevTraceSpan

`runInDevTraceSpan` is a TypeScript function from `@google/gemini-cli-core` that enables developers to instrument their own code with custom traces. It wraps asynchronous operations to capture input, output, and error information within the tracing system.

## Function Signature

```typescript
import { runInDevTraceSpan } from '@google/gemini-cli-core';
import { GeminiCliOperation } from '@google/gemini-cli-core/lib/telemetry/constants.js';

await runInDevTraceSpan(
  { operation: operationType, attributes: { ... } },
  async ({ metadata }) => { /* your code */ }
);
```

## Parameters

### Span Configuration
- **operation** — A `GeminiCliOperation` enum value identifying the type of operation being traced
- **attributes** — Key-value metadata attached to the span (e.g., agent name, tool identifier)

### Callback Context
- **metadata** — An object that can be augmented with `input`, `output`, and `error` properties during execution

## Usage Pattern

The function follows a try/catch pattern for error tracking:

1. Set `metadata.input` before the operation
2. Execute the operation
3. Set `metadata.output` with the result
4. Catch errors and set `metadata.error` before rethrowing

## See Also

- [[tracing]] — The broader concept of trace recording
- [[instrumenting-code]] — Patterns for adding custom instrumentation
- [[gemini-cli]] — The CLI where this API is available