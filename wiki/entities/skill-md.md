---
type: entity
title: "SKILL.md"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "skill-format"
  - "skill-packaging"
  - "extensions"
related:
  - "[[extensions]]"
  - "[[auto-memory]]"
  - "[[skill-mining]]"
  - "[[GEMINI.md]]"
sources: ["III. 3. Auto Memory.md"]
---

# SKILL.md

SKILL.md is the file format used to define reusable Agent Skills in Gemini CLI. When Auto Memory extracts a recurring workflow pattern from session history, it outputs the pattern as a draft `SKILL.md` file for user review.

## File Format

SKILL.md files follow the skill packaging format defined in the [[extensions]] system. They contain structured metadata and instructional content that tells the Gemini CLI agent how to apply the skill in relevant contexts.

## Lifecycle in Auto Memory

1. **Draft creation** — Confucius sub-agent drafts SKILL.md files in the project inbox
2. **User review** — User inspects each draft via `/memory inbox` command
3. **Promotion** — User promotes approved skills to user scope (`~/.gemini/skills/`) or workspace scope (`.gemini/skills/`)
4. **Discovery** — Promoted skills become discoverable and can be activated in future sessions

## Promotion and Discovery

Once promoted, skills follow the standard skill discovery precedence rules. They become available to the agent's context machinery and can be automatically activated when relevant tasks are detected. Skills in the user scope are available across all projects, while workspace-scoped skills are specific to individual projects.

## Relationship to GEMINI.md

SKILL.md and [[GEMINI.md]] are complementary memory formats. GEMINI.md captures single facts or context snippets, while SKILL.md captures multi-step procedures and workflow patterns. Auto Memory focuses on extracting SKILL.md content, while the `save_memory` tool populates GEMINI.md files.