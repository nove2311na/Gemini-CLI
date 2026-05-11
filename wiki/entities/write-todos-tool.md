---
type: entity
title: "write_todos Tool"
created: 2026-01-15
updated: 2026-05-05
tags:
  - "internal-tool"
  - "task-planning"
  - "gemini-cli"
related:
  - "[[task-planning]]"
  - "[[todo-list]]"
  - "[[6. Plan tasks with todos]]"
sources: ["6. Plan tasks with todos.md"]
---

# write_todos Tool

The `write_todos` tool is an internal Gemini CLI tool that generates structured task plans from natural language descriptions. It serves as the underlying mechanism for task planning workflows.

## Triggering the Tool

The tool is automatically invoked when users explicitly request a plan:

**Prompt:** `I want to migrate this project from JavaScript to TypeScript. Please make a plan first.`

The tool analyzes the codebase and generates a structured list of steps, which then appears as the [[todo-list]] in the CLI.

## Output Format

The tool generates an ordered list of tasks, typically including:

1. **Setup steps** — Configuration files, dependencies
2. **Core implementation** — File modifications, additions
3. **Verification** — Build checks, tests

Example output from a TypeScript migration:

1. Create `tsconfig.json`
2. Rename `.js` files to `.ts`
3. Fix type errors in `utils.js`
4. Fix type errors in `server.js`
5. Verify build passes

## Dynamic Iteration

After the initial plan is generated, users can request modifications:

- "You forgot to add a step for installing `@types/node`"
- "Let's verify the build *after* each file, not just at the end"

The tool will update the todo list accordingly, treating the plan as a living document rather than a static output.

## Tutorial Reference

For a complete walkthrough of using `write_todos` in practice, see [[6. Plan tasks with todos]].

## Related Tools

- [[google-web-search]] — For research tasks before planning
- [[web-fetch-tool]] — For fetching documentation during planning