---
type: entity
title: "glob Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "file-management"
  - "search"
  - "tool"
related:
  - "[[list-directory-tool]]"
  - "[[file-inclusion-syntax]]"
  - "[[exploration-via-tools]]"
  - "[[file-tools]]"
sources:
  - "1. File management with Gemini CLI.md"
---

# glob Tool

The glob tool is a search tool used by Gemini CLI to find files by pattern matching within a project structure.

## Overview

The glob tool enables pattern-based file discovery, allowing users to locate files without knowing their exact paths. When given a pattern specification (such as `**/*.tsx` or `*Profile*`), the tool returns matching file paths that can then be used for further operations.

## Purpose

The glob tool serves the [[exploration-via-tools]] concept by reducing manual navigation friction. Instead of manually browsing directory structures, users can describe what they are looking for and let Gemini search using glob patterns.

## Usage Context

In the file management workflow, the glob tool is invoked when users ask Gemini to find files they do not know the location of:

```
`Find the file that defines the UserProfile component.`
```

Gemini uses the glob tool (or [[list-directory-tool]]) to search the project structure and returns specific paths that can then be used with the [[file-inclusion-syntax]] `@` operator.

## Relationship to Other Tools

- Works alongside [[list-directory-tool]] for comprehensive file discovery
- Results feed into [[file-inclusion-syntax]] for context injection
- Part of the broader [[file-tools]] suite

## See Also

- [[exploration-via-tools]] — The concept of discovering files through natural language
- [[list-directory-tool]] — Alternative discovery tool for directory browsing
- [[file-tools]] — Complete overview of file management tools