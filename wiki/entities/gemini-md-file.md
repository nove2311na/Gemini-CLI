---
type: entity
title: "GEMINI.md File"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extension"
  - "documentation"
  - "prompting"
related:
  - "[[gemini-cli-extensions]]"
  - "[[extension-development-workflow]]"
sources: ["3. Gemini CLI extension best practices.md"]
---

# GEMINI.md File

The `GEMINI.md` file is a special documentation file within a Gemini CLI extension that provides essential context to the AI model about the extension's purpose and usage.

## Purpose

Unlike traditional README files, `GEMINI.md` is specifically designed to help the AI model understand how to effectively use the extension's tools and commands. This file is read by the model during prompt construction.

## Best Practices

### Focus on Goals

Explain the high-level purpose of the extension and how to interact with its tools. The model needs to understand the extension's intent, not implementation details.

### Be Concise

Avoid dumping exhaustive documentation into the file. Use clear, direct language. The model processes this file for each request, so verbosity slows reasoning.

### Provide Examples

Include brief examples of how the model should use specific tools or commands. Examples help the model understand expected input/output patterns and edge cases.

## What to Include

- **Purpose statement**: What problem does this extension solve?
- **Tool descriptions**: What does each tool do and when should it be used?
- **Usage examples**: Concrete examples showing expected interactions
- **Limitations**: Known constraints or edge cases the model should be aware of

## What to Avoid

- Exhaustive API documentation
- Implementation details the model doesn't need
- Outdated or incorrect usage examples
- Tutorial-length explanations

## Placement

The `GEMINI.md` file should be placed in the root of the extension directory alongside `gemini-extension.json`.

## Related Concepts

- [[gemini-cli-extensions]] — The extension system this file belongs to
- [[extension-development-workflow]] — Development context for creating extensions
- [[model-steering]] — Related AI interaction technique