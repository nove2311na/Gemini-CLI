---
type: concept
title: "Argument Injection"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "custom-commands"
  - "templating"
  - "security"
related:
  - "[[custom-commands]]"
  - "[[shell-injection]]"
  - "[[file-injection]]"
sources: ["1. Custom commands.md"]
---

# Argument Injection

Custom commands support two powerful methods for handling arguments. The CLI automatically chooses the correct method based on whether the command contains the `{{args}}` placeholder.

## Method 1: Context-Aware Injection with `{{args}}`

If your prompt contains the special placeholder `{{args}}`, the CLI replaces that placeholder with the text the user typed after the command name.

### Raw Injection (Outside Shell Commands)

When used in the main body of the prompt, arguments are injected exactly as the user typed them.

**Example:**
```toml
prompt = "Please provide a code fix for the issue described here: {{args}}."
```

Invoked via: `/git:fix "Button is misaligned"`

The model receives: `Please provide a code fix for the issue described here: "Button is misaligned".`

### Shell-Escaped Injection (Inside `!{...}` Blocks)

When `{{args}}` is used inside a shell injection block (`!{...}`), arguments are automatically shell-escaped before replacement. This prevents command injection vulnerabilities.

**Example:**
```toml
prompt = """
Please summarize the findings for the pattern `{{args}}`.

Search Results:
!{grep -r {{args}} .}
"""
```

Invoked via: `/grep-code It's complicated`

1. **Outside `!{...}`**: `{{args}}` is replaced raw with `It's complicated`
2. **Inside `!{...}`**: `{{args}}` is replaced with escaped version (`"It\'s complicated"` on Linux)
3. The CLI prompts for confirmation before execution
4. The final prompt is sent

## Method 2: Default Argument Handling

If your prompt does **not** contain `{{args}}`, the CLI uses default behavior:

- **With arguments**: `/mycommand arg1` → The full command is appended to the prompt, separated by two newlines
- **Without arguments**: `/mycommand` → The prompt is sent exactly as written

This enables a simpler syntax when advanced templating is not needed.