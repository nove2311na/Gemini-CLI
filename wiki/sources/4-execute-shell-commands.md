---
type: source
title: "Execute Shell Commands"
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/tutorials/shell-commands/"
venue: "gemini-cli"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "tutorial"
  - "shell"
  - "automation"
  - "safety"
related:
  - "[[gemini-cli]]"
  - "[[shell-commands]]"
  - "[[sandboxing]]"
  - "[[shell-mode]]"
  - "[[confirmation-prompts]]"
  - "[[background-processes]]"
  - "[[task-planning]]"
  - "[[combined-workflows]]"
sources: ["4. Execute shell commands.md"]
---

# Execute Shell Commands

This tutorial from the official Gemini CLI documentation explains how to use shell commands within the CLI to run builds, manage git, and automate system tasks without leaving the conversation.

## Key Capabilities

The `!` prefix provides immediate, direct shell access. Commands are recorded in session context for the model to reference in follow-up prompts. Large outputs may be truncated.

**Shell Mode** allows toggling continuous shell interaction where everything typed is sent to the shell until explicitly exited.

## Autonomous Workflows

The test-fix-verify workflow demonstrates AI agency: the model can run tests, analyze errors, fix code, and verify the fix with user confirmation at each shell command.

## Background Process Management

The `/shells` command provides a dashboard for viewing and managing long-running background processes like development servers.

## Safety Features

**Confirmation prompts** require explicit approval for every shell command (Allow once / Allow always / Deny). **Sandboxing** via Docker container isolation provides defense-in-depth for untrusted code, enabled with the `--sandbox` flag.

## Limitations

Interactive commands (vim, top) are unreliable and should be run manually in a separate terminal.