---
type: concept
title: "Telemetry"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "telemetry"
  - "observability"
  - "opentelemetry"
  - "gemini-cli"
related:
  - "[[telemetry-logs]]"
  - "[[telemetry-metrics]]"
  - "[[telemetry-traces]]"
  - "[[google-cloud-telemetry]]"
  - "[[local-telemetry]]"
  - "[[client-identification]]"
  - "[[session]]"
  - "[[open-telemetry]]"
sources: ["III. 20. Observability with OpenTelemetry.md"]
---

# Telemetry

Telemetry in Gemini CLI provides built-in [[OpenTelemetry]] support that transforms every agent interaction into a rich stream of logs, metrics, and traces. This observability capability is the key to turning experimental AI into reliable, predictable software systems.

## Three Pillars of Observability

The telemetry system follows the industry-standard three-pillar approach to observability:

1. **[[telemetry-logs]]** — Timestamped records of specific events (tool calls, API requests, configuration changes)
2. **[[telemetry-metrics]]** — Numerical measurements of behavior over time (latency, token counts, success rates)
3. **[[telemetry-traces]]** — "Under-the-hood" view of agent and backend operations with span hierarchies

## Common Attributes

Every telemetry data point includes these common attributes:

- `session.id` — Links data to a specific [[session]]
- `installation.id` — Unique installation identifier
- `active_approval_mode` — Current approval mode state
- `user.email` — Authenticated user email (when available)

## Configuration

Telemetry is configured via `.gemini/settings.json` with support for environment variable overrides. Key settings:

| Setting | Description | Default |
|---------|-------------|---------|
| `enabled` | Master toggle for telemetry | `false` |
| `target` | Export destination (`gcp` or `local`) | `local` |
| `traces` | Enable detailed tracing | `false` |
| `logPrompts` | Include prompts in logs | `true` |

### Privacy Considerations

By default, prompts are included in telemetry logs. For privacy-conscious configurations, disable prompt logging:

```json
{
  "telemetry": {
    "enabled": true,
    "logPrompts": false
  }
}
```

## Export Targets

### Google Cloud

Export directly to [[Google Cloud Trace]], [[Google Cloud Monitoring]], and [[Google Cloud Logging]]. Requires proper IAM roles and API enablement. A pre-configured **Gemini CLI Monitoring** dashboard is available.

See: [[google-cloud-telemetry]]

### Local Debugging

File-based output for development workflows without cloud dependencies. See: [[local-telemetry]]

### Custom OTLP

Use external OpenTelemetry Protocol (OTLP) collectors for advanced setups with tools like [[Jaeger]] or [[Prometheus]].

## Client Identification

Traffic can be differentiated across environments via User-Agent headers. See: [[client-identification]]

## Related Concepts

- [[genai-semantic-conventions]] — Standard OTel naming conventions for AI operations
- [[conseca]] — Security verdict logging
- [[checkpointing]] — Technical foundation for telemetry timestamps