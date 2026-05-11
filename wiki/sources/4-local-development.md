---
type: source
title: "Local Development Guide"
created: 2026-05-05
updated: 2026-05-05
tags: ["local-development", "debugging", "tracing", "telemetry"]
related: ["tracing", "telemetry-server", "opentelemetry", "gemini-cli"]
sources: ["4. Local development.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/local-development"
venue: ""
---

# Local Development Guide

This source provides comprehensive documentation for local development features in Gemini CLI, with a primary focus on tracing and telemetry capabilities for debugging agent behavior.

## Tracing Overview

Gemini CLI uses [[opentelemetry]] (OTel) to record traces that help developers debug agent behavior. Traces instrument key events including model calls, tool scheduler operations, and tool calls. This observability capability is essential for understanding how the AI agent processes requests, makes decisions, and executes tools.

### View Traces

The source documents three trace viewing options for different debugging needs:

- **Genkit Developer UI** — Quick local debugging with a user-friendly interface. Start via `npm run telemetry -- --target=genkit` and access at `http://localhost:4000`.
- **Jaeger** — More detailed local debugging with advanced query capabilities. Start via `npm run telemetry -- --target=local` and access at `http://localhost:16686`.
- **Google Cloud** — Production-grade trace viewing and export. Requires configuration in `.gemini/settings.json` with telemetry settings.

### Instrument Code with Traces

The source provides a TypeScript API using `runInDevTraceSpan` from `@google/gemini-cli-core` for adding custom traces to user code. This enables developers to instrument their own functionality with input capture, output logging, and error tracking.

```typescript
import { runInDevTraceSpan } from '@google/gemini-cli-core';
import { GeminiCliOperation } from '@google/gemini-cli-core/lib/telemetry/constants.js';

await runInDevTraceSpan(
  { operation: GeminiCliOperation.ToolCall, attributes: {...} },
  async ({ metadata }) => { /* your code */ }
);
```

## Key Takeaways

- Tracing provides debugging visibility into model calls, tool scheduling, and tool execution
- Multiple viewing options support different debugging workflows from quick local checks to production analysis
- Custom instrumentation via `runInDevTraceSpan` extends tracing to user code paths