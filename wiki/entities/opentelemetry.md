---
type: entity
title: "OpenTelemetry"
created: 2026-05-05
updated: 2026-05-05
tags: ["observability", "tracing", "telemetry", "standard"]
related: ["tracing", "telemetry-server", "gemini-cli"]
sources: ["4. Local development.md"]
---

# OpenTelemetry

OpenTelemetry (OTel) is an industry-standard observability framework that provides vendor-neutral instrumentation for collecting telemetry data including traces, metrics, and logs. It serves as the underlying tracing infrastructure for Gemini CLI's debugging capabilities.

## Overview

OpenTelemetry has emerged as the dominant standard for application observability, adopted by major cloud providers and observability platforms. Its vendor-neutral design means that telemetry data collected with OTel can be sent to any compatible backend, from open-source tools like Jaeger to cloud services like Google Cloud Trace.

## Role in Gemini CLI

Gemini CLI uses OpenTelemetry to record traces that capture the execution flow of agent operations. This includes:

- **Model calls** — Requests sent to the AI model and responses received
- **Tool scheduler operations** — Decision-making about which tools to invoke
- **Tool calls** — Execution of specific tools and their results

The use of OTel enables Gemini CLI to integrate with multiple trace viewing platforms while maintaining a consistent instrumentation approach.

## See Also

- [[tracing]] — The concept of recording execution flow for debugging
- [[telemetry-server]] — The local server infrastructure for collecting traces
- [[jaeger]] — An open-source tracing backend compatible with OpenTelemetry
- [[genkit]] — Google's development framework that provides trace visualization