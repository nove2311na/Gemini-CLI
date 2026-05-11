---
type: concept
title: "Skill Description Writing"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "agent-skills"
  - "discovery"
  - "prompting"
  - "gemini-cli"
related:
  - "[[agent-skills]]"
  - "[[progressive-disclosure]]"
  - "[[skill-anatomy]]"
sources: ["5. Agent Skill best practices.md"]
---

# Skill Description Writing

The skill `description` field is the primary discovery mechanism for agent skills. It is the only information the model evaluates to decide whether to activate a skill, making effective description writing the most critical skill development task.

## Core Requirements

A well-crafted description must accomplish three goals:

### 1. Be Specific

Use keywords that are likely to appear in user prompts. The model matches against its training understanding of these terms, so choose words that naturally express the skill's purpose.

**Effective keywords:**
- Task-oriented: "audit," "refactor," "migrate," "generate," "analyze"
- Domain-specific: "security," "performance," "accessibility," "database"
- Action-oriented: "convert," "extract," "validate," "transform"

**Weak example:** "This skill helps with code."

**Strong example:** "Use this skill when the user asks to audit code for security vulnerabilities, refactor legacy components, or migrate database schemas."

### 2. Define the Trigger

Clearly state when the skill should be activated. The more precisely you can describe the trigger conditions, the better the model can distinguish this skill from others.

**Template:**
> Use this skill when the user asks to [specific action] for [specific domain or context].

### 3. Avoid Overlap

Ensure descriptions are distinct from:
- Other installed skills (prevent activation conflicts)
- General model capabilities (avoid redundant activation)
- Implicit behaviors (don't describe standard agent abilities)

**Common overlap issues:**
- Skill describes something the model already does well → redundant
- Multiple skills use similar trigger keywords → unpredictable activation
- Description is too broad → activates in unintended contexts

## Description Length Considerations

The description field contributes to the always-in-context metadata (~100 words). Keep descriptions concise but complete:

| Length | Appropriate For |
|--------|-----------------|
| **Short (1-2 sentences)** | Narrow, highly specific skills |
| **Medium (3-5 sentences)** | Most skills with clear trigger conditions |
| **Longer (~100 words)** | Complex skills with multiple activation scenarios |

## Examples

**Security auditing skill:**
> Use this skill when the user asks to perform a security audit, scan for vulnerabilities, review access controls, or analyze authentication mechanisms. Activates for security review, penetration testing, and compliance checking tasks.

**Database migration skill:**
> Use this skill when the user asks to migrate a database, convert schemas, transfer data between systems, or update database configurations. Handles PostgreSQL, MySQL, and MongoDB migrations.

**Code review skill:**
> Use this skill when the user asks to review pull requests, conduct code reviews, or analyze changes for quality, performance, or maintainability issues.

## Testing Descriptions

After writing a description, evaluate it against these questions:

1. Would a user phrase the trigger in this way?
2. Is the description distinct from other skills?
3. Will this description avoid activating for standard tasks?

## See Also

- [[agent-skills]] — Core skill concept
- [[progressive-disclosure]] — Where descriptions fit in the loading system
- [[skill-anatomy]] — Where descriptions live in skill structure