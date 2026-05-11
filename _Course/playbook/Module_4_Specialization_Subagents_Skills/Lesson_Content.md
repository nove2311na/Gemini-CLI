# Module 4: Specialization with Subagents & Skills

## 1. Learning Objectives
By the end of this module, students will be able to:
- **[Understand]** Explain the benefits of subagent delegation for context management and task specialization.
- **[Apply]** Invoke built-in subagents (`@codebase_investigator`, `@generalist`) and skills using the correct syntax.
- **[Create]** Develop custom Agent Skills with bundled scripts and clear `SKILL.md` instructions.
- **[Create]** Define and configure custom subagents using Markdown and YAML frontmatter.

---

## 2. Subagents: The Specialist Force
Subagents are specialized instances of the AI that handle specific tasks in isolated context loops. This prevents your main conversation from becoming cluttered and saves tokens.

### Built-in Specialists
1. **Codebase Investigator (`codebase_investigator`):** Best for reverse-engineering and mapping dependencies.
2. **Generalist (`generalist`):** Ideal for batch file edits or tasks that produce massive terminal output.
3. **CLI Help (`cli_help`):** Your expert for Gemini CLI configuration and commands.
4. **Browser Agent (`browser_agent`):** Automates web tasks (filling forms, extracting data) using Chrome.

### Delegation Syntax
- **Automatic:** The main agent chooses a subagent based on its description.
- **Explicit:** `@subagent_name <prompt>` (e.g., `@codebase_investigator How does the router work?`)

---

## 3. Extending with Agent Skills
Skills are "plug-and-play" expertise. They provide the agent with specific instructions and tools when a task matches the skill's description.

### The SKILL.md Structure
Located in `.gemini/skills/<skill-name>/SKILL.md`:
```markdown
---
name: my-skill
description: Expertise in XYZ. Use when user asks about A.
---
# Instructions
When active, you MUST do B and C.
```

### Activation Flow
1. **Discovery:** CLI finds the folder.
2. **Matching:** User prompt matches the `description`.
3. **Activation:** CLI calls `activate_skill`.
4. **Consent:** User approves the new instructions.

---

## 4. Creating Custom Subagents
Custom subagents allow for total control over persona, model, and tool access.

### Definition File (`.gemini/agents/auditor.md`)
```markdown
---
name: security-auditor
description: Finds vulnerabilities in code.
tools: [read_file, grep_search]
model: gemini-3-flash-preview
---
You are a Security Auditor. Focus on SQL injection and hardcoded keys.
```

### Key Technical Constraints
- **Isolation:** Subagents have an independent history.
- **Recursion Protection:** Subagents **cannot** call other subagents.
- **Tool Selection:** You can limit a subagent to specific tools (e.g., read-only) via the `tools` array in YAML.

---

## 5. Subagent-Specific Policies
You can grant high-privilege permissions *only* to a specific subagent.
```toml
[[rules]]
name = "Allow pr-creator to push"
subagent = "pr-creator"
action = "allow"
toolName = "run_shell_command"
commandPrefix = "git push"
```

---

## 6. Case Study: The "Security Auditor"
**Scenario:** A team wants to audit their code for secrets without giving the AI full shell access.
**Solution:**
1. Create `security-auditor.md` with `tools: [read_file, grep_search]`.
2. The auditor can search and read code but cannot run `npm install` or `rm -rf`.
3. Invoke: `@security-auditor Scan @src/ for hardcoded API keys.`

---

## 7. Comparison: Subagents vs. Agent Skills
| Feature | Subagents | Agent Skills |
| :--- | :--- | :--- |
| **Context** | Isolated (New turn loop) | Shared (Injects instructions) |
| **Persona** | Full independent persona | Behavioral modification |
| **Tools** | Can have unique toolsets | Typically uses existing tools |
| **Best For** | Heavy research, Batch tasks | Guiding the main agent's style |

---

## Citations
- Source: [Subagents Documentation](Clippings/III. Features/III. 15. Subagents.md)
- Source: [Agent Skills Tutorial](Clippings/II. Use Gemini CLI/2. Get started with Agent Skills.md)
