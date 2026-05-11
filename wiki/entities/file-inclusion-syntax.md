---
type: entity
title: "@ (File Inclusion Syntax)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "file-management"
  - "context-injection"
  - "syntax"
related:
  - "[[file-context-injection]]"
  - "[[glob-tool]]"
  - "[[list-directory-tool]]"
  - "[[token-budget-awareness]]"
sources:
  - "1. File management with Gemini CLI.md"
---

# @ (File Inclusion Syntax)

The `@` symbol is the direct file inclusion syntax in Gemini CLI that forces the CLI to read a specific file immediately and inject its content into the current prompt context.

## Overview

This syntax serves as the primary mechanism for providing targeted file context to Gemini. Rather than relying on the agent to discover relevant files, users can explicitly reference files using their paths, ensuring the agent has precise access to the content needed for analysis or modification.

## Usage Patterns

### Single File Inclusion

The basic syntax uses `@` followed by the file path:

```
`@src/components/UserProfile.tsx Explain how this component handles user data.`
```

This forces Gemini to read the specified file and use its content as context for the following request.

### Multiple File Chaining

For complex features spanning multiple files, chain `@` references:

```
`@src/components/UserProfile.tsx @src/types/User.ts Refactor the component to use the updated User interface.`
```

This gives the agent a complete picture of dependencies across files.

### Directory Inclusion

Include entire directories for broad questions or refactoring:

```
`@src/utils/ Check these utility functions for any deprecated API usage.`
```

Note that directory inclusions consume more tokens than single file references.

## Relationship to Other Tools

The `@` syntax works in conjunction with exploration tools like [[glob-tool]] and [[list-directory-tool]]. When users do not know exact paths, they can ask Gemini to find files first, then use the discovered paths with `@` in subsequent requests.

## Token Efficiency

Single file inclusions via `@` are more token-efficient than directory inclusions. Users should prefer targeted `@` references over broad directory inclusions when working with specific files.

## See Also

- [[file-context-injection]] — The broader concept of providing context to Gemini
- [[token-budget-awareness]] — Understanding token costs of different inclusion strategies
- [[file-tools]] — Overview of the complete file tool suite