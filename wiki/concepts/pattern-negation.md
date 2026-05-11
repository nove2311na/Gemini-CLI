---
type: concept
title: "Pattern negation"
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
sources: ["3. Ignore files (.geminiignore).md"]
---

# Pattern negation

Pattern negation is a technique in `.geminiignore` that uses the `!` prefix to include files that would otherwise be excluded by previous patterns. This allows for fine-grained control over which files are ignored.

## Overview

When building `.geminiignore` patterns, you often want to exclude all files matching a certain criteria, then selectively re-include a subset. Pattern negation with `!` makes this possible by reversing the exclusion effect for matching files.

## Syntax

Prepend `!` to any pattern to negate it, causing matching files to be included even if they would otherwise be ignored.

```ignore
# Exclude all .md files
*.md

# But include README.md specifically
!README.md
```

## Practical Examples

### Excluding All Logs Except Errors

```ignore
# Exclude all log files
*.log

# But include error logs
!errors.log
```

### Ignoring Build Output Except Artifacts

```ignore
# Ignore all files in dist
dist/*

# But re-include source maps
!dist/*.map
```

### Excluding Directory With Exceptions

```ignore
# Ignore everything in test-data
test-data/*

# But keep specific fixture files
!test-data/fixtures.json
```

## Evaluation Order

Pattern negation respects the order of patterns in `.geminiignore`. Patterns that appear later override earlier ones. This means negation patterns should generally appear after the patterns they are negating.

```ignore
# Order matters
*.md        # First: exclude all markdown
!README.md  # Second: re-include README.md
```

## Limitations

- Pattern negation cannot include files from parent directories that were excluded via anchored paths
- Negation patterns must match at least one excluded file to have effect
- Patterns are evaluated in order, so placement matters

## Related Concepts

- [[geminiignore]] — Configuration file supporting negation
- [[glob-patterns]] — Pattern syntax including negation
- [[file-ignoring]] — The broader concept of excluding files
- [[anchored-paths]] — Path patterns that can be negated
- [[directory-matching]] — Directory patterns that can be negated