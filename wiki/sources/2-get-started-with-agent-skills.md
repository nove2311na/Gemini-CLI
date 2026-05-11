---
type: source
title: "Get started with Agent Skills"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "agent-skills"
  - "tutorial"
related:
  - "[[agent-skills]]"
  - "[[skill-discovery]]"
  - "[[skill-activation]]"
  - "[[workspace-trust-model]]"
  - "[[skill-creator]]"
sources: ["2. Get started with Agent Skills.md"]
---

# Get started with Agent Skills

Agent Skills extend Gemini CLI with specialized expertise. This official tutorial covers how to create your first skill, bundle custom logic, and activate it during a session.

## Core Concepts

### Skill Structure

A skill is defined by a directory containing a `SKILL.md` file and optional subdirectories for scripts and reference materials. The `SKILL.md` file contains YAML frontmatter with required `name:` and `description:` fields, followed by instructions for the agent.

### Discovery Mechanism

Gemini CLI automatically discovers skills in `.gemini/skills/` or `.agents/skills/` directories. Skills are found at the root level or one directory deep—nesting beyond this is ignored. The `SKILL.md` filename must be exact (case-sensitive on Linux/macOS).

### Activation Flow

1. User triggers skill via natural language matching
2. Gemini identifies matching skill via `activate_skill` tool
3. User approval required via consent prompt
4. Execution proceeds with bundled resources

### Trust Model

Skills in `~/.gemini/skills/` (user scope) load unconditionally. Skills in `<workspace>/.gemini/skills/` require the workspace to be marked trusted via the `/trust` command.

## Example: API Auditor Skill

The tutorial creates an **api-auditor** skill that tests URL endpoints:

```
.gemini/skills/api-auditor/
  SKILL.md          # Definition with frontmatter + instructions
  scripts/
    audit.js        # Node.js script for deterministic testing
```

## Key Commands

- `/skills list` — Display discovered skills
- `/skills reload` — Refresh skill discovery without restart
- `/trust` — Mark workspace as trusted for workspace-scoped skills
- `gemini skills install <url-or-path>` — Install skill from URL or path
- `gemini skills link <path>` — Link local skill for development
- `gemini skills uninstall <name>` — Remove installed skill

## skill-creator Alternative

Instead of manual file creation, users can invoke the built-in `skill-creator` skill by asking Gemini to create a new skill with natural language. This handles directory structure and boilerplate automatically.

## Troubleshooting

The source documents five common failure modes:
1. Workspace trust missing for workspace-scoped skills
2. Path layout incorrect (files nested too deep)
3. Filename capitalization issues on case-sensitive filesystems
4. Frontmatter missing required fields or preceded by text
5. Name field vs directory name confusion

## Related Documentation

- [Creating Agent Skills](https://geminicli.com/docs/cli/creating-skills) — Advanced metadata and features
- [Using Agent Skills](https://geminicli.com/docs/cli/using-agent-skills) — Discovery and library management
- [Skill best practices](https://geminicli.com/docs/cli/skills-best-practices) — Design reliable skills