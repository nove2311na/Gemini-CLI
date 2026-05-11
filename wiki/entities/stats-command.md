---
type: entity
title: "/stats Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "command"
  - "stats"
  - "monitoring"
  - "token-usage"
related:
  - "[[token-caching]]"
  - "[[session]]"
sources: ["III. 21. Token caching and cost optimization.md"]
---

# /stats Command

The `/stats` command is a built-in Gemini CLI command that displays token usage metrics and cached token savings. It provides visibility into cost optimization from [[token-caching]].

## Usage

```
/stats
```

## Output

When cached tokens are available, they will be displayed in the stats output, showing:

- Total tokens processed
- Tokens saved through caching
- Percentage reduction from cached content

## Purpose

The command helps users:

- Understand how [[token-caching]] reduces their API costs
- Monitor token consumption across their session
- Verify that caching is functioning as expected

## Relationship to Token Caching

[[token-caching]] is an automatic feature that operates without user visibility. The `/stats` command provides the only user-facing feedback mechanism, allowing you to quantify the benefits of caching in your workflow.

## Relationship to Sessions

Since [[token-caching]] builds on session context, the stats reflect usage patterns within the current [[session]]. Stats reset or reflect new context when starting a new session.

## See Also

- [[token-caching]] — The cost optimization feature that stats displays
- [[session]] — The context layer that enables caching