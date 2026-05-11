---
type: entity
title: "GeminiCliOperation"
created: 2026-05-05
updated: 2026-05-05
tags: ["constants", "tracing", "api", "typescript"]
related: ["runindevecespan", "tracing", "gemini-cli"]
sources: ["4. Local development.md"]
---

# GeminiCliOperation

`GeminiCliOperation` is a constants enum from `@google/gemini-cli-core/lib/telemetry/constants.js` that defines predefined operation types for trace spans in Gemini CLI. These constants provide standardized identifiers for categorizing different types of agent operations.

## Available Operations

Common operation types include:

- **GeminiCliOperation.ToolCall** — Indicates a tool invocation
- **GeminiCliOperation.ModelCall** — Indicates a model API request
- **GeminiCliOperation.ToolScheduler** — Indicates tool selection and scheduling logic

## Usage

These constants are used with the `runInDevTraceSpan` function to categorize spans:

```typescript
import { runInDevTraceSpan } from '@google/gemini-cli-core';
import { GeminiCliOperation } from '@google/gemini-cli-core/lib/telemetry/constants.js';

await runInDevTraceSpan(
  { operation: GeminiCliOperation.ToolCall, attributes: {...} },
  async ({ metadata }) => { /* code */ }
);
```

## See Also

- [[runindevecespan]] — The function that consumes these operation constants
- [[tracing]] — The broader tracing concept