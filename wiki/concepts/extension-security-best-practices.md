---
type: concept
title: "Extension Security Best Practices"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensions"
  - "security"
  - "least-privilege"
  - "input-validation"
related:
  - "[[gemini-cli-extensions]]"
  - "[[gemini-extension-manifest]]"
  - "[[sandboxing]]"
sources: ["3. Gemini CLI extension best practices.md"]
---

# Extension Security Best Practices

Extensions run code on the user's machine with access to their files, system, and potentially sensitive data. Following security best practices protects users from unintended actions.

## Principle of Least Privilege

Request only the permissions your MCP server needs to function. Avoid giving the model broad access if restricted tools are sufficient.

### Why This Matters

The AI model may generate tool calls based on user requests. If an extension has broad permissions, the model could potentially trigger actions the user didn't intend or expect.

### Practical Application

- Only request filesystem permissions for directories your extension actually needs
- Avoid granting shell command access unless essential
- Use the minimum set of tools required for your extension's functionality

## Restricting Dangerous Tools

Use the `excludeTools` field in `gemini-extension.json` to block dangerous tools:

```json
{
  "name": "my-safe-extension",
  "excludeTools": ["run_shell_command(rm -rf *)"]
}
```

This ensures the CLI blocks dangerous commands even if the model attempts to execute them.

### Tools to Consider Excluding

| Tool | Risk | Recommendation |
|------|------|----------------|
| `run_shell_command` | Arbitrary code execution | Exclude or restrict |
| `delete_file` | Accidental deletion | Restrict to specific paths |
| `write_to_file` | Overwriting important files | Consider read-only alternatives |

## Input Validation

Your MCP server runs on the user's machine. Always validate tool inputs to prevent arbitrary code execution or unauthorized filesystem access.

### Path Validation Example

```typescript
import * as path from 'path';

function validatePath(inputPath: string, allowedDir: string): boolean {
  const resolved = path.resolve(inputPath);
  const allowed = path.resolve(allowedDir) + path.sep;
  
  if (!resolved.startsWith(allowed)) {
    throw new Error('Access denied: path outside allowed directory');
  }
  
  return true;
}
```

### Validation Principles

- Validate all inputs before processing
- Use allowlists where possible
- Reject unexpected input patterns
- Log security-relevant events

## Sensitive Settings Management

If your extension requires API keys or other secrets, use the `sensitive: true` option in the manifest:

```json
"settings": [
  {
    "name": "API Key",
    "envVar": "MY_API_KEY",
    "sensitive": true
  }
]
```

When marked as sensitive:
- Keys are stored in the system keychain
- Values are obfuscated in CLI output
- Users are prompted securely for input

## Security Checklist

- [ ] Request only necessary permissions
- [ ] Exclude dangerous tools via `excludeTools`
- [ ] Validate all user inputs and file paths
- [ ] Mark API keys and secrets as `sensitive: true`
- [ ] Test with edge case inputs
- [ ] Document any security-relevant constraints

## Related Concepts

- [[gemini-cli-extensions]] — The extension system being secured
- [[gemini-extension-manifest]] — Manifest fields for security configuration
- [[sandboxing]] — General isolation philosophy
- [[run-shell-command-tool]] — Tool that often needs restriction