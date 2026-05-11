---
type: concept
title: "Tracing"
created: 2026-05-05
updated: 2026-05-05
tags: ["debugging", "observability", "tracing", "opentelemetry"]
related: ["opentelemetry", "telemetry-server", "instrumenting-code", "gemini-cli"]
sources: ["4. Local development.md"]
---

# Tracing

Tracing is the practice of recording telemetry data about program execution to enable debugging and performance analysis of agent behavior. In Gemini CLI, tracing captures key events including model calls, tool scheduler operations, and tool executions.

## Overview

Tracing provides visibility into how an AI agent processes requests by recording the sequence and timing of operations. Unlike simple logging, traces maintain causal relationships between operations through parent-child span hierarchies, enabling developers to understand not just what happened, but why and in what order.

## What Gemini CLI Traces

Gemini CLI automatically instruments critical operations:

- **Model calls** — Requests to the AI model and their responses
- **Tool scheduler operations** — The decision logic for selecting which tools to invoke
- **Tool calls** — Execution of specific tools and their outcomes

## Trace Viewing Options

| Target | Use Case | URL |
|--------|----------|-----|
| Genkit Developer UI | Quick local debugging | `http://localhost:4000` |
| Jaeger | Detailed local analysis | `http://localhost:16686` |
| Google Cloud | Production tracing | Cloud Console |

## Starting Trace Collection

```bash
# Local with Genkit UI
npm run telemetry -- --target=genkit

# Local with Jaeger
npm run telemetry -- --target=local

# Google Cloud
npm run telemetry -- --target=gcp
```

## Custom Instrumentation

Beyond automatic tracing, developers can add custom traces using `runInDevTraceSpan` to instrument their own code paths and capture domain-specific operational data.

## See Also

- [[opentelemetry]] — The industry-standard framework powering Gemini CLI traces
- [[telemetry-server]] — The infrastructure for collecting and serving traces
- [[instrumenting-code]] — Adding custom traces to your code
- [[jaeger]] — An alternative trace viewer
- [[genkit]] — Google's trace visualization tool