---
type: source
title: "Observability with OpenTelemetry"
author: []
year: 2026
url: "https://geminicli.com/docs/cli/telemetry/"
venue: "geminicli.com"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "telemetry"
  - "observability"
  - "opentelemetry"
  - "google-cloud"
  - "gemini-cli"
related:
  - "[[telemetry]]"
  - "[[telemetry-logs]]"
  - "[[telemetry-metrics]]"
  - "[[telemetry-traces]]"
  - "[[google-cloud-telemetry]]"
  - "[[local-telemetry]]"
  - "[[client-identification]]"
sources: ["III. 20. Observability with OpenTelemetry.md"]
---

# Observability with OpenTelemetry

Observability is the key to turning experimental AI into reliable software. Gemini CLI provides built-in support for [[OpenTelemetry]], transforming every agent interaction into a rich stream of logs, metrics, and traces. This three-pillar approach gives you the high-fidelity visibility needed to understand agent behavior, optimize performance, and ensure reliability across your entire workflow.

## OpenTelemetry Integration

Gemini CLI integrates with [[OpenTelemetry]], a vendor-neutral, industry-standard observability framework that provides:

- **Universal compatibility**: Export to any OpenTelemetry backend (Google Cloud, [[Jaeger]], [[Prometheus]], [[Datadog]], etc.)
- **Standardized data**: Use consistent formats and collection methods across your toolchain
- **Future-proof integration**: Connect with existing and future observability infrastructure
- **No vendor lock-in**: Switch between backends without changing instrumentation

## Configuration

Telemetry behavior is controlled through the `.gemini/settings.json` file with environment variable overrides. Key settings include:

| Setting | Environment Variable | Description | Default |
|---------|---------------------|-------------|---------|
| `enabled` | `GEMINI_TELEMETRY_ENABLED` | Enable or disable telemetry | `false` |
| `traces` | `GEMINI_TELEMETRY_TRACES_ENABLED` | Enable detailed attribute tracing | `false` |
| `target` | `GEMINI_TELEMETRY_TARGET` | Export target: `"gcp"` or `"local"` | `"local"` |
| `otlpEndpoint` | `GEMINI_TELEMETRY_OTLP_ENDPOINT` | OTLP collector endpoint | `http://localhost:4317` |
| `otlpProtocol` | `GEMINI_TELEMETRY_OTLP_PROTOCOL` | Protocol: `"grpc"` or `"http"` | `"grpc"` |
| `outfile` | `GEMINI_TELEMETRY_OUTFILE` | File path for local output | — |
| `logPrompts` | `GEMINI_TELEMETRY_LOG_PROMPTS` | Include prompts in logs | `true` |
| `useCollector` | `GEMINI_TELEMETRY_USE_COLLECTOR` | Use external OTLP collector | `false` |
| `useCliAuth` | `GEMINI_TELEMETRY_USE_CLI_AUTH` | Use CLI credentials for GCP | `false` |

> **Privacy note**: By default, prompts are included in telemetry logs. Set `telemetry.logPrompts: false` for a privacy-conscientious configuration.

## Google Cloud Export

Telemetry can be exported directly to [[Google Cloud Trace]], [[Google Cloud Monitoring]], and [[Google Cloud Logging]]. Prerequisites include:

- Setting the project ID via `OTLP_GOOGLE_CLOUD_PROJECT` or `GOOGLE_CLOUD_PROJECT`
- Authentication via Application Default Credentials (ADC) or CLI Auth
- Required IAM roles: Cloud Trace Agent, Monitoring Metric Writer, Logs Writer
- Enabled APIs: `cloudtrace.googleapis.com`, `monitoring.googleapis.com`, `logging.googleapis.com`

A pre-configured **Gemini CLI Monitoring** dashboard is available under Google Cloud Monitoring Dashboard Templates.

## Local Telemetry

For development and debugging, telemetry can be captured locally with file-based output:

```json
{
  "telemetry": {
    "enabled": true,
    "target": "local",
    "outfile": ".gemini/telemetry.log"
  }
}
```

## Client Identification

Gemini CLI includes identifiers in its `User-Agent` header for traffic differentiation:

| Environment | User-Agent Prefix | Surface Tag |
|-------------|-------------------|-------------|
| Gemini Code Assist (Agent Mode) | `GeminiCLI-a2a-server` | `vscode` |
| Zed (via ACP) | `GeminiCLI-acp-zed` | `zed` |
| Xcode (via ACP) | `GeminiCLI-acp-xcode` | `xcode` |
| IntelliJ IDEA (via ACP) | `GeminiCLI-acp-intellijidea` | `jetbrains` |
| Standard Terminal | `GeminiCLI` | `terminal` |

Custom identification is available via `GEMINI_CLI_SURFACE` environment variable.

## Three Pillars of Telemetry

See individual pages for detailed references:

- [[telemetry-logs]] — Log event catalog with ~60+ event types and attribute schemas
- [[telemetry-metrics]] — Metrics reference with measurement types and attributes
- [[telemetry-traces]] — Trace structure with GenAI semantic conventions

## Common Attributes

All telemetry data includes `session.id`, `installation.id`, `active_approval_mode`, and `user.email` (when authenticated) as common attributes.