---
type: concept
title: "Hierarchical Context"
created: 2026-05-05
updated: 2026-05-05
tags: ["gemini-cli", "configuration", "scoping", "directory-structure"]
related: ["gemini-md", "project-context", "session-management"]
sources: ["5. Project context (GEMINI.md).md"]
---

# Hierarchical Context

Hierarchical context is an organizational strategy within Gemini CLI that allows project-specific instructions to be scoped at different levels through the placement of [[GEMINI.md]] files throughout the directory structure. This approach enables fine-grained control over AI agent behavior by recognizing that different modules or components within a project often have distinct requirements, conventions, and workflows.

## How It Works

When Gemini CLI initializes a session or enters a directory, it detects [[GEMINI.md]] files at the current location and parent directories. Each discovered file contributes its context to the agent's awareness. A file at the project root establishes repository-wide standards, while files in subdirectories provide context specific to those areas. The agent accumulates context from all discovered files, with more specific subdirectory context available alongside broader repository context.

For example, when working in `./src/components/Button/`, the agent would have access to context from `./GEMINI.md`, `./src/GEMINI.md`, and `./src/components/GEMINI.md` (if these files exist), plus any context specific to the Button component directory. This layered approach ensures the agent understands both the broad project standards and the specific requirements of the current working area.

## Practical Applications

Hierarchical context enables several practical patterns. Monorepos can maintain separate conventions for different packages or applications within the same repository. Large projects can scope different architectural approaches to different subsystems. Teams can establish default conventions at the root while allowing individual modules to define their own patterns when needed.

This structure also supports gradual adoption. Teams can start with a single root-level GEMINI.md file and introduce subdirectory files as needed when certain areas develop their own conventions. The absence of a subdirectory file simply means that area inherits the parent-level context.

## Comparison with Flat Context

A flat context model would apply a single set of instructions everywhere in the project. While simpler to manage, this approach struggles with projects that have genuinely different requirements in different areas. Hierarchical context solves this by making context location-aware, ensuring the agent has relevant guidance for its current working context.

The hierarchical approach also improves maintainability. Repository-wide standards live in one file, while component-specific details live in their respective directories. This colocation makes it easier to understand what context applies to a given area and to update context when requirements change.

## Interaction with Session Management

The automatic detection of context files happens as part of [[session-management]] initialization. When a session begins, Gemini CLI walks the directory tree from the current location upward, collecting GEMINI.md files and combining their contents into the session's initial context. This automatic detection means users do not need to manually specify which context files to load.