---
type: entity
title: "write_file Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "file-management"
  - "file-creation"
  - "tool"
related:
  - "[[replace-tool]]"
  - "[[run-shell-command-tool]]"
  - "[[safety-diff-review]]"
  - "[[file-tools]]"
sources:
  - "1. File management with Gemini CLI.md"
---

# write_file Tool

The write_file tool is a file creation tool used by Gemini CLI to generate new files from scratch.

## Overview

The write_file tool enables the creation of entirely new files and folder structures. Unlike the [[replace-tool]] which modifies existing files, write_file creates files that did not previously exist in the project.

## Purpose

The tool supports project development by allowing users to request new components, utilities, or configurations through natural language. Gemini generates the complete file content based on the request and project context.

## Usage Context

Users can request new files be created with specific requirements:

```
`Create a new file @src/components/LoadingSpinner.tsx with a simple Tailwind CSS spinner.`
```

New files also pass through the [[safety-diff-review]] interface before being written to disk.

## Capabilities

The write_file tool supports:
- Creating new files with complete content
- Generating folder structures
- Applying framework conventions (e.g., React components, Tailwind styling)
- Creating test files alongside source files

## Relationship to Other Tools

- Complements [[replace-tool]] for comprehensive file management
- Changes reviewed via [[safety-diff-review]] before application
- Created files can be verified with [[run-shell-command-tool]]
- Part of the [[file-tools]] suite

## See Also

- [[safety-first-editing]] — The safety principle guiding tool usage
- [[safety-diff-review]] — The review interface for proposed changes
- [[replace-tool]] — Tool for modifying existing files
- [[file-tools]] — Complete overview of file management tools