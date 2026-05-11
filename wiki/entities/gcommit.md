---
type: entity
title: "gcommit"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "shell-function"
  - "git"
  - "automation"
  - "conventional-commits"
related:
  - "[[headless-mode]]"
  - "[[gemini-cli]]"
  - "[[stdout-piping]]"
sources: ["10. Automate tasks with headless mode.md"]
---

# gcommit

`gcommit` is a custom shell function that wraps [[gemini-cli]] to automatically generate git commit messages for staged changes. It demonstrates the "wrapper pattern" for building custom AI-powered command-line tools.

## Overview

The function retrieves staged changes with `git diff --staged`, pipes them to Gemini CLI in [[headless-mode]], and uses the generated message to create a commit. It produces Conventional Commit-formatted messages automatically.

## macOS/Linux Implementation (Bash/Zsh)

```bash
function gcommit() {
  # Get the diff of staged changes
  diff=$(git diff --staged)
  if [ -z "$diff" ]; then
    echo "No staged changes to commit."
    return 1
  fi
  # Ask Gemini to write the message
  echo "Generating commit message..."
  msg=$(echo "$diff" | gemini -p "Write a concise Conventional Commit message for this diff. Output ONLY the message.")
  # Commit with the generated message
  git commit -m "$msg"
}
```

## Windows PowerShell Implementation

```powershell
function gcommit {
  # Get the diff of staged changes
  $diff = git diff --staged
  if (-not $diff) {
    Write-Host "No staged changes to commit."
    return
  }
  # Ask Gemini to write the message
  Write-Host "Generating commit message..."
  $msg = $diff | gemini -p "Write a concise Conventional Commit message for this diff. Output ONLY the message."
  # Commit with the generated message
  git commit -m "$msg"
}
```

## How It Works

1. **Retrieves staged changes**: `git diff --staged` gets the diff of files ready to commit
2. **Validates input**: Checks that there are actually staged changes before proceeding
3. **Pipes to Gemini**: Sends the diff to Gemini CLI for message generation
4. **Executes commit**: Uses the generated message to complete the git commit

## Installation

### macOS/Linux

1. Add the function to `~/.zshrc` (Zsh) or `~/.bashrc` (Bash)
2. Source the file: `source ~/.zshrc`
3. Use with `gcommit`

### Windows PowerShell

1. Add the function to your PowerShell profile: `notepad $PROFILE`
2. Source the profile: `. $PROFILE`
3. Use with `gcommit`

## Key Patterns Demonstrated

- **Wrapper pattern**: Wrapping CLI commands to add AI capabilities
- **stdin/stdout piping**: Passing data through the tool chain
- **Headless mode**: Non-interactive execution for automation
- **Output capture**: Using command substitution to capture output

## See Also

- [[headless-mode]] for the execution mode
- [[stdout-piping]] for the piping mechanism
- [[json-output-format]] for structured output alternatives