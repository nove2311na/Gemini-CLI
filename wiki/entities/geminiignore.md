---
type: entity
title: ".geminiignore"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "configuration"
  - "file-ignoring"
related:
  - "[[file-ignoring]]"
  - "[[glob-patterns]]"
  - "[[session-management]]"
  - "[[3-ignore-files-geminiignore]]"
sources: ["3. Ignore files (.geminiignore).md"]
---

# .geminiignore

`.geminiignore` is a configuration file used by Gemini CLI to exclude specific files and directories from AI operations. It follows conventions similar to `.gitignore` (Git) and `.aiexclude` (Gemini Code Assist).

## Overview

When placed in the root of a project directory, `.geminiignore` acts as a filter that tells Gemini CLI which files should be excluded from operations such as the `@` command. This provides control over privacy, focus, and relevance of AI-generated suggestions.

## File Location and Creation

The file must be created at the root of your project directory with the exact name `.geminiignore`. Unlike `.gitignore`, there is no project-wide or global configuration option—the file must be present in each project where you want file ignoring to apply.

## Supported Patterns

The `.geminiignore` file supports several pattern types for flexible file exclusion:

- **Comment lines**: Lines starting with `#` are ignored
- **Blank lines**: Ignored for readability
- **Glob patterns**: Standard wildcard syntax with `*` (any characters), `?` (single character), and `[]` (character ranges)
- **Directory-only matching**: Trailing `/` restricts patterns to directories only
- **Anchored paths**: Leading `/` restricts patterns relative to the `.geminiignore` location
- **Negation**: Leading `!` reverses a pattern to include excluded files

## Usage Examples

```ignore
# Exclude a specific directory
/packages/

# Exclude a specific file
apikeys.txt

# Exclude all files with a certain extension
*.md

# Exclude all .md files except README.md
*.md
!README.md
```

## Important Caveat

**Changes to `.geminiignore` require a session restart to take effect.** Unlike `.gitignore`, which works immediately through `.git/info/exclude`, the file is read at session initialization. You must exit and restart your Gemini CLI session for any changes to be recognized.

## Related Concepts

- [[file-ignoring]] — The general concept of excluding files from AI operations
- [[glob-patterns]] — Wildcard syntax used in `.geminiignore`
- [[pattern-negation]] — Using `!` to include files that would otherwise be excluded
- [[anchored-paths]] — Path anchoring with leading `/`
- [[directory-matching]] — Matching only directories with trailing `/`
- [[session-management]] — Session restart requirement for applying changes