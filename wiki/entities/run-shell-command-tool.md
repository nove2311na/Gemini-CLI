---
type: entity
title: "run_shell_command Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "file-management"
  - "execution"
  - "tool"
  - "testing"
related:
  - "[[replace-tool]]"
  - "[[write-file-tool]]"
  - "[[verification]]"
  - "[[file-tools]]"
sources:
  - "1. File management with Gemini CLI.md"
---

# run_shell_command Tool

The run_shell_command tool is an execution tool used by Gemini CLI to run tests, builds, and other shell commands.

## Overview

The run_shell_command tool enables verification of code changes by executing test suites, build processes, and other command-line operations. This completes the file management workflow by confirming that modifications did not break existing functionality.

## Purpose

The tool serves the verification step in the file management workflow, ensuring that code changes are correct before considering a task complete. It provides feedback on whether modifications work as expected.

## Usage Context

After making changes via [[replace-tool]] or [[write-file-tool]], users can request test execution:

```
`Run the tests for the UserProfile component.`
```

Gemini uses the run_shell_command tool to execute the appropriate test runner (npm test, jest, pytest, etc.) and reports results.

## Common Commands

The tool supports any shell command, but common use cases include:
- Running test suites: `npm test`, `jest`, `pytest`
- Building projects: `npm run build`, `make`
- Type checking: `tsc`, `mypy`
- Linting: `eslint`, `prettier`
- Custom scripts defined in package.json

## Relationship to Other Tools

- Executes verification after [[replace-tool]] or [[write-file-tool]] changes
- Provides feedback loop for iterative refinement
- Part of the [[file-tools]] suite

## See Also

- [[verification]] — The concept of confirming correctness
- [[replace-tool]] — Tool for modifying existing files
- [[write-file-tool]] — Tool for creating new files
- [[file-tools]] — Complete overview of file management tools