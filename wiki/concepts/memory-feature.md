---
type: concept
title: "Memory Feature"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "memory"
  - "context"
  - "gemini-cli"
  - "persistence"
related:
  - "[[gemini-md]]"
  - "[[context-hierarchy]]"
  - "[[session]]"
  - "[[session-management]]"
sources: ["3. Manage context and memory.md"]
---

# Memory Feature

The memory feature in Gemini CLI enables persistent storage of user-provided facts that are automatically recalled across sessions without explicit invocation. Unlike file-based configuration, memory operates through conversational interaction using the `save_memory` tool.

## Overview

The memory feature solves the "set once, use forever" problem by allowing users to tell the agent something once and having it remember indefinitely. This reduces repetitive context-setting and enables a more natural conversational workflow.

## How It Works

### Saving Facts

Users save facts naturally through conversation:

**Prompt:** `Remember that I prefer using 'const' over 'let' wherever possible.`

**Prompt:** `Save the fact that the staging server IP is 10.0.0.5.`

The agent invokes the `save_memory` tool to store these facts in a global memory file. This happens automatically as part of natural conversation — no special syntax required.

### Automatic Recall

Once a fact is saved, the agent "knows" it automatically. Users do not need to re-invoke or reference the memory explicitly in subsequent prompts.

**Example flow:**

1. User: `Save the fact that the staging server IP is 10.0.0.5.`
2. User: `Write a script to deploy to staging.`
3. Agent: Uses `10.0.0.5` without being told — the fact is already known.

## Storage Mechanism

The specific storage format and location are not documented in detail. The document references a "global memory file" that persists user facts across sessions, but technical details such as:

- File location
- Format structure
- Size limits
- Retention policies

are not specified.

## Relationship to GEMINI.md

Memory and [[gemini-md]] files serve similar purposes (persistent context) but differ in implementation:

| Aspect | Memory Feature | GEMINI.md |
|--------|----------------|-----------|
| **Storage** | Tool-based (`save_memory`) | File-based |
| **Format** | Conversational | Markdown |
| **Version control** | No | Yes |
| **Reload required** | No | Yes (in-session) |
| **Team sharing** | Difficult | Easy |
| **Use case** | Personal facts, preferences | Standards, conventions |

### When to Use Each

**Use Memory for:**
- Personal preferences
- Environment-specific values (server IPs, ports)
- One-time facts that apply across projects
- Information discovered during conversation

**Use GEMINI.md for:**
- Team standards and conventions
- Project-specific rules
- Version-controlled configuration
- Structured instruction sets

## Session Integration

Memory is loaded as part of the [[session]] initialization. When a session starts, saved memories are concatenated into the conversation context alongside [[context-hierarchy]] rules from GEMINI.md files.

Unlike GEMINI.md edits, memory changes do not require a `/memory reload` command — the feature works automatically once facts are saved.

## Experimental Auto Memory

The documentation references an "experimental Auto Memory feature" that can "extract reusable skills from your past sessions automatically." However, no details are provided about its current status or functionality. This appears to be a planned enhancement rather than an available feature.

## Best Practices

1. **Save naturally:** Don't overthink the format — conversational descriptions work
2. **Be specific:** Clear, concrete facts are more useful than vague statements
3. **Review periodically:** Check saved memories to remove outdated or incorrect facts
4. **Use for cross-project facts:** Memory is ideal for preferences that apply everywhere

## Debugging

To inspect which memories are currently active, use the `/memory show` command:

```bash
/memory show
```

This displays all concatenated context from GEMINI.md files and saved memories, allowing verification of what the agent "knows."

## See Also

- [[gemini-md]] — File-based alternative for persistent configuration
- [[context-hierarchy]] — Three-tier system for loading instructions
- [[session-management]] — How sessions integrate with memory
- [[3-manage-context-and-memory]] — Source tutorial