---
type: concept
title: "run_shell_command Tool"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "tool"
  - "shell"
  - "api"
related:
  - "[[shell-commands]]"
  - "[[gemini-cli]]"
sources: ["4. Execute shell commands.md"]
---

# run_shell_command Tool

The `run_shell_command` tool is the internal mechanism that allows Gemini CLI to execute shell commands programmatically. When the AI needs to perform system operations, it invokes this tool with the command and parameters.

## Usage Pattern

The tool is used internally by the AI when processing prompts that require command execution. For example:

1. User requests: "Run the unit tests"
2. AI invokes: `run_shell_command('npm test')`
3. User sees confirmation prompt
4. Upon approval, command executes

## Tool Parameters

The tool accepts:

- **Command:** The shell command string to execute
- **Working directory:** Optional directory context
- **Timeout:** Optional time limit for command completion
- **Environment:** Optional environment variables

## Integration with Safety Features

The `run_shell_command` tool works with [[confirmation-prompts]]—every invocation triggers user approval before execution. When [[sandboxing]] is enabled, the tool executes commands inside Docker containers.

## Relationship to User Commands

The `!` prefix and [[shell-mode]] provide direct shell access to users. The `run_shell_command` tool is the equivalent mechanism available to the AI agent for autonomous operation.