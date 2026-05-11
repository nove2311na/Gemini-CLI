---
type: concept
title: "Discovery Tiers"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "agent-skills"
  - "precedence"
  - "skill-resolution"
  - "skill-discovery"
related:
  - "[[agent-skills]]"
  - "[[agent-skills-management]]"
sources: ["1. Agent Skills.md", "4. Managing Agent Skills.md"]
---

# Discovery Tiers

Discovery tiers define the precedence system that Gemini CLI uses to locate and select Agent Skills. When multiple skills with the same name exist in different locations, the discovery tier hierarchy determines which version takes priority.

## Tier Hierarchy

Skills are discovered from four locations, ordered from lowest to highest precedence:

### 1. Built-in Skills (Lowest Precedence)

Built-in Skills ship with the Gemini CLI installation and provide baseline capabilities that are always available. These skills cover common development scenarios and serve as the foundation upon which additional expertise can be layered. Built-in skills have the lowest precedence, meaning user-installed or workspace-specific skills will always override them when names conflict.

### 2. Extension Skills

Extension Skills are bundled within installed extensions. When an extension is installed, its contained skills become available through this tier. This allows extension authors to package both tooling capabilities and specialized knowledge together. Extension skills have second-lowest precedence and can be overridden by user or workspace skills.

### 3. User Skills

User Skills are installed globally to the user's home directory, typically at `~/.gemini/skills/` or the equivalent `~/.agents/skills/` path. These skills are available across all projects and work directories on the system. User skills take precedence over built-in and extension skills, making them suitable for personal tooling and frequently-used expertise.

### 4. Workspace Skills (Highest Precedence)

Workspace Skills are project-specific skills stored in `.gemini/skills/` or `.agents/skills/` within the current working directory. These have the highest precedence and override all other tiers when names conflict. Workspace skills enable project-specific configurations, team-shared expertise, and development overrides.

## Conflict Resolution

When multiple discovery locations contain skills with identical names, the skill from the highest-precedence tier is selected. For example:

- If `debugging` exists as both a built-in skill and a workspace skill, the workspace version is used
- If `testing` exists in both user and workspace scopes, the workspace version takes priority

This behavior enables several patterns:

- **Project overrides** — Teams can establish project-specific skill versions that take precedence over personal defaults
- **Development copies** — Creating a local workspace skill with the same name as a built-in allows for testing modifications
- **Progressive enhancement** — Base skills at lower tiers can be progressively refined at higher tiers

## Installation Scope Alignment

The skill discovery tiers map directly to installation scope options. When installing a skill, the `--scope` flag determines which tier receives the new skill:

| Scope Flag | Target Location | Discovery Tier |
|------------|-----------------|----------------|
| (default) | `~/.gemini/skills/` | User Skills |
| `--scope workspace` | `.gemini/skills/` | Workspace Skills |

Skills installed via extensions automatically populate the Extension Skills tier regardless of scope flags.

## Path Aliases

Both user and workspace skill locations support dual path conventions: `.gemini/` and `.agents/`. These aliases appear to serve compatibility or migration purposes, allowing skills to be organized under either naming convention without functional difference.