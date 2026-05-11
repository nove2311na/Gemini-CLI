---
type: entity
title: "save_memory Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "tool"
  - "memory"
  - "fact-capture"
  - "GEMINI.md"
related:
  - "[[GEMINI.md]]"
  - "[[auto-memory]]"
  - "[[session]]"
sources: ["III. 3. Auto Memory.md"]
---

# save_memory Tool

The save_memory tool is a built-in Gemini CLI tool that captures single facts and context snippets into GEMINI.md files. It serves as the complementary mechanism to Auto Memory for persistent memory management.

## Functionality

When invoked during a session, save_memory takes a fact or piece of context and appends it to the relevant GEMINI.md file. This allows users to explicitly preserve information they want the agent to remember for future sessions.

## Complement to Auto Memory

While Auto Memory automatically extracts multi-step procedures from session history, save_memory requires explicit user action to capture individual facts. This makes save_memory more targeted but less automated than Auto Memory's pattern discovery approach.

## Use Cases

save_memory is appropriate for capturing atomic facts that the agent should know: project conventions, important file locations, API keys or configuration values, team-specific workflows, and other context that would otherwise require repeated explanation.

## Memory Storage

Facts captured via save_memory are stored in GEMINI.md files in the project or user memory directory. These files are automatically loaded into session context, making the stored information available to the agent across sessions.