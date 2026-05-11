---
type: source
title: "Agent Skill best practices"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "agent-skills"
  - "best-practices"
  - "design-patterns"
  - "gemini-cli"
related:
  - "[[agent-skills]]"
  - "[[progressive-disclosure]]"
  - "[[skill-description-writing]]"
  - "[[skill-anatomy]]"
  - "[[degrees-of-freedom]]"
  - "[[agentic-ergonomics]]"
  - "[[skill-security]]"
sources: ["5. Agent Skill best practices.md"]
---

# Agent Skill best practices

**Source:** [geminicli.com](https://geminicli.com/docs/cli/skills-best-practices/)  
**Published:** 2026-05-01  
**Author:** Gemini CLI Documentation

This official guide establishes design principles and patterns for creating high-quality, reliable Agent Skills in Gemini CLI. It covers the complete skill development lifecycle from discovery optimization through security best practices.

## Key Principles

The document establishes four core design principles:

1. **Design for discovery** — The skill `description` is the sole activation mechanism; must be specific, include trigger keywords, and avoid overlap
2. **Progressive disclosure** — Three-level loading system managing context efficiently across metadata, SKILL.md body, and bundled resources
3. **Degrees of freedom** — Instruction specificity matched to task fragility (high freedom for flexible tasks, low for fragile operations)
4. **Agentic ergonomics** — Scripts must output LLM-friendly stdout with clear success/failure messaging

## Skill Anatomy

A well-structured skill follows a standard directory structure:
- `SKILL.md` (required) — Core instructions and metadata
- `scripts/` (optional) — Executable logic (Node.js, Python, etc.)
- `references/` (optional) — Documentation loaded as needed
- `assets/` (optional) — Templates and non-executable resources

## Security Considerations

The guide emphasizes three security practices: avoid hardcoded secrets, review third-party skills before installing, and limit skill scope to minimize error impact.

## Related Concepts

- [[agentic-ergonomics]] — Design principles for AI-friendly scripts
- [[progressive-disclosure]] — Context management strategy
- [[skill-anatomy]] — Standard directory structure for skills
- [[degrees-of-freedom]] — Framework for instruction specificity