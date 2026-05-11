---
type: source
title: "Ignoring files"
source: https://geminicli.com/docs/cli/gemini-ignore/
published: 2026-04-10
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "configuration"
  - "file-ignoring"
related:
  - "[[geminiignore]]"
  - "[[session-management]]"
  - "[[file-ignoring]]"
  - "[[glob-patterns]]"
sources: ["3. Ignore files (.geminiignore).md"]
---

# Ignoring files

This document provides an overview of the Gemini Ignore (`.geminiignore`) feature of Gemini CLI.

Gemini CLI includes the ability to automatically ignore files, similar to `.gitignore` (used by Git) and `.aiexclude` (used by Gemini Code Assist). Adding paths to your `.geminiignore` file will exclude them from tools that support this feature.

## How it works

When you add a path to your `.geminiignore` file, tools that respect this file will exclude matching files and directories from their operations (e.g., the `@` command).

**.geminiignore conventions:**

- Blank lines and lines starting with `#` are ignored.
- Standard glob patterns are supported (`*`, `?`, `[]`).
- Putting a `/` at the end will only match directories.
- Putting a `/` at the beginning anchors the path relative to the `.geminiignore` file.
- `!` negates a pattern.

> **Note:** To apply changes to `.geminiignore`, you must restart your Gemini CLI session.

## How to use .geminiignore

1. Create a file named `.geminiignore` in the root of your project directory.
2. Add the paths or files you want to ignore.

## .geminiignore examples

```ignore
# Exclude your /packages/ directory and all subdirectories
/packages/

# Exclude your apikeys.txt file
apikeys.txt

# Exclude all .md files
*.md

# Exclude all .md files except README.md
*.md
!README.md
```

## Key Takeaways

- [[geminiignore]] is a configuration file that excludes files from AI operations
- Supports standard [[glob-patterns]] syntax with wildcards (`*`, `?`, `[]`)
- Uses [[pattern-negation]] with `!` to include files that would otherwise be excluded
- [[anchored-paths]] with leading `/` restrict patterns to the project root
- [[directory-matching]] with trailing `/` ensures only directories are matched
- Changes require a [[session-management]] restart to take effect