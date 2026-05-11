---
type: entity
title: "GEMINI.md"
created: 2026-05-05
updated: 2026-05-05
tags: ["configuration", "project-context", "gemini-cli", "file-format"]
related: ["project-context", "hierarchical-context", "memory-v2", "session-management"]
sources: ["3. Manage context and memory.md", "III. 3. Auto Memory.md", "5. Project context (GEMINI.md).md"]
---

# GEMINI.md

GEMINI.md is a plain text file format serving as the primary mechanism for persistent, project-specific AI context in Gemini CLI. It functions as a configuration file that the AI agent reads to understand team conventions and project-specific guidelines. Unlike inline instructions, these files reside within the project directory structure itself, enabling version control integration and team-wide consistency.

## File Format

GEMINI.md files are simple Markdown text files containing instructions, conventions, and guidelines written in natural language. The content is free-form, allowing teams to include whatever context they deem relevant. Common entries include coding standards, architectural decisions, preferred libraries, build commands, and workflow patterns. The absence of a strict schema provides flexibility while relying on human readability for maintainability.

## Placement Strategy

The placement of GEMINI.md files within the directory structure determines their scope. A file at the project root (`./GEMINI.md`) applies repository-wide context to all interactions. Files placed in subdirectories (`./src/GEMINI.md`, `./docs/GEMINI.md`) provide scoped context that applies only when the agent operates within that subtree. This hierarchical placement creates a layered configuration system where more specific instructions can override or extend broader repository-level guidance.

## Team Collaboration

The file format is designed for team use through version control systems. Teams commit their GEMINI.md files to Git alongside source code, ensuring all contributors receive consistent context. This approach differs from private notes or personal configurations because the shared file becomes part of the project's history, allowing teams to track how conventions evolve over time. New team members automatically inherit project context when they clone the repository.

## Integration with Memory v2

When the experimental `memoryV2` feature is enabled, the AI agent gains the ability to modify GEMINI.md files directly. This enables dynamic knowledge capture where the agent can write newly discovered conventions back to these files, persisting learned patterns for future sessions. The agent can update existing context or add new sections as it learns more about the project's practices through interaction.

## Relationship to Session Management

GEMINI.md files are loaded automatically during session initialization, as documented in [[session-management]]. Unlike manual context injection, this automatic loading means teams may not realize that context is being injected. The loaded context combines with the conversation history to form the complete agent awareness for the session. Changes to GEMINI.md files during an active session may not take effect until the next session unless Memory v2 is used.