---
type: concept
title: "Skill Discovery Tiers"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "skill-discovery"
  - "skill-loading"
  - "discovery-tiers"
related:
  - "[[agent-skills]]"
  - "[[skill-triggering]]"
  - "[[skill-development]]"
sources: ["3. Creating Agent Skills.md"]
---

# Skill Discovery Tiers

Gemini CLI discovers skills from four locations with a specific order of precedence. Higher tiers override lower tiers when duplicate skill names exist, enabling workspace-specific customizations to take priority.

## Tier Order (Lowest to Highest Precedence)

### 1. Built-in Skills
Skills included with the Gemini CLI installation. These are pre-approved and available in every session. Built-in skills provide core functionality that the CLI depends on.

**Location**: Internal CLI package directory

### 2. Extension Skills
Skills bundled within installed [[gemini-cli-extensions|Gemini CLI extensions]]. Extensions can package one or more skills alongside other extension components like prompts and commands.

**Location**: Within extension package directories

### 3. User Skills
Skills available across all workspaces for the current user. These enable personal skills that persist regardless of which project you're working in.

**Locations**:
- `~/.gemini/skills/`
- `~/.agents/skills/` (alias)

### 4. Workspace Skills
Skills specific to the current project directory. These take highest precedence, allowing project-specific customizations to override user-level and built-in skills.

**Locations**:
- `.gemini/skills/`
- `.agents/skills/` (alias)

## Discovery Aliases

The `.agents/skills` directory name serves as a compatibility alias for `.gemini/skills`. This alias enables skills to work with other AI agent tools that follow the [Agent Skills](https://agentskills.io/) standard, promoting cross-platform portability.

## Precedence Behavior

When multiple skills with the same name exist across tiers:
- The highest precedence tier's skill takes effect
- Workspace skills override user skills
- User skills override extension skills
- Extension skills override built-in skills

This hierarchy ensures that teams can establish project-specific conventions while still benefiting from personal and shared skill libraries.

## Practical Implications

- **Debugging**: If a skill isn't working as expected, check if a higher-tier skill is shadowing it
- **Customization**: Place customizations in workspace skills to ensure they take priority
- **Sharing**: For skills intended to be universal, distribute via extensions or user skills directories

## See Also

- [[agent-skills]] — The broader concept of extensible expertise modules
- [[skill-triggering]] — How descriptions activate skills once discovered
- [[skill-development]] — How to create and package skills for discovery
- [[extensions]] — How extensions bundle skills