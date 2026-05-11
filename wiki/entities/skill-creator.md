---
type: entity
title: "skill-creator"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "meta-skill"
  - "skill-development"
  - "tool"
related:
  - "[[agent-skills]]"
  - "[[skill-development]]"
  - "[[SKILL.md]]"
sources: ["2. Get started with Agent Skills.md", "3. Creating Agent Skills.md"]
---

# skill-creator

skill-creator is a built-in meta-skill that scaffolds new skills through guided interaction. It embodies the "use the tool to build the tool" pattern, allowing developers to create agent skills by describing them in natural language rather than manually creating files and directories.

## Overview

When invoked, skill-creator guides developers through designing, scaffolding, and validating new expertise. Rather than requiring manual file creation, developers simply describe the skill they want, and the meta-skill generates the complete structure.

## Usage

The skill-creator is activated by making a request like:

> "Create a new skill called 'code-reviewer' that analyzes local files for common errors and style violations."

When executed, skill-creator:
1. Generates a new directory for the skill
2. Creates a `SKILL.md` file with YAML frontmatter (`name` and `description`)
3. Creates standard resource directories: `scripts/`, `references/`, and `assets/`

## Location

Created skills are placed in `.gemini/skills/<skill-name>/` within the current workspace.

## See Also

- [[agent-skills]] — The broader concept of extensible expertise modules
- [[skill-development]] — Development workflows for creating and packaging skills
- [[SKILL.md]] — The required file format for skill definitions