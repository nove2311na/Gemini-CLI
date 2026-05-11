---
type: concept
title: "Shell Mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "shell"
  - "mode"
  - "interaction"
related:
  - "[[shell-commands]]"
  - "[[gemini-cli]]"
sources: ["4. Execute shell commands.md"]
---

# Shell Mode

Shell Mode is a toggle feature in Gemini CLI that enables continuous shell interaction without repeatedly using the `!` prefix.

## Activation

Type `!` and press **Enter** to activate Shell Mode. The CLI enters a state where everything you type is sent directly to the shell for execution.

## Behavior

While in Shell Mode:

- Every line you type is executed as a shell command
- Output displays immediately
- No `!` prefix needed for each command
- The AI is not involved in interpreting or routing commands

## Exiting Shell Mode

Exit by pressing **Esc** or typing `exit`. Control returns to normal conversation mode where prompts are sent to the AI.

## Use Cases

Shell Mode is useful when performing multiple sequential shell operations during a conversation—checking files, navigating directories, running quick checks—without the overhead of prefixing each command.

This is distinct from background processes, which run detached from the main session. Shell Mode is for interactive, immediate command execution.