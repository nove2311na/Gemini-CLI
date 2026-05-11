---
type: concept
title: "Agent Skills"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "agent-skills"
  - "extensions"
  - "capabilities"
  - "gemini-cli"
related:
  - "[[extensions]]"
  - "[[gemini-cli-extensions]]"
  - "[[progressive-disclosure]]"
  - "[[skill-description-writing]]"
  - "[[skill-anatomy]]"
  - "[[skill-security]]"
sources: ["1. Agent Skills.md", "3. Creating Agent Skills.md", "4. Managing Agent Skills.md", "5. Agent Skill best practices.md"]
---

# Agent Skills

Agent Skills are specialized capabilities that extend the Gemini CLI's ability to perform complex, multi-step tasks. They are packaged as part of the [[extensions]] system and represent a core mechanism for customizing agent behavior.

## Overview

Unlike simple commands or prompts, agent skills are designed to handle nuanced workflows that require contextual judgment, sequential decision-making, or integration with external resources. Each skill is self-contained with its own instructions, scripts, and supporting documentation.

## Core Design Principles

### Design for Discovery

The skill `description` is the only information the model uses to decide whether to activate a skill. This makes description writing the most critical skill development task.

**Best practices for descriptions:**
- Use specific keywords likely to appear in user prompts (e.g., "audit," "security," "refactor," "migration")
- Clearly define when the skill should be triggered
- Ensure descriptions are distinct from other skills and general model capabilities

### Progressive Disclosure

Skills use a three-level loading system to manage the shared context window efficiently:

1. **Metadata level** — Name and description (~100 words) always remain in context
2. **SKILL.md body** — Core procedural instructions loaded only when triggered (<5k words)
3. **Bundled resources** — Scripts, references, and assets loaded as needed during execution

This approach prevents context window bloat while ensuring instructions remain available when required.

### Degrees of Freedom

Instruction specificity should match task fragility:

| Freedom Level | Approach | Use Case |
|---------------|----------|----------|
| **High** | Text-based instructions | Multiple valid approaches, context-dependent decisions |
| **Medium** | Pseudocode or scripts with parameters | Preferred pattern exists with acceptable variation |
| **Low** | Specific scripts, few parameters | Fragile operations, strict sequences required |

## Relationship to Extensions

Agent Skills are one of several extension types within the [[gemini-cli-extensions]] packaging system. While extensions can include prompts, commands, themes, hooks, and sub-agents, skills specifically enable procedural, agentic behavior that leverages the model's reasoning capabilities.

## Security Considerations

Skills execute within the agent's workspace context. Follow these practices:

- **Never hardcode secrets** — Avoid including API keys, passwords, or credentials in skill files
- **Review third-party skills** — Inspect SKILL.md and scripts before installing from untrusted sources
- **Limit scope** — Design focused skills to minimize error impact

## See Also

- [[skill-anatomy]] — Standard directory structure for skills
- [[progressive-disclosure]] — Context management strategy
- [[skill-description-writing]] — Crafting effective descriptions
- [[agentic-ergonomics]] — Script design for AI compatibility