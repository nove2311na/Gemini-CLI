---
type: source
title: "Creating Agent Skills"
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/creating-skills/"
venue: "Gemini CLI Documentation"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensions"
  - "skill-development"
  - "agent-skills"
related:
  - "[[extensions]]"
  - "[[gemini-cli-extensions]]"
  - "[[session-management]]"
  - "[[agent-skills]]"
  - "[[skill-discovery-tiers]]"
  - "[[skill-triggering]]"
  - "[[skill-development]]"
sources: ["3. Creating Agent Skills.md"]
---

# Creating Agent Skills

This guide covers the complete workflow for creating and organizing agent skills in Gemini CLI. Agent skills extend the CLI with specialized expertise, procedural workflows, and task-specific resources that the model can access during conversations.

## Quickstart

The fastest way to create a skill is using the built-in `skill-creator` meta-skill. Simply describe the skill you want in natural language, and Gemini CLI will scaffold the directory structure, create the required `SKILL.md` file, and set up standard subdirectories (`scripts/`, `references/`, `assets/`).

## Manual Creation

Manual creation involves four steps: creating the directory structure, defining the `SKILL.md` file with YAML frontmatter, adding script resources, and testing the skill. The `SKILL.md` file is the only required component—everything else is optional but recommended for organizing resources.

The directory structure follows a standard pattern:
```text
my-skill/
├── SKILL.md       (Required)
├── scripts/       (Optional) Executable scripts
├── references/    (Optional) Static documentation
└── assets/        (Optional) Templates and resources
```

## Core Concepts

### Metadata and Triggers

The `SKILL.md` file uses YAML frontmatter for metadata:
- **`name`**: Unique identifier matching the directory name
- **`description`**: Critical field for automatic triggering—describes what tasks the skill handles and keywords that should activate it

### Discovery Tiers

Skills are discovered from four locations with precedence order (lowest to highest):
1. Built-in Skills (pre-approved)
2. Extension Skills (bundled within extensions)
3. User Skills (`~/.gemini/skills/` or `~/.agents/skills/`)
4. Workspace Skills (`.gemini/skills/` or `.agents/skills/`)

The `.agents/skills` alias provides compatibility with the agentskills.io standard.

### Packaging and Distribution

Skills can be shared via workspace directories (committed to repositories), extensions (bundled within Gemini CLI extensions), or standalone Git repositories installed via `gemini skills install <url>`.

## Development Scripts

Advanced developers can use core package scripts:
- `node scripts/init_skill.cjs <name> --path <dir>` — Initialize a new skill
- `node scripts/validate_skill.cjs <path/to/skill>` — Validate skill structure
- `node scripts/package_skill.cjs <path/to/skill>` — Create `.skill` zip file

Local development is supported via `gemini skills link .` for linking skills in separate directories.

## Key Workflow

```
Create skill directory → Define SKILL.md → Add scripts → Test via /skills command → Share via workspace/extension/git
```