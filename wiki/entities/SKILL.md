---
type: entity
title: "SKILL.md"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "file-format"
  - "skill-development"
  - "yaml"
related:
  - "[[agent-skills]]"
  - "[[skill-development]]"
  - "[[skill-triggering]]"
  - "[[skill-discovery-tiers]]"
sources: ["3. Creating Agent Skills.md"]
---

# SKILL.md

SKILL.md is the required file that defines a skill's purpose, triggering conditions, and instructions for the agent. It combines YAML frontmatter for metadata with markdown content for operational instructions.

## Format

```markdown
---
name: skill-name
description: Expertise in [domain]. Use when user asks to [action].
---

# Skill Instructions

Detailed instructions for the agent when this skill is active...
```

## YAML Frontmatter

The frontmatter contains two critical fields:

| Field | Purpose | Importance |
|-------|---------|------------|
| `name` | Unique identifier for the skill | Must match the directory name |
| `description` | Triggers and scope of the skill | Critical for automatic activation |

The `description` field is the most important component—it determines when Gemini CLI automatically suggests activating the skill based on user requests matching the description.

## Content Section

The markdown section below the frontmatter contains instructions that become active when the skill is triggered. These can include:
- Specific behaviors the agent should exhibit
- Tools and scripts available to use
- Task-specific guidance and best practices
- References to bundled resources

## Example

```markdown
---
name: code-reviewer
description: Expertise in reviewing code changes for correctness, security, and style. Use when the user asks to "review" their code or a PR.
---

# Code Reviewer Instructions

You act as a senior software engineer specialized in code quality. When this skill is active, you MUST:

1. **Analyze**: Review the provided code for logical errors, security vulnerabilities, and style violations.
2. **Review**: Use the bundled `scripts/review.js` utility to perform an automated check.
3. **Feedback**: Provide constructive feedback, clearly distinguishing between critical issues and minor improvements.
```

## See Also

- [[agent-skills]] — The broader concept of extensible expertise modules
- [[skill-triggering]] — How description-based matching activates skills
- [[skill-discovery-tiers]] — How skills are discovered across different locations
- [[skill-development]] — Development workflows including validation scripts