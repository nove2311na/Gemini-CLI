---
---
type: entity
title: "Jaeger"
created: 2026-05-05
updated: 2026-05-05
tags: ["tracing", "debugging", "observability", "open-source"]
related: ["tracing", "telemetry-server", "opentelemetry", "gemini-cli"]
sources: ["4. Local development.md"]
---

# Jaeger

Jaeger is an open-source tracing system that provides detailed debugging capabilities for distributed systems and applications instrumented with OpenTelemetry. It serves as one of the local trace viewing options for Gemini CLI developers.

## Overview

Jaeger offers advanced query capabilities and visualization for understanding complex request flows across multiple services. Unlike simpler trace viewers, Jaeger provides:

- Distributed transaction tracking across service boundaries
- Performance latency analysis with detailed timing breakdowns
- Root cause analysis through span-level error tracking
- Service dependency visualization

## Using Jaeger with Gemini CLI

Developers can view Gemini CLI traces in Jaeger by starting the local telemetry collector:

```bash
npm run telemetry -- --target=local
```

This command launches the collector and provides a link to the Jaeger UI, typically accessible at `http://localhost:16686`.

## When to Use Jaeger vs Genkit

| Aspect | Genkit | Jaeger |
|--------|--------|--------|
| Setup complexity | Simpler | More involved |
| Interface | Developer-friendly | More technical |
| Query capabilities | Basic | Advanced |
| Best for | Quick debugging | Deep investigation |

## See Also

- [[tracing]] — The concept of recording execution traces
- [[telemetry-server]] — The telemetry collector infrastructure
- [[opentelemetry]] — The tracing standard that both tools support