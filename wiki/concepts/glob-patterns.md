---
type: concept
title: "Glob patterns"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "pattern-matching"
  - "file-ignoring"
related:
  - "[[geminiignore]]"
  - "[[file-ignoring]]"
  - "[[pattern-negation]]"
  - "[[anchored-paths]]"
  - "[[directory-matching]]"
sources: ["3. Ignore files (.geminiignore).md"]
---

# Glob patterns

Glob patterns are wildcard-based pattern matching syntax used to specify sets of filenames. Gemini CLI uses glob patterns in `.geminiignore` to define which files should be excluded from AI operations.

## Overview

Glob patterns provide a flexible way to match multiple files using wildcard characters. The term "glob" originates from the Unix `glob` command that expanded wildcard patterns before passing them to programs.

## Wildcard Characters

### Asterisk (`*`)

Matches any sequence of characters (including no characters) within a single path component.

```ignore
# Match all .md files
*.md

# Match all files in a logs directory
logs/*
```

### Question mark (`?`)

Matches exactly one character.

```ignore
# Match file.1, file.2, file.3, etc.
file.?

# Match temp-a, temp-b, temp-c
temp-?
```

### Character classes (`[]`)

Matches any single character within the brackets. Supports ranges and negation.

```ignore
# Match file-a, file-b, file-c
file-[abc]

# Match file-1 through file-9
file-[1-9]

# Match file-a, file-b, or file-x (negation)
file-[^d-z]
```

## Usage in .geminiignore

Glob patterns in `.geminiignore` follow these conventions:

| Pattern | Meaning |
|---------|---------|
| `*.log` | Any file ending with `.log` |
| `**/*.tmp` | Any `.tmp` file in any directory |
| `src/*.js` | Any `.js` file directly in `src/` |
| `file[12].txt` | Matches `file1.txt` or `file2.txt` |
| `dir/` | Only the directory named `dir` (with trailing slash) |

## Related Concepts

- [[geminiignore]] — Configuration file using glob patterns
- [[file-ignoring]] — The concept of excluding files
- [[pattern-negation]] — Including excluded files with `!`
- [[anchored-paths]] — Path matching with leading `/`
- [[directory-matching]] — Matching only directories with trailing `/`