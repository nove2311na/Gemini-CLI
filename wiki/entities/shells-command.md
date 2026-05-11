---
type: entity
title: "/shells Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "command"
  - "process-management"
  - "shell"
related:
  - "[[background-processes]]"
  - "[[shell-commands]]"
  - "[[gemini-cli]]"
sources: ["4. Execute shell commands.md"]
---

# /shells Command

The `/shells` command is a Gemini CLI command that opens a dashboard for viewing and managing background shell processes started during the session.

## Usage

```
/shells
```

## Functionality

When invoked, `/shells` displays:

- A list of all active background processes
- Log output from running processes
- Options to kill or terminate runaway processes

## Purpose

This command provides visibility and control over long-running tasks that the AI has started. Without `/shells`, background processes would run invisibly with no way to inspect their status or terminate them if they become unresponsive.

## Relationship to Background Processes

The `/shells` dashboard is the primary interface for managing [[background-processes]]. It complements [[shell-commands]] by providing oversight for processes that run detached from immediate conversation flow.