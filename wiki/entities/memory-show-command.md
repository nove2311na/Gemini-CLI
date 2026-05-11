---
type: entity
title: "/memory show Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "command"
  - "memory"
  - "debugging"
  - "gemini-cli"
related:
  - "[[memory-feature]]"
  - "[[context-hierarchy]]"
  - "[[gemini-md]]"
sources: ["3. Manage context and memory.md"]
---

# /memory show Command

The `/memory show` command displays the complete concatenated context that Gemini CLI sends to the model at the start of each session. It is primarily used for debugging context configuration issues.

## Purpose

When the agent appears to ignore rules or behave unexpectedly, `/memory show` helps diagnose whether the problem lies in the context configuration. It reveals exactly what instructions are being loaded from [[gemini-md]] files and the [[memory-feature]].

## Usage

```bash
/memory show
```

## Output

The command prints the raw text that constitutes the session's initial context, including:

- Rules from `~/.gemini/GEMINI.md` (global)
- Rules from `./GEMINI.md` (project root)
- Rules from subdirectory `GEMINI.md` files
- Saved memories from the `save_memory` tool

## Example Scenario

A user adds a rule to their project GEMINI.md file:

```markdown
- Do not use class components in React
```

But the agent continues suggesting class components. Running `/memory show` reveals:

1. The rule is not present (file not loaded correctly)
2. A conflicting rule exists in the global GEMINI.md
3. The rule is present but in a format the agent misinterprets

## Relationship to Other Commands

### /memory reload
While `/memory show` inspects the current context, `/memory reload` forces a refresh of context files. These commands are complementary:

- Use `/memory show` to diagnose what is loaded
- Use `/memory reload` to apply changes after editing files

## See Also

- [[memory-feature]] — The feature this command inspects
- [[gemini-md]] — Configuration files that contribute to shown context
- [[context-hierarchy]] — How context is loaded and organized