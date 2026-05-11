---
type: entity
title: "Memory v2"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "memory"
  - "experimental"
  - "gemini-cli"
related:
  - "[[auto-memory]]"
  - "[[session-management]]"
  - "[[settings-command]]"
  - "[[context-aware-security]]"
sources: ["III. 19. Gemini CLI settings (`settings` command).md"]
---

# Memory v2

Memory v2 is a major redesign of Gemini CLI's memory architecture that replaces the legacy `save_memory` tool with direct markdown file editing.

## Overview

Memory v2 (`experimental.memoryV2`) defaults to `true`, enabling a four-tier memory system that routes facts and context across different storage layers based on scope and relevance.

## Four-Tier Architecture

| Tier | Content Type | Storage Location |
|------|--------------|-------------------|
| 1 - Team | Shared conventions | Project `GEMINI.md` files |
| 2 - Project | Project-specific notes | Per-project private memory folder (`MEMORY.md` as index + sibling `.md` files) |
| 3 - Personal (project) | Personal project notes | Per-project private memory folder |
| 4 - Personal (global) | Cross-project preferences | `~/.gemini/GEMINI.md` |

## Key Behavior Changes

### Agent Edit Permissions

Memory v2 grants the agent permission to edit `~/.gemini/GEMINI.md` under the global settings directory. This is the **only** file under `~/.gemini/` that the agent can modify. All other `~/.gemini/` files (settings, credentials, etc.) remain off-limits.

### Migration from Legacy

When `experimental.memoryV2` is set to `false`, the system falls back to the legacy `save_memory` tool. Users migrating from legacy behavior may experience:
- Different memory storage locations
- No automatic routing across tiers
- Different edit permissions

## Configuration

Memory v2 is controlled by the `experimental.memoryV2` setting:

```json
{
  "experimental": {
    "memoryV2": true
  }
}
```

## Related Features

- **[[auto-memory]]** — Background extraction of memory patches to `.inbox/` directory
- **[[context-aware-security]]** — Security layer for memory operations
- **`/memory inbox`** — Review auto-extracted patches before applying

## Comparison with Legacy Memory

| Feature | Legacy (save_memory) | Memory v2 |
|---------|---------------------|-----------|
| Storage | Single memory system | Four-tier architecture |
| Routing | Manual | Automatic by scope |
| Edit method | Dedicated tool | Direct markdown editing |
| Agent permissions | Limited | `~/.gemini/GEMINI.md` editable |
| Integration | Standalone | Deep context integration |