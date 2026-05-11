---
type: concept
title: "Skill Anatomy"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "agent-skills"
  - "directory-structure"
  - "file-formats"
  - "gemini-cli"
related:
  - "[[agent-skills]]"
  - "[[progressive-disclosure]]"
  - "[[skill-description-writing]]"
  - "[[agentic-ergonomics]]"
sources: ["5. Agent Skill best practices.md"]
---

# Skill Anatomy

Skill anatomy describes the standard directory structure and file organization that defines a well-structured agent skill. A skill's structure directly supports the [[progressive-disclosure]] loading system, with each component serving a specific role in context management.

## Standard Structure

```
my-skill/
├── SKILL.md       (Required) Core instructions and metadata
├── scripts/       (Optional) Executable logic (Node.js, Python, etc.)
├── references/    (Optional) Documentation to be loaded as needed
└── assets/        (Optional) Templates and non-executable resources
```

## Required Components

### SKILL.md

The only required file in a skill directory. Contains:

**Metadata section:**
- `name` — Skill identifier (used for activation matching)
- `description` — Activation trigger (the discovery mechanism)

**Body content:**
- Core procedural instructions
- Decision logic
- Step-by-step guidance
- Configuration options

**Best practice:** Keep the body focused on actionable instructions. Move detailed reference material into `references/` to maintain [[progressive-disclosure]] efficiency.

## Optional Components

### scripts/ Directory

Contains executable logic that the skill can invoke. Use for:

- **Deterministic automation** — Tasks that can be fully automated (linters, formatters, data fetchers)
- **Complex calculations** — Operations that require precise computation
- **System integration** — Commands that interact with external APIs or services

**Agentic ergonomics:** Scripts must output LLM-friendly stdout, suppress verbose tracebacks, and provide clear success/failure messages. See [[agentic-ergonomics]] for details.

### references/ Directory

Contains documentation loaded as needed during skill execution:

- Detailed reference material
- Schema definitions
- Extended examples
- API documentation

**Loading pattern:** Files in `references/` are loaded on demand, not automatically. This supports the third level of progressive disclosure.

### assets/ Directory

Contains non-executable resources used by the skill:

- File templates
- Boilerplate code headers
- Configuration samples
- Static data files

**Use case:** When the skill needs to produce consistent output, include templates in `assets/` to ensure the agent generates structured, repeatable results.

## Relationship to Progressive Disclosure

The anatomy directly supports the three-level loading system:

| Anatomy Component | Loading Level | Trigger |
|-------------------|---------------|---------|
| SKILL.md name + description | Level 1 (Metadata) | Always in context |
| SKILL.md body | Level 2 (Body) | On skill activation |
| scripts/, references/, assets/ | Level 3 (Resources) | As needed during execution |

## Security Considerations

When designing skill anatomy:

- Place all executable code in `scripts/` for easy auditing
- Keep sensitive configuration data outside the skill directory
- Use `references/` for documentation, not credentials
- Review all bundled scripts before distributing skills

## See Also

- [[agent-skills]] — Core skill concept
- [[progressive-disclosure]] — How anatomy supports loading
- [[agentic-ergonomics]] — Script design principles