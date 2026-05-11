# Gemini CLI Mastery Project: The Command Center

Welcome to the ultimate workspace dedicated to mastering, documenting, and extending the **Gemini CLI**. This project is not just a repository of files; it is an active, agent-driven **Command Center** designed to turn raw technical documentation into actionable knowledge, educational courses, and powerful CLI extensions.

## 🌟 Vision & Manifesto

Our goal is to build a self-sustaining ecosystem where AI agents and human developers collaborate to understand the Gemini CLI deeply. By centralizing the "ground truth" documentation locally, we empower specialized AI skills to operate with absolute accuracy, zero hallucination, and maximum efficiency.

This workspace operates on **Five Core Pillars of Capability**:

### 1. 📚 The Living Knowledge Base (Wiki)
We transform fragmented documentation into a highly structured, Obsidian-ready Wiki.
* **Capability:** Automated ingestion and synthesis of raw markdown (`Clippings/`) into interconnected concept notes and workflow guides (`wiki/`).
* **Powered by:** The `wiki-synthesizer` skill.

### 2. 🎓 The Education Engine (Course Creation)
We break down complex technical concepts into digestible, progressive learning materials.
* **Capability:** Generating curriculums, lesson plans, hands-on tutorials, and slide decks tailored to different learning levels.
* **Powered by:** The `gemini-course-master` subagent, alongside `course-designer`, `teaching-resource-generator`, and `tutorial-engineer` skills.

### 3. 🚑 The Troubleshooting Hub
We provide an expert technical support environment for debugging CLI issues.
* **Capability:** Analyzing error logs, stack traces, and configuration files, then cross-referencing them against local official documentation to provide precise, step-by-step fixes and workarounds.
* **Powered by:** The `cli-troubleshooter` skill.

### 4. 🧪 The Extension Sandbox
We provide a safe laboratory for extending the Gemini CLI's capabilities.
* **Capability:** Designing, drafting, and testing custom Agent Skills, Subagents, MCP Servers, and Hooks in an isolated environment before deploying them to production projects.
* **Powered by:** Core development skills like `create-skill`, `create-agent`, and `skill-creator`.

### 5. 📢 The Publishing Pipeline
We turn technical updates into engaging community content.
* **Capability:** Transforming dry release notes, changelogs, and technical specs into engaging blog posts, newsletters, cheat sheets, and social media updates tailored to specific audiences.
* **Powered by:** The `tech-content-writer` skill.

## 🏛️ Project Architecture

* **`Clippings/`**: The absolute source of truth. Raw, local mirrors of official Gemini CLI documentation.
* **`wiki/`**: The synthesized brain. Structured markdown files with internal links.
* **`raw/`**: Unprocessed assets and source files waiting for ingestion.
* **`output/`**: The final deliverables (Master docs, generated courses, blog posts).
* **`.agents/skills/`**: The specialized, locally scoped capabilities that give this workspace its power.
* **`.gemini/subagents/`**: Dedicated subagents focused on specific overarching tasks.

## ⚡ High-Performance Execution

This project strictly enforces context-token optimization. By integrating the `rtk` CLI proxy, system shell commands (listing files, running linters, executing tests) are intelligently filtered to show only essential outputs (errors, warnings, or heuristic summaries). This ensures the agent's context window remains clean, fast, and focused on strategic work rather than parsing noisy logs.

---
*This Command Center is actively maintained and evolved. It represents a streamlined, highly-focused environment for human-AI collaboration within the Gemini CLI ecosystem.*