---
type: concept
title: "File ignoring"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "configuration"
  - "privacy"
  - "workspace-focus"
related:
  - "[[geminiignore]]"
  - "[[session]]"
  - "[[session-management]]"
  - "[[glob-patterns]]"
sources: ["3. Ignore files (.geminiignore).md"]
---

# File ignoring

File ignoring is the practice of excluding specific files and directories from AI tool operations. In the context of Gemini CLI, this is accomplished through the `.geminiignore` configuration file.

## Purpose

File ignoring serves several important purposes in AI-assisted development:

- **Privacy protection**: Exclude sensitive files such as API keys, credentials, personal configurations, and proprietary code from AI analysis
- **Focus enhancement**: Prevent the AI from being distracted by generated files, build artifacts, logs, and dependency files
- **Relevance improvement**: Ensure the AI considers only relevant source files when providing suggestions or code completions
- **Cost optimization**: By excluding large binary files or irrelevant content, reduce token usage and improve response quality

## Implementation in Gemini CLI

Gemini CLI implements file ignoring through the [[geminiignore]] file located at the project root. When a session starts, Gemini CLI reads this file and applies the patterns to filter which files are included in AI operations.

The `@` command is explicitly documented to respect `.geminiignore`, excluding matched files from its operations.

## Pattern Syntax

File ignoring in Gemini CLI supports standard [[glob-patterns]] with the following features:

- Wildcard characters (`*`, `?`, `[]`) for matching file names
- [[anchored-paths]] using leading `/` to match relative to project root
- [[directory-matching]] using trailing `/` to match only directories
- [[pattern-negation]] using `!` to include files that would otherwise be excluded

## Session Restart Requirement

Unlike `.gitignore` in Git (which works immediately via `.git/info/exclude`), changes to `.geminiignore` require restarting the Gemini CLI session to take effect. This is an important usability consideration when configuring file ignoring.

## Related Concepts

- [[geminiignore]] — The configuration file that implements file ignoring
- [[glob-patterns]] — Pattern syntax for matching files
- [[session-management]] — Understanding session lifecycle and restart requirements
- [[session]] — The context in which file ignoring operates