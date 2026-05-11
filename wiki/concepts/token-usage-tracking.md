---
type: concept
title: "Token Usage Tracking"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "monitoring"
  - "usage"
  - "quota"
  - "cost-management"
related:
  - "[[gemini-cli]]"
  - "[[session]]"
sources: ["2. Get started with Gemini CLI.md"]
---

# Token Usage Tracking

Token usage tracking enables users to monitor their consumption of AI model tokens and understand their quota status. This helps manage costs and identify unusual usage patterns.

## Command: /stats model

The `/stats model` command provides a snapshot of token usage within the current [[session]], including:

- **Current session token count** — Tokens consumed during this session
- **Overall quota** — Total available tokens (based on account tier)
- **Usage statistics** — Consumption across supported models

## Purpose

Tracking token usage serves several practical needs:

1. **Cost awareness** — Understand resource consumption for billing purposes
2. **Quota management** — Avoid hitting limits during critical work
3. **Usage optimization** — Identify opportunities to reduce token consumption
4. **Troubleshooting** — Diagnose unexpected costs or rate limiting

## Session Context

Token usage is tracked per session, meaning users can monitor usage across the entire conversation history. This contextual tracking helps correlate specific tasks with their resource costs.

## Quota Considerations

Different account types may have different quota limits:
- Standard Google accounts have defined monthly quotas
- [[google-cloud-project]] configurations may have custom quota arrangements
- Enterprise accounts may have negotiated rate limits

## Best Practices

1. **Check `/stats model` periodically** — Monitor usage during extended sessions
2. **Review usage before major tasks** — Estimate costs for large operations
3. **Understand quota limits** — Know your account tier's limitations
4. **Consider session length** — Longer sessions consume more tokens

## Open Questions

The official documentation does not specify:
- Whether `/stats` shows live or delayed usage data
- How historical usage can be queried
- Whether individual request costs are itemized
- How billing vs. quota limits are distinguished in the output