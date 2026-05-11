---
type: entity
title: "Genkit"
created: 2026-05-05
updated: 2026-05-05
tags: ["ai-development", "framework", "tracing", "debugging"]
related: ["tracing", "telemetry-server", "gemini-cli", "opentelemetry"]
sources: ["4. Local development.md"]
---

# Genkit

Genkit is Google's AI development framework that provides built-in tracing and debugging capabilities for AI agent applications. The Genkit Developer UI serves as a primary trace visualization tool for Gemini CLI local development.

## Overview

Genkit provides a unified development environment for building AI-powered applications with features including:

- **Developer UI** — A web-based interface for visualizing and debugging AI agent traces
- **Builtin observability** — Automatic instrumentation of model calls and tool executions
- **Local debugging** — No cloud dependency required for development-time trace analysis

## Using Genkit Developer UI with Gemini CLI

The Genkit Developer UI provides the quickest path to local trace analysis:

1. Start the telemetry server: `npm run telemetry -- --target=genkit`
2. Run Gemini CLI: `gemini`
3. Open the provided URL (typically `http://localhost:4000`) and navigate to the Traces tab

## See Also

- [[tracing]] — The concept of recording execution traces
- [[telemetry-server]] — The infrastructure for collecting and serving traces
- [[opentelemetry]] — The underlying tracing standard
- [[jaeger]] — An alternative local trace viewer with more advanced query capabilities