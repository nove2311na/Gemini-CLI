---
type: concept
title: "Permission System"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "user-experience"
  - "file-operations"
  - "safety"
related:
  - "[[gemini-cli]]"
  - "[[write-todos-tool]]"
sources: ["2. Get started with Gemini CLI.md"]
---

# Permission System

The permission system is Gemini CLI's interactive confirmation mechanism that protects users from unintended file operations. Before executing potentially destructive or irreversible actions, the system pauses for explicit user approval.

## How It Works

When Gemini CLI needs to perform a file-modifying operation (write, rename, clone, etc.), it presents a confirmation dialog asking the user to approve the action before proceeding.

## Confirmation Options

| Option | Behavior | Use Case |
|--------|----------|----------|
| **Allow once** | Grants permission for only the current operation | Single, one-off operations where you want to review each action |
| **Allow always** | Grants persistent permission for similar future operations | Trusted operations you expect to repeat in the workflow |

## Operations Requiring Permission

The permission system guards file operations that modify the filesystem:

- **File renaming** — Changing filenames based on content analysis
- **File creation** — Writing new files (including test files, combined CSVs)
- **Git clone** — Downloading repositories to local filesystem
- **File reading** — Accessing source code for analysis (shown in chalk example)
- **Code generation** — Writing generated code to disk

## Security Implications

The permission system provides a critical safety layer because [[gemini-cli]] operates with the same filesystem permissions as the user running it. This means:

1. **No silent modifications** — Users explicitly approve each change
2. **Audit trail** — Users remain aware of operations being performed
3. **Recovery opportunity** — Prevents accidental destructive actions

## Relationship to Rewind Feature

The permission system complements the [[rewind-feature]] by preventing unwanted changes before they occur, whereas [[rewind-feature]] enables recovery after the fact. Users benefit from both proactive (permission) and reactive (rewind) safety mechanisms.

## Design Philosophy

The permission system reflects a balance between automation power and user control. Rather than requiring users to manually approve every operation or granting unlimited trust, Gemini CLI allows granular permission granting based on operation type and user intent.