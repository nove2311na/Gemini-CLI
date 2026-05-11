---
type: entity
title: "list_directory Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "file-management"
  - "search"
  - "tool"
related:
  - "[[glob-tool]]"
  - "[[file-inclusion-syntax]]"
  - "[[exploration-via-tools]]"
  - "[[file-tools]]"
sources:
  - "1. File management with Gemini CLI.md"
---

# list_directory Tool

The list_directory tool is a search tool used by Gemini CLI to explore and browse project directory structures.

## Overview

The list_directory tool enables directory browsing, allowing users to discover files by exploring folder hierarchies rather than using pattern matching. This complements the [[glob-tool]] by providing a different approach to file discovery.

## Purpose

The list_directory tool supports the [[exploration-via-tools]] workflow by allowing Gemini to navigate through project structure. When combined with pattern matching awareness, this tool helps locate files even when users have only partial information about file organization.

## Usage Context

In the file management workflow, the list_directory tool is used alongside glob when users need to find files:

```
`Find the file that defines the UserProfile component.`
```

Gemini may use list_directory to explore the directory structure, identify relevant folders, and narrow down to specific files. The resulting paths can then be used with the [[file-inclusion-syntax]] `@` operator.

## Relationship to Other Tools

- Pairs with [[glob-tool]] for comprehensive search capabilities
- Results enable [[file-inclusion-syntax]] for subsequent context injection
- Part of the [[file-tools]] suite

## See Also

- [[exploration-via-tools]] — The concept of discovering files through natural language
- [[glob-tool]] — Pattern-based alternative discovery tool
- [[file-tools]] — Complete overview of file management tools