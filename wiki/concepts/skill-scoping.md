---
type: concept
title: "Skill Scoping"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "agent-skills"
  - "scoping"
  - "collaboration"
related:
  - "[[agent-skills]]"
  - "[[discovery-tiers]]"
  - "[[skills-command]]"
sources: ["1. Agent Skills.md"]
---

# Skill Scoping

Skill scoping defines whether [[agent-skills]] operate at the user level (global across all projects) or the workspace level (local to a specific project and shared via version control).

## Scope Types

### User Scope

User-scoped skills are stored in user home directory locations:
- `~/.gemini/skills/`
- `~/.agents/skills/` (alias, takes precedence)

**Characteristics:**
- Available across all projects for the current user
- Not shared with other team members
- Ideal for personal workflow optimizations and specialized expertise unique to the user
- Persists across machine sessions

### Workspace Scope

Workspace-scoped skills are stored in project directory locations:
- `.gemini/skills/`
- `.agents/skills/` (alias, takes precedence)

**Characteristics:**
- Local to the project directory
- Shared with team members via version control
- Ideal for team-wide processes and standardized workflows
- New team members automatically inherit team skills when they clone the repository

## Scope and Discovery Precedence

Scope interacts with [[discovery-tiers]] precedence:
- User scope skills (tier 3) are overridden by workspace scope skills (tier 4)
- This means team-standard skills in the workspace take precedence over individual user customizations

## Practical Use Cases

| Scenario | Recommended Scope |
|----------|------------------|
| Personal coding patterns | User |
| Team PR review process | Workspace |
| Custom debugging workflows | User |
| Shared deployment procedures | Workspace |
| Individual domain expertise | User |
| Standardized testing procedures | Workspace |

## Managing Scope via Commands

Use the `--scope` option with [[skills-command]] commands:

```bash
# Install user-scope skill (default)
gemini skills install https://github.com/user/personal-skill.git

# Install workspace-scope skill for team sharing
gemini skills install https://github.com/team/shared-skill.git --scope workspace

# Link local skills with specific scope
/skills link /path/to/skill --scope workspace
```

## Team Collaboration Workflow

1. Developer creates or identifies a valuable skill for team use
2. Skill is placed in `.gemini/skills/` directory within the project
3. Skill is committed to version control
4. Team members pulling the repository automatically receive the skill
5. All team members use the same standardized workflow

## Cross-Tool Compatibility

The `.agents/skills/` alias ensures skills remain compatible across different AI tools that support the same standard. This allows:
- Skills to be portable between tools
- Teams to standardize on skill definitions regardless of tool choice
- Skills to work with multiple AI coding assistants