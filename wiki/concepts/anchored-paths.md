---
type: concept
title: "Anchored paths"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "pattern-matching"
  - "file-ignoring"
related:
  - "[[geminiignore]]"
  - "[[glob-patterns]]"
  - "[[file-ignoring]]"
  - "[[directory-matching]]"
sources: ["3. Ignore files (.geminiignore).md"]
---

# Anchored paths

Anchored paths are pattern specifications in `.geminiignore` that start with a forward slash (`/`), which restricts matching to paths relative to the location of the `.geminiignore` file itself (typically the project root).

## Overview

By default, glob patterns in `.geminiignore` can match files anywhere in the directory tree. Adding a leading `/` anchors the pattern to the project root, ensuring the pattern only matches files at that specific location rather than in subdirectories.

## Syntax

Place `/` at the beginning of a pattern to anchor it:

```ignore
# Anchored - only matches /build in the project root
/build/

# Unanchored - matches any directory named "build" at any depth
build/
```

## Practical Examples

### Anchored Patterns

```ignore
# Only ignore the /packages directory at the project root
/packages/

# Only ignore config.yaml at the project root
/config.yaml
```

### Unanchored Patterns

```ignore
# Ignores node_modules anywhere in the project
node_modules/

# Ignores .log files anywhere in the project
*.log
```

## Why Use Anchored Paths?

- **Precision**: When you have a specific file or directory to exclude, anchored paths prevent accidental matches elsewhere
- **Clarity**: Makes intent explicit in the `.geminiignore` file
- **Safety**: Prevents excluding files with the same name in different project locations

## Comparison with Git

The anchored path behavior in `.geminiignore` mirrors that of `.gitignore`:

| Pattern | Git Behavior | Gemini CLI Behavior |
|---------|--------------|---------------------|
| `/path` | Match relative to `.gitignore` location | Match relative to `.geminiignore` location |
| `path` | Match anywhere in repository | Match anywhere in project |
| `path/` | Match directory anywhere | Match directory anywhere |

## Related Concepts

- [[geminiignore]] — Configuration file using anchored paths
- [[glob-patterns]] — The broader pattern matching system
- [[file-ignoring]] — The purpose of excluding files
- [[directory-matching]] — Combining with trailing `/` for directory-only matching
- [[pattern-negation]] — Can be combined with anchored paths: `!/specific-path`