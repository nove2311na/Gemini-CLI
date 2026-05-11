# Hands-on Lab: Module 2

## Overview
- **Type:** Workflow Mastery
- **Target Audience:** Developers
- **Time Estimate:** 20 Minutes

---

## Level 1: Basic - Context Inclusion
**Objective:** Learn to provide specific file context to the agent.

1. Launch `rtk gemini` in a project directory.
2. Ask Gemini to summarize a specific file using the `@` symbol:
   ```none
   Summarize the logic in @package.json
   ```
3. Ask it to find a specific string across the project:
   ```none
   Find where the string "scripts" is used in this project.
   ```

---

## Level 2: Intermediate - Code Modification & Shell Use
**Objective:** Edit a file and run a test.

1. Create a dummy file `calc.js`:
   ```bash
   !echo "function add(a, b) { return a + b; }" > calc.js
   ```
2. Prompt Gemini to modify it:
   ```none
   Add a subtract function to @calc.js
   ```
3. Review the diff and press `y`.
4. Run a shell command to verify:
   ```bash
   !rtk ls -l calc.js
   ```

---

## Level 3: Challenge - Automation Loop
**Objective:** Perform a complex multi-step task autonomously.

1. Create a failing test file `calc.test.js`:
   ```bash
   !echo "if (add(1, 2) !== 4) throw new Error('Add failed');" > calc.test.js
   ```
2. Prompt Gemini to fix the test by modifying the source:
   ```none
   Run the test @calc.test.js using `node calc.test.js`. If it fails, fix the code in @calc.js to make it pass.
   ```
3. Watch as Gemini runs the command, identifies the error, proposes a fix, and verifies it.

---

## Troubleshooting
- **File not found:** Double-check your relative paths. Gemini CLI uses the current working directory as the root.
- **Permission Denied:** Ensure you have write permissions to the directory.
- **Diff is empty:** Ensure your prompt explicitly asks for a change.

---

## Citations
- Source: [File Management Guide](Clippings/II. Use Gemini CLI/1. File management with Gemini CLI.md)
- Source: [Shell Commands Tutorial](Clippings/II. Use Gemini CLI/4. Execute shell commands.md)
