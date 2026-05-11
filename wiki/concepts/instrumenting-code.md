---
type: concept
title: "Instrumenting Code"
created: 2026-05-05
updated: 2026-05-05
tags: ["instrumentation", "tracing", "debugging", "typescript"]
related: ["tracing", "runindevecespan", "gemini-cli", "opentelemetry"]
sources: ["4. Local development.md"]
---

# Instrumenting Code

Instrumenting code refers to the practice of adding trace spans to custom code to capture operational data for debugging and analysis. Gemini CLI provides the `runInDevTraceSpan` API for developers to extend tracing to their own functionality.

## Overview

While Gemini CLI automatically instruments core operations, developers may want to trace their own code paths to understand domain-specific behavior, capture custom metrics, or debug complex workflows. The instrumentation API provides this capability through a simple callback-based interface.

## Using runInDevTraceSpan

The `runInDevTraceSpan` function wraps asynchronous operations with trace capture:

```typescript
import { runInDevTraceSpan } from '@google/gemini-cli-core';
import { GeminiCliOperation } from '@google/gemini-cli-core/lib/telemetry/constants.js';

await runInDevTraceSpan(
  {
    operation: GeminiCliOperation.ToolCall,
    attributes: {
      'gen_ai.agent.name': 'gemini-cli',
    },
  },
  async ({ metadata }) => {
    // Set input data
    metadata.input = { key: 'value' };

    try {
      // Execute operation
      const output = await somethingRisky();
      metadata.output = output;
      return output;
    } catch (e) {
      // Capture error
      metadata.error = e;
      throw e;
    }
  }
);
```

## Key Patterns

### Input Capture
Set `metadata.input` before the operation to record what data is being processed.

### Output Capture
Set `metadata.output` after successful completion to record the result.

### Error Tracking
Catch exceptions and set `metadata.error` before rethrowing to ensure errors appear in traces.

## Use Cases

- Debugging custom tool implementations
- Tracking domain-specific workflow decisions
- Capturing business logic execution flow
- Performance analysis of specific operations

## See Also

- [[tracing]] — The broader tracing concept
- [[runindevecespan]] — The specific API for instrumentation
- [[opentelemetry]] — The underlying tracing standard