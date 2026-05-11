# Module 2: Core Workflows & Command Mastery

## 1. Learning Objectives
By the end of this module, students will be able to:
- **[Understand]** Explain the mechanism of context injection and how the agent interacts with the file system.
- **[Apply]** Use the `@` symbol to provide explicit file and directory context.
- **[Apply]** Execute and manage shell commands safely using the `!` prefix and Shell Mode.
- **[Analyze]** Optimize context usage by implementing `.geminiignore` and project-wide rules in `GEMINI.md`.

---

## 2. Context Injection: How Gemini "Sees" Your Code
Gemini CLI doesn't just "know" your code; it reads it on-demand. When you ask a question, the CLI injects the content of relevant files into the prompt sent to the model.

### Direct File Inclusion (`@` Syntax)
Forcing context ensures the model has the exact information needed.
- **Single File:** `rtk gemini "Explain @src/auth.ts"`
- **Multiple Files:** `rtk gemini "Refactor @src/ui.tsx to use types from @src/types.ts"`
- **Directory:** `rtk gemini "Review all files in @src/utils/"` (Use with caution for large folders).

---

## 3. Command Mastery: Shell Integration

### Direct Execution (`!`)
Run one-off commands without leaving the CLI. The output is captured and added to the conversation context.
```bash
!rtk ls -la
!rtk git status
```

### Shell Mode
For heavy terminal work, enter Shell Mode by typing `!` and pressing **Enter**.
- **Exit:** Type `exit` or press `Esc`.

### Background Processes
You can ask Gemini to start servers or watchers:
- **Prompt:** `rtk gemini "Start the dev server in the background"`
- **Management:** Use `/shells` to view logs or terminate processes.

---

## 4. File Manipulation: Creating & Modifying
Gemini CLI uses two primary tools for file changes:
- **`write_file`:** Used for creating entirely new files or overwriting existing ones.
- **`replace`:** Used for surgical edits (insertions, deletions, replacements) in existing files.

### Safety Protocol: The Unified Diff
Before any change is applied, Gemini CLI displays a `diff`. 
- **y:** Confirm and apply.
- **n:** Cancel and refine prompt.

---

## 5. Context Hygiene & Efficiency

### .geminiignore
Prevents Gemini from reading sensitive or bulky files (e.g., `.env`, `node_modules`, large datasets).
```text
# Example .geminiignore
.env
dist/
*.log
```

### GEMINI.md (Project Context)
Automatically loaded at the start of every session. Use it to define team standards.
```markdown
# GEMINI.md
- Use TypeScript for all new logic.
- Prefer Vitest over Jest.
- Always add JSDoc comments to public functions.
```

---

## 6. Case Study: The "Find-Fix-Verify" Loop
**Scenario:** A developer needs to fix a bug in a component but doesn't know where it is.
**Solution:**
1. **Find:** `rtk gemini "Find the file that handles login validation."`
2. **Read:** `rtk gemini "Read @src/services/auth-validator.ts and find the bug."`
3. **Fix:** `rtk gemini "Update @src/services/auth-validator.ts to support 8-character passwords."`
4. **Verify:** `!rtk npm test src/services/auth-validator.test.ts`

---

## 7. Comparison: Direct Prompting vs. Shell Execution
| Feature | Natural Language Prompt | Shell Command (`!`) |
| :--- | :--- | :--- |
| **Effort** | Low (descriptive) | High (requires exact syntax) |
| **Context** | AI analyzes results | You interpret results |
| **Automation** | AI can loop and retry | Manual sequence |

---

## Citations
- Source: [File Management Guide](Clippings/II. Use Gemini CLI/1. File management with Gemini CLI.md)
- Source: [Shell Commands Tutorial](Clippings/II. Use Gemini CLI/4. Execute shell commands.md)
- Source: [Context & Memory Management](Clippings/II. Use Gemini CLI/3. Manage context and memory.md)
