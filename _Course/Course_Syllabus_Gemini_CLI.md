# Course Syllabus: Gemini CLI Mastery

**Course Overview:**
This comprehensive course is designed to take users from terminal beginners to Gemini CLI power users. It covers installation, core workflows, advanced task planning, subagent delegation, and custom configuration, all while maintaining a focus on technical accuracy and pedagogical best practices.

**Target Audience:** Developers, DevOps Engineers, and Power Users looking to integrate AI into their local terminal workflows.
**Pedagogical Framework:** Bloom's Taxonomy (Remember, Understand, Apply, Analyze, Evaluate, Create).

---

## Module 1: Introduction & Environment Setup
**Learning Objectives:**
By the end of this module, students will be able to:
- **[Remember]** State the primary functions and capabilities of Gemini CLI.
- **[Understand]** Describe the authentication process and account requirements for Google services.
- **[Apply]** Successfully install and authenticate Gemini CLI on their local machine.

**Lessons:**
1. **What is Gemini CLI?** (Source: `Clippings/I. Get started/1. Gemini CLI documentation.md`)
2. **Installation and Releases** (Source: `Clippings/I. Get started/3. Gemini CLI installation, execution, and releases.md`)
3. **Authentication Methods** (Source: `Clippings/I. Get started/4. Gemini CLI authentication setup.md`)
4. **Model Selection: Pro vs. Flash** (Source: `Clippings/I. Get started/6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md`)

**Hands-on Practice:**
- Install Gemini CLI using `npm`.
- Authenticate via Google Sign-in.
- Verify the setup by running `gemini --version` and checking model stats with `/stats model`.

---

## Module 2: Core Workflows & Command Mastery
**Learning Objectives:**
By the end of this module, students will be able to:
- **[Understand]** Explain how Gemini CLI interacts with the local file system and shell safely.
- **[Apply]** Execute core commands for file manipulation, codebase analysis, and data transformation.
- **[Analyze]** Determine the most efficient way to prompt for complex file-based tasks.

**Lessons:**
1. **File Management and Visual Analysis** (Source: `Clippings/II. Use Gemini CLI/1. File management with Gemini CLI.md`)
2. **Shell Command Execution & Safety** (Source: `Clippings/II. Use Gemini CLI/4. Execute shell commands.md`)
3. **Context Management: .geminiignore and History** (Source: `Clippings/II. Use Gemini CLI/3. Manage context and memory.md`)

**Hands-on Practice:**
- Prompt Gemini to rename a directory of files based on their contents.
- Use Gemini to clone a repository, read its source code, and explain the main logic.
- Merge two local datasets (CSV or JSON) into a single file using a natural language prompt.

---

## Module 3: Advanced Task Planning & Steering
**Learning Objectives:**
By the end of this module, students will be able to:
- **[Understand]** Explain the Research-Strategy-Execution lifecycle within Plan Mode.
- **[Apply]** Utilize Plan Mode to architect and implement multi-step software solutions.
- **[Analyze]** Employ real-time "model steering" to correct and guide the agent during the planning phase.

**Lessons:**
1. **The Architecture of Plan Mode** (Source: `Clippings/III. Features/III. 14. Plan Mode.md`)
2. **Real-time Steering and Hints** (Source: `Clippings/II. Use Gemini CLI/7. Use Plan Mode with model steering for complex tasks.md`)
3. **Project Context: The Role of GEMINI.md** (Source: `Clippings/IV. Configuration/5. Project context (GEMINI.md).md`)

**Hands-on Practice:**
- Start a `/plan` for a new feature implementation.
- Provide "hints" while the agent is researching to point it toward specific directories.
- Refactor the agent's proposed strategy mid-turn using steering commands.

---

## Module 4: Specialization with Subagents & Skills
**Learning Objectives:**
By the end of this module, students will be able to:
- **[Understand]** Contrast the roles and context windows of built-in subagents.
- **[Apply]** Delegate specialized tasks using the `@subagent` syntax to optimize context usage.
- **[Create]** Define and configure a custom subagent with a unique persona and toolset.

**Lessons:**
1. **Built-in Specialists: Investigator, Help, and Generalist** (Source: `Clippings/III. Features/III. 15. Subagents.md`)
2. **Extending with Agent Skills** (Source: `Clippings/II. Use Gemini CLI/2. Get started with Agent Skills.md`)
3. **Creating Custom Subagents (Markdown + YAML)** (Source: `Clippings/III. Features/III. 15. Subagents.md`)

**Hands-on Practice:**
- Use `@codebase_investigator` to map out class relationships in a project.
- Create a custom subagent file in `.gemini/agents/` for a specific task (e.g., Security Auditor).
- Grant specific tools to a subagent using wildcards in the YAML frontmatter.

---

## Module 5: Customization & Security Guardrails
**Learning Objectives:**
By the end of this module, students will be able to:
- **[Understand]** Describe the hierarchy of configuration (Settings vs. Project vs. Policy).
- **[Apply]** Create custom commands and personalize the CLI theme.
- **[Evaluate]** Configure sandboxing and trusted folder policies to ensure safe execution.

**Lessons:**
1. **Custom Commands and Aliases** (Source: `Clippings/IV. Configuration/1. Custom commands.md`)
2. **Global & Project Settings** (Source: `Clippings/IV. Configuration/6. Settings.md`)
3. **Security: Sandboxing and the Policy Engine (TOML)** (Source: `Clippings/III. Features/III. 18. Sandboxing in Gemini CLI.md`)
4. **Themes and Visual Customization** (Source: `Clippings/IV. Configuration/8. Themes.md`)

**Hands-on Practice:**
- Define a custom command that automates a daily development task.
- Configure a project-specific theme in `settings.json`.
- Create a policy rule in `policy.toml` to restrict certain shell commands to specific subagents.

---

## Module 6: Automation & The Ecosystem
**Learning Objectives:**
By the end of this module, students will be able to:
- **[Understand]** Explain the Model Context Protocol (MCP) and how it integrates external tools.
- **[Apply]** Configure and manage MCP servers for specialized data access.
- **[Apply]** Execute automated, non-interactive workflows using Headless Mode.

**Lessons:**
1. **MCP Server Integration** (Source: `Clippings/II. Use Gemini CLI/9. Set up an MCP server.md`)
2. **Headless Mode for CI/CD and Automation** (Source: `Clippings/II. Use Gemini CLI/10. Automate tasks with headless mode.md`)
3. **Observability and OpenTelemetry** (Source: `Clippings/III. Features/III. 20. Observability with OpenTelemetry.md`)

**Hands-on Practice:**
- Connect a local MCP server to the Gemini CLI and use its tools.
- Run a batch operation in headless mode and output the results to a file.
- Inspect token usage and costs for a complex session.

---

## Module 7: Human-AI Collaboration & Agent Orchestration
**Learning Objectives:**
By the end of this module, students will be able to:
- **[Understand]** Explain the Human-AI Partnership Model (Judgment vs. Execution).
- **[Apply]** Implement "Graduated Autonomy" strategies to safely increase agent independence.
- **[Analyze]** Identify "Low-Precision" tasks suitable for immediate automation.
- **[Evaluate]** Transition from a "doer" role to an "Agent Orchestrator" managing a personal agent portfolio.

**Lessons:**
1. **The Human-AI Partnership Model** (Source: `Clippings/AI Agents Playbook.md`)
2. **Strategy for Automation: Low-Precision vs. High-Precision** (Source: `Clippings/AI Agents Playbook.md`)
3. **Implementing Graduated Autonomy** (Source: `Clippings/AI Agents Playbook.md`)
4. **The Agent Orchestrator Career Path** (Source: `Clippings/AI Agents Playbook.md`)

**Hands-on Practice:**
- Audit your current workflow to identify 3 "Low-Precision" tasks for agent automation.
- Design an approval gate workflow for a social media content distribution agent.
- Draft a personal "AI Staff" portfolio for your specific professional role.
