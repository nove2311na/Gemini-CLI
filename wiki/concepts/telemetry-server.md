---
type: concept
title: "Telemetry Server"
created: 2026-05-05
updated: 2026-05-05
tags: ["telemetry", "tracing", "server", "debugging"]
related: ["tracing", "opentelemetry", "gemini-cli"]
sources: ["4. Local development.md"]
---

# Telemetry Server

The telemetry server is the infrastructure component that collects, processes, and serves trace data from Gemini CLI operations. It can target different backends depending on debugging needs.

## Overview

When debugging AI agent behavior locally, the telemetry server bridges the gap between Gemini CLI's trace emission and the visualization tools used to analyze them. The server handles OpenTelemetry protocol (OTLP) forwarding and can route data to various backends.

## Supported Targets

### Genkit
Quick local debugging with minimal setup. Ideal for most development scenarios.

```bash
npm run telemetry -- --target=genkit
```

### Local (Jaeger)
More detailed local debugging with advanced query capabilities. Suitable for complex trace analysis.

```bash
npm run telemetry -- --target=local
```

### Google Cloud
Production-grade trace collection with cloud storage and analysis. Requires Google Cloud configuration.

```bash
npm run telemetry -- --target=gcp
```

## Persistent Configuration

For permanent telemetry settings, configure `.gemini/settings.json`:

```json
{
  "telemetry": {
    "enabled": true,
    "target": "gcp",
    "useCollector": true
  }
}
```

## Architecture

The telemetry server uses OpenTelemetry's standard collection pipeline:

1. Gemini CLI emits spans via OTel SDK
2. Spans are collected by the telemetry server
3. Server forwards spans to the configured target
4. Visualization tool displays trace data

## See Also

- [[tracing]] — The concept of trace recording
- [[opentelemetry]] — The standard powering the collection pipeline
- [[gemini-cli]] — The CLI that emits trace data