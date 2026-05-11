---
type: concept
title: "Progressive Disclosure"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "context-management"
  - "agent-skills"
  - "optimization"
  - "gemini-cli"
related:
  - "[[agent-skills]]"
  - "[[skill-anatomy]]"
  - "[[extensions]]"
sources: ["5. Agent Skill best practices.md"]
---

# Progressive Disclosure

Progressive disclosure is a context management strategy used in agent skills that loads information in stages based on need, preventing context window bloat while maintaining availability when required.

## The Three-Level Loading System

### Level 1: Metadata (Always in Context)

**Size:** ~100 words  
**Content:** Skill name and description

This minimal layer remains in the shared context window at all times. The description serves as both documentation and the activation trigger — the model evaluates it to decide whether to invoke the skill.

**Best practice:** Write descriptions that are specific enough to activate only when relevant, without being so narrow that legitimate use cases are missed.

### Level 2: SKILL.md Body (On Trigger)

**Size:** <5k words  
**Content:** Core procedural instructions

Loaded only after the skill triggers, this contains the main instructions, decision logic, and procedural guidance. Keep this focused on actionable steps rather than exhaustive reference material.

**Best practice:** Move detailed reference material, schemas, and examples into the `references/` folder to keep SKILL.md body lean and focused.

### Level 3: Bundled Resources (As Needed)

**Loaded:** On demand during execution  
**Content:** Scripts, reference documents, templates

Scripts in `scripts/`, documentation in `references/`, and templates in `assets/` are loaded only when the execution context requires them. This prevents loading information that may never be used.

**Best practice:** Structure bundled resources so they can be loaded independently, targeting specific resources rather than loading entire directories.

## Design Rationale

The context window is a shared resource across all active skills and conversation context. Without progressive disclosure:

- Adding many skills would quickly exhaust available context
- Skills would need to be extremely brief to fit alongside others
- Rarely-used but complex skills would be impractical

Progressive disclosure solves this by ensuring that the constant context overhead (~100 words per skill) is minimal, while complex skills can provide rich instructions when actually invoked.

## Implementation Pattern

```
my-skill/
├── SKILL.md          # Name + description (metadata) + body (procedural)
├── scripts/          # Loaded when task requires automation
├── references/       # Loaded when detailed guidance is needed
└── assets/           # Loaded for template output tasks
```

## Relationship to Agent Skills

Progressive disclosure is a fundamental design principle for [[agent-skills]]. All skills should implement this loading pattern to maintain system-wide context efficiency while supporting complex, specialized behavior.

## See Also

- [[agent-skills]] — Core concept for skill design
- [[skill-anatomy]] — Directory structure supporting progressive disclosure