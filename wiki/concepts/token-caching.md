---
type: concept
title: "Token Caching"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "token-caching"
  - "cost-optimization"
  - "api"
  - "billing"
related:
  - "[[stats-command]]"
  - "[[session]]"
  - "[[model-selection]]"
sources: ["III. 21. Token caching and cost optimization.md"]
---

# Token Caching

Token caching is an automatic cost optimization mechanism in Gemini CLI that reuses previous system instructions and context across API requests. This reduces the total number of tokens processed, lowering API costs for users.

## How It Works

When you use Gemini CLI with supported authentication, the system automatically caches system instructions and conversation context from previous requests. Subsequent requests that can reuse this cached content will do so automatically, reducing token consumption without any user intervention.

The caching is:

- **Automatic** — No configuration or toggle required
- **Transparent** — Operates silently during API calls
- **Session-aware** — Builds on [[session]] context to maximize reusability

## Supported Authentication Methods

| Method | Caching Available | Notes |
|--------|-------------------|-------|
| Gemini API Key | Yes | Primary authentication method |
| Vertex AI | Yes | Requires project and location setup |
| OAuth (Google Personal) | No | Code Assist API limitation |
| OAuth (Google Enterprise) | No | Code Assist API limitation |

## Viewing Cached Savings

Use the [[stats-command]] (`/stats`) command to view your token usage and cached token savings. The output displays cached tokens when they are available for reuse.

## Relationship to Sessions

Token caching builds on [[session]] infrastructure. The conversation context that persists across turns provides the foundation for what gets cached and reused. This means effective session management indirectly supports better caching performance.

## Relationship to Model Selection

While [[model-selection]] operates at a different layer, understanding token caching complements it for cost-aware usage. Different models have different token pricing, and caching reduces the volume of tokens processed regardless of model choice.

## Limitations

- **OAuth exclusion**: The Code Assist API does not support cached content creation, making token caching unavailable for OAuth-based authentication
- **No user control**: Caching cannot be toggled on or off — it is automatic when available
- **Scope unclear**: The persistence boundary of cached content (session-scoped vs. longer) is not specified in current documentation

## See Also

- [[stats-command]] — Monitor caching effectiveness
- [[session]] — Context infrastructure for caching
- [[model-selection]] — Cost considerations beyond caching