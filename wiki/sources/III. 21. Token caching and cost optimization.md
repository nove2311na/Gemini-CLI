---
type: source
title: "Token caching and cost optimization"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "clippings"
  - "token-caching"
  - "cost-optimization"
  - "api-key"
  - "vertex-ai"
related:
  - "[[token-caching]]"
  - "[[stats-command]]"
  - "[[session]]"
sources: ["III. 21. Token caching and cost optimization.md"]
---

# Token Caching and Cost Optimization

## Overview

Gemini CLI automatically optimizes API costs through token caching when using API key authentication. This feature reuses previous system instructions and context to reduce the number of tokens processed in subsequent requests.

## Availability

Token caching is available for:

- **API key users** — Gemini API key authentication
- **Vertex AI users** — With project and location setup

Token caching is **not available** for:

- **OAuth users** — Google Personal/Enterprise accounts. The Code Assist API does not support cached content creation at this time.

## Viewing Usage

You can view your token usage and cached token savings using the [[stats-command]] command. When cached tokens are available, they will be displayed in the stats output.

## Key Takeaways

- Token caching is **automatic** — no user configuration required
- The feature operates transparently during API requests
- Cost savings appear in the `/stats` output
- Authentication method determines eligibility

## Related Documentation

- [[token-caching]] — Detailed concept page on how token caching works
- [[stats-command]] — Command reference for viewing token usage statistics
- [[session]] — Session context that benefits from token caching
- [[III. 11. Gemini CLI model selection (`model` command)]] — Model selection with cost considerations