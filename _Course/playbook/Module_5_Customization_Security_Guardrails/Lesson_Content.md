# Module 5: Customization & Security Guardrails

## 1. Learning Objectives
By the end of this module, students will be able to:
- **[Understand]** Describe the configuration hierarchy (User vs. Project) and the role of the Policy Engine.
- **[Apply]** Create custom commands with dynamic argument injection (`{{args}}`, `!{...}`, `@{...}`).
- **[Evaluate]** Configure sandboxing methods (macOS Seatbelt, Docker) and trusted folder policies.
- **[Create]** Define custom visual themes using JSON schema.

---

## 2. Custom Commands: Personal Shortcuts
Custom commands allow you to reuse complex prompts. They are defined in `.toml` files.

### Locations & Precedence
1. **User (Global):** `~/.gemini/commands/`
2. **Project (Local):** `<project>/.gemini/commands/` (Overrides Global)

### Dynamic Injection Syntax
- **`{{args}}`:** Replaced by user-typed arguments. Shell-escaped when used inside `!{...}`.
- **`!{cmd}`:** Injects the output of a shell command into the prompt.
- **`@{path}`:** Injects the content of a file or directory.

**Example (`git:fix.toml`):**
```toml
description = "Suggests a fix for staged changes"
prompt = """
Fix the following diff using the requirements: {{args}}
```diff
!{rtk git diff --staged}
```
"""
```

---

## 3. Security & Sandboxing
Sandboxing isolates AI operations (shell/file writes) from your host system.

### Sandboxing Methods
- **macOS Seatbelt:** Lightweight write-protection using `sandbox-exec`.
- **Docker/Podman:** Full process isolation inside a container. Highly recommended for untrusted code.
- **Windows Native:** Uses integrity levels (`icacls`) to restrict access.

### Enabling Sandbox
- **Command Flag:** `rtk gemini --sandbox`
- **Settings:** `"tools": { "sandbox": "docker" }` in `settings.json`.

---

## 4. The Policy Engine (TOML)
Fine-grained control over which tools can run in which environment.

### Rule Hierarchy
- **Tier 1:** Built-in system policies (Read-only).
- **Tier 2:** User policies (`~/.gemini/policies/*.toml`).
- **Tier 3:** Project policies (Requires workspace trust).

**Example Rule: Deny `rm -rf`**
```toml
[[rule]]
toolName = "run_shell_command"
commandPrefix = "rm -rf"
decision = "deny"
deny_message = "Deletion is forbidden in this workspace."
```

---

## 5. Themes & Visual Personalization
Customize the look of the CLI via `/theme` or `settings.json`.

### Custom JSON Themes
```json
{
  "ui": {
    "customThemes": {
      "Matrix": {
        "name": "Matrix",
        "type": "custom",
        "background": { "primary": "#000000" },
        "text": { "primary": "#00FF00" }
      }
    }
  }
}
```

---

## 6. Case Study: "Daily Recap" Command
**Scenario:** A developer wants a command that summarizes their work from the last 24 hours.
**Solution:**
Create `~/.gemini/commands/recap.toml`:
```toml
description = "Summarizes recent git activity"
prompt = """
Summarize my recent work based on these git logs:
!{rtk git log --since="24 hours ago" --oneline}

Highlight key technical changes.
"""
```
**Execution:** `/recap`

---

## 7. Comparison: Command Scopes
| Feature | User Commands | Project Commands |
| :--- | :--- | :--- |
| **Storage** | Home Directory | Repo Root |
| **Portability** | Available everywhere | Shared with team |
| **Overriding** | Can be overridden | Always takes precedence |
| **Trust** | Implicitly trusted | Subject to Policy Engine |

---

## Citations
- Source: [Custom Commands Reference](Clippings/IV. Configuration/1. Custom commands.md)
- Source: [Settings Guide](Clippings/IV. Configuration/6. Settings.md)
- Source: [Sandboxing Documentation](Clippings/III. Features/III. 18. Sandboxing in Gemini CLI.md)
- Source: [Themes Guide](Clippings/IV. Configuration/8. Themes.md)
