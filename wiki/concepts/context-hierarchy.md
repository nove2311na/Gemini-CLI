---
type: concept
title: "Context Hierarchy"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "context"
  - "configuration"
  - "gemini-cli"
  - "architecture"
related:
  - "[[gemini-md]]"
  - "[[memory-feature]]"
  - "[[session]]"
  - "[[session-management]]"
sources: ["3. Manage context and memory.md"]
---

# Context Hierarchy

Context hierarchy is a three-tiered system in Gemini CLI for loading instructions from multiple sources. It enables layered, scoped configuration by combining rules from global, project, and subdirectory levels into a unified context for each conversation.

## Overview

When Gemini CLI starts a session, it automatically collects and concatenates instructions from multiple `GEMINI.md` files based on the user's current working directory. This hierarchical approach resolves the tension between personal defaults and project-specific rules.

## Three Tiers

### 1. Global Level

**Location:** `~/.gemini/GEMINI.md`

**Purpose:** Rules that apply to every project you work on.

**Example use cases:**
- Preferred coding style (e.g., "Always use const over let")
- General architectural preferences
- Personal tool preferences

### 2. Project Root Level

**Location:** `./GEMINI.md` (in project root)

**Purpose:** Rules specific to the current repository.

**Example use cases:**
- Framework choices (e.g., "We use React with Vite")
- Testing requirements (e.g., "All components need Vitest tests")
- Team conventions

### 3. Subdirectory Level

**Location:** `./src/GEMINI.md` (or any subdirectory)

**Purpose:** Rules specific to a particular folder or module.

**Example use cases:**
- Language-specific rules (e.g., "Use Python 3.11 in backend")
- Module-specific constraints
- Legacy code handling

## Loading Behavior

1. Gemini CLI detects the current working directory when a session starts
2. It traverses from the project root toward the current directory
3. All discovered GEMINI.md files are loaded and concatenated
4. The combined context is prepended to the conversation

## Merge and Conflict Resolution

The document does not explicitly specify how conflicts between tiers are resolved. General principles observed:

- **Specific overrides general:** Subdirectory rules typically take precedence over project rules
- **Project overrides global:** Repository-specific rules override personal defaults
- **All rules apply:** Unless explicitly contradictory, rules from all tiers are cumulative

## Session Behavior

### Automatic Loading
When a new [[session]] starts, the hierarchy is loaded automatically without explicit user invocation.

### Active Session Changes
Changes to GEMINI.md files during an active session require manual reload using the `/memory reload` command. The agent will not detect file changes automatically.

## Relationship to Other Concepts

### Memory Feature
While [[context-hierarchy]] handles file-based configuration, the [[memory-feature]] provides conversational fact storage via the `save_memory` tool. Both contribute to persistent context but use different mechanisms:

- **Context Hierarchy:** File-based, version-controllable, requires manual reload
- **Memory:** Tool-based, conversational, automatically applied

### Session Management
Context hierarchy is a core component of [[session-management]]. Each session automatically loads applicable GEMINI.md files as part of its initialization process.

## Best Practices

1. **Set general rules globally:** Define broad preferences in `~/.gemini/GEMINI.md`
2. **Override at project level:** Use `./GEMINI.md` for project-specific requirements
3. **Use subdirectories sparingly:** Only when folder-specific rules are necessary
4. **Document hierarchy intent:** Comment GEMINI.md files to explain why rules exist

## Open Questions

- How does context hierarchy interact with [[model-steering]] or other behavioral modifiers?
- Can explicit user instructions in a single turn override GEMINI.md rules?
- Does the Auto Memory feature modify hierarchical loading behavior?

## See Also

- [[gemini-md]] — The configuration file format used in this hierarchy
- [[memory-feature]] — Alternative persistent context mechanism
- [[session-management]] — How sessions integrate with context loading