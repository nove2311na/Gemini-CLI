# Hands-on Lab: Module 4

## Overview
- **Type:** Specialization & Customization
- **Target Audience:** Power Users
- **Time Estimate:** 30 Minutes

---

## Level 1: Basic - Using Built-in Subagents
**Objective:** Leverage specialized agents for research.

1. Launch `rtk gemini`.
2. Use the `@` syntax to map your project:
   ```none
   @codebase_investigator List all components that depend on 'auth-service'.
   ```
3. Observe how the investigator uses multiple turns and tools to answer.
4. Ask a CLI question:
   ```none
   @cli_help How do I enable the browser agent?
   ```

---

## Level 2: Intermediate - Creating a Skill
**Objective:** Use the `skill-creator` to build a custom capability.

1. Launch `rtk gemini`.
2. Ask Gemini to create a new skill:
   ```none
   Create a new skill called 'style-guide' that ensures all code uses 2-space indentation and functional components.
   ```
3. Verify the skill was created by checking `.gemini/skills/style-guide/SKILL.md`.
4. Run `/skills reload` and then try to use it:
   ```none
   Refactor @calc.js using my style-guide.
   ```

---

## Level 3: Challenge - Custom Subagent Implementation
**Objective:** Manually define and invoke a specialized subagent.

1. Create a file `.gemini/agents/mini-coder.md`:
   ```markdown
   ---
   name: mini-coder
   description: Writes extremely compact, one-line functions.
   tools: [write_file]
   ---
   You are MiniCoder. You only write code in one line. No explanations.
   ```
2. In the CLI, run `/agents reload`.
3. Invoke your new agent:
   ```none
   @mini-coder Write a function to calculate factorial.
   ```
4. Observe the tool isolation (it can only use `write_file`).

---

## Troubleshooting
- **Subagent not found:** Ensure the `.md` file has valid YAML frontmatter and is in the correct directory (`.gemini/agents/`).
- **Skill not activating:** Check if your folder is trusted using `/trust`.
- **Recursion Error:** Remember subagents cannot call other subagents.

---

## Citations
- Source: [Subagents Documentation](Clippings/III. Features/III. 15. Subagents.md)
- Source: [Agent Skills Tutorial](Clippings/II. Use Gemini CLI/2. Get started with Agent Skills.md)
