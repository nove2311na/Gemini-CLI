# Hands-on Lab: Module 5

## Overview
- **Type:** Customization & Security
- **Target Audience:** DevOps & Lead Developers
- **Time Estimate:** 30 Minutes

---

## Level 1: Basic - Creating a Global Shortcut
**Objective:** Save a reusable prompt as a custom command.

1. Create the user commands directory:
   ```bash
   !mkdir -p ~/.gemini/commands
   ```
2. Create a file `~/.gemini/commands/explain-package.toml`:
   ```toml
   prompt = "Explain the dependencies and scripts in this file: @{package.json}"
   description = "Explains the local package.json file."
   ```
3. Launch `rtk gemini` and run your new command:
   ```none
   /explain-package
   ```

---

## Level 2: Intermediate - Project Theming
**Objective:** Customize the CLI UI for a specific project.

1. Create a `.gemini/settings.json` file in your project root.
2. Add a custom theme definition (refer to Lesson Content).
3. Set the active theme to your custom name:
   ```json
   {
     "ui": {
       "theme": "MyCustomTheme"
     }
   }
   ```
4. Restart the CLI and observe the color changes.

---

## Level 3: Challenge - Enforcing Security Policies
**Objective:** Restrict shell command execution using the Policy Engine.

1. Identify your user policy directory (typically `~/.gemini/policies/`).
2. Create a file `block-git-push.toml`:
   ```toml
   [[rule]]
   toolName = "run_shell_command"
   commandPrefix = "git push"
   decision = "deny"
   deny_message = "Automated git push is disabled for safety."
   priority = 500
   ```
3. In `rtk gemini`, try to run:
   ```bash
   !git push origin main
   ```
4. Verify that the command is blocked with your custom message.

---

## Troubleshooting
- **Command not listing:** Ensure the file extension is `.toml` and the syntax is valid. Run `/commands reload`.
- **Sandbox fails to start:** If using Docker, ensure the daemon is running (`rtk docker ps`).
- **Policy not applying:** Check the `priority` field. Higher numbers take precedence.

---

## Citations
- Source: [Custom Commands Reference](Clippings/IV. Configuration/1. Custom commands.md)
- Source: [Sandboxing Documentation](Clippings/III. Features/III. 18. Sandboxing in Gemini CLI.md)
