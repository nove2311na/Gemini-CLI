---
type: concept
title: "File Injection"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "custom-commands"
  - "multimodal"
  - "content-injection"
related:
  - "[[custom-commands]]"
  - "[[shell-injection]]"
  - "[[argument-injection]]"
sources: ["1. Custom commands.md"]
---

# File Injection

File injection allows custom commands to directly embed the content of files or directories into prompts using the `@{...}` syntax. This supports both text content and multimodal input.

## Syntax

```toml
prompt = """
You are an expert code reviewer.
Your task is to review {{args}}.

Use the following best practices when providing your review:

@{docs/best-practices.md}
"""
```

## Supported Content Types

### File Injection
- `@{path/to/file.txt}` is replaced by the content of `file.txt`

### Multimodal Support
- **Images**: Automatically encoded and injected as multimodal input
- **PDFs**: Processed for text extraction and injection
- **Audio**: Supported for transcription use cases
- **Video**: Supported for analysis scenarios

### Directory Injection
- `@{path/to/dir}` traverses the directory and inserts each file into the prompt
- Respects `.gitignore` and `.geminiignore` files
- Useful for batch review or documentation scenarios

## Processing Order

File content injection is processed **before** shell commands and argument substitution. This ensures that referenced files are available when shell commands execute.

## Use Cases

1. **Code review templates**: Inject coding standards and best practices
2. **Documentation generation**: Include existing docs for context
3. **Bug reports**: Attach logs and error traces
4. **Architecture reviews**: Inject multiple files for comprehensive analysis