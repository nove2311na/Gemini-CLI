---
type: entity
title: ".gemini/.env"
created: 2026-05-05
updated: 2026-05-05
tags: ["configuration-file", "environment-variables", "project-level", "persistence"]
related: ["gemini-system-md", "system-md-file", "session-management", "extensions"]
sources: ["7. System prompt override.md"]
---

# .gemini/.env

A dotfile in the `.gemini/` directory that stores persistent environment variable configurations for Gemini CLI on a per-project basis.

## Overview

The `.gemini/.env` file follows the standard dotenv format, allowing developers to persist environment variables like `GEMINI_SYSTEM_MD` across sessions without manually setting them in each shell session.

## Common Usage

To persist the system prompt override for a project:

1. Create `.gemini/system.md` with custom instructions
2. Add to `.gemini/.env`:
   ```
   GEMINI_SYSTEM_MD=1
   ```

## File Format

The `.env` file uses standard key-value syntax:

```
KEY=value
KEY2=value2
```

## Use Cases

- **System prompt override**: `GEMINI_SYSTEM_MD=1` or `GEMINI_SYSTEM_MD=/path/to/custom.md`
- **Model selection**: Per-project default model preferences
- **API configuration**: Project-specific API keys or endpoint overrides
- **Feature flags**: Enabling experimental features per project

## Benefits

- **Project-scoped**: Each project can have its own configuration
- **Version controlled**: Commit `.gemini/.env.example` (without secrets) to share project defaults
- **Git-ignored**: Sensitive values should remain uncommitted
- **Session-aware**: Settings persist across CLI restarts within the project

## See Also

- [[gemini-system-md]] — Environment variable often persisted in this file
- [[system-md-file]] — The companion system prompt file
- [[session-management]] — Configuration persists within session context
- [[extensions]] — Extensions can also use environment variables