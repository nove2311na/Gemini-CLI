---
type: concept
title: "Exit codes"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "automation"
  - "error-handling"
  - "CLI"
related:
  - "[[headless-mode]]"
  - "[[json-output]]"
  - "[[jsonl-streaming]]"
sources: ["III. 5. Headless mode reference.md"]
---

# Exit codes

Exit codes are standardized return values from Gemini CLI that indicate the result of headless execution. They enable robust error handling in scripts, automation pipelines, and CI/CD systems.

## Overview

When running in [[headless-mode]], Gemini CLI exits with a specific code that scripts can check using standard shell mechanisms like `$?` or conditionals in workflow files.

## Exit Code Reference

| Code | Meaning | Description |
|------|---------|-------------|
| `0` | Success | The command completed successfully |
| `1` | General error | API failure or other runtime error |
| `42` | Input error | Invalid prompt or arguments |
| `53` | Turn limit exceeded | Session reached maximum turns |

## Code Meanings

### 0 — Success

The command completed successfully and produced a valid response. This is the expected exit code for normal operation.

### 1 — General Error

A runtime error occurred during execution. This includes:
- API connection failures
- Authentication errors
- Unexpected exceptions
- Internal tool failures

Check stderr and [[json-output]] error fields for details.

### 42 — Input Error

The provided input was invalid. This memorable code (the "answer to everything") indicates:
- Malformed prompt
- Invalid arguments
- Missing required flags
- Conflicting options

Review the command syntax and ensure all required parameters are provided.

### 53 — Turn Limit Exceeded

The session reached the configured maximum number of turns. This happens when:
- Complex tasks require more interactions than allowed
- The turn limit was set too low
- Interactive debugging extends beyond limits

Consider increasing the turn limit or breaking the task into smaller steps.

## Usage in Scripts

### Bash

```bash
gemini -p "Analyze this codebase" --output-format json
if [ $? -eq 0 ]; then
    echo "Analysis complete"
else
    echo "Failed with code: $?"
fi
```

### CI/CD Pipeline (Generic YAML)

```yaml
- name: Run Gemini analysis
  run: gemini -p "Review changes" --output-format json
  continue-on-error: false

- name: Handle failure
  if: failure()
  run: echo "Exit code: ${{ steps.gemini.outputs.exit_code }}"
```

## Relationship with JSON Output

Exit codes complement structured output:
- **Exit code 0** — JSON contains valid `response` and `stats`
- **Exit code 1** — JSON contains `error` field with details
- **Exit code 42** — JSON contains `error` field with input validation details
- **Exit code 53** — JSON contains partial results if any were generated

## See Also

- [[headless-mode]] — Parent feature for programmatic execution
- [[json-output]] — Structured response format
- [[jsonl-streaming]] — Streaming format with error events