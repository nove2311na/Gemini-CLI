---
type: entity
title: "replace Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "file-management"
  - "editing"
  - "tool"
related:
  - "[[write-file-tool]]"
  - "[[run-shell-command-tool]]"
  - "[[safety-diff-review]]"
  - "[[file-tools]]"
sources:
  - "1. File management with Gemini CLI.md"
---

# replace Tool

The replace tool is an editing tool used by Gemini CLI to propose targeted code changes to existing files.

## Overview

The replace tool enables precise code modifications by proposing targeted changes rather than simple text replacement. This allows for complex refactoring operations that preserve surrounding code and maintain proper formatting.

## Purpose

The tool serves the [[safety-first-editing]] concept by ensuring all changes are reviewed via the [[safety-diff-review]] interface before application. This safety-first approach means the replace tool proposes changes rather than directly modifying files.

## Usage Context

When given a file with context (via [[file-inclusion-syntax]]), users can direct Gemini to make specific edits:

```
`Update @src/components/UserProfile.tsx to show a loading spinner if the user data is null.`
```

The replace tool generates the targeted change which then goes through the safety diff review interface.

## Capabilities

The replace tool supports:
- Targeted code insertion and replacement
- Complex refactoring beyond simple text substitution
- Preservation of code formatting and structure
- Multi-line changes across function boundaries

## Relationship to Other Tools

- Works with [[write-file-tool]] for comprehensive file modification
- Changes are verified using [[run-shell-command-tool]]
- All changes pass through [[safety-diff-review]] before application
- Part of the [[file-tools]] suite

## See Also

- [[safety-first-editing]] — The safety principle guiding tool usage
- [[safety-diff-review]] — The review interface for proposed changes
- [[write-file-tool]] — Tool for creating new files
- [[file-tools]] — Complete overview of file management tools