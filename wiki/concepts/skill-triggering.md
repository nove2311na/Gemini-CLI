---
type: concept
title: "Skill Triggering"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "skill-activation"
  - "skill-triggering"
  - "automatic-matching"
related:
  - "[[agent-skills]]"
  - "[[skill-discovery-tiers]]"
  - "[[SKILL.md]]"
  - "[[session-management]]"
sources: ["3. Creating Agent Skills.md"]
---

# Skill Triggering

Skill triggering is the mechanism by which Gemini CLI automatically activates skills based on user requests that match the skill's description. The `description` field in [[SKILL.md]] is the critical component that enables this automatic discovery.

## How Triggering Works

When a user makes a request, Gemini CLI:

1. Compares the request against descriptions of all discovered skills
2. Identifies skills where the description matches the request scope
3. Asks for user permission to activate the matching skill
4. Upon approval, activates the skill and grants the model access to its resources

## The Description Field

The `description` field in [[SKILL.md]] serves as both documentation and a matching pattern. It should:

- **Specify the domain**: Clearly state what expertise the skill provides
- **List trigger keywords**: Include phrases like "Use when the user asks to..."
- **Define scope**: Indicate what tasks the skill handles vs. what it doesn't

Example of an effective description:
```yaml
description: Expertise in reviewing code changes for correctness, security, and style. Use when the user asks to "review" their code or a PR.
```

This description will trigger when user requests contain words like "review", "review code", "PR review", or similar variations.

## Permission Flow

Automatic triggering requires explicit user permission:

1. Gemini identifies potential skill match
2. CLI prompts: "Activate [skill-name] for this task?"
3. User approves or declines
4. If approved, skill becomes active and model accesses its instructions and resources

This permission model ensures users remain in control while benefiting from automatic discovery.

## Interaction with Sessions

Skills are activated within the context of a [[session|session]]. When a skill is triggered and approved, its expertise becomes available for the duration of that conversation turn, with the model able to access bundled scripts and references as needed.

## Testing Triggers

The `/skills` command lists all loaded skills, allowing verification that skills are correctly discovered and named. To test triggering:

1. Start a new session
2. Make a request matching the skill's description keywords
3. Observe whether the CLI suggests activating the skill

## Best Practices

- Use explicit trigger phrases in descriptions ("Use when user asks to...")
- Include common variations of task terminology
- Be specific about scope to avoid unintended activation
- Test with multiple phrasings to ensure reliable matching

## See Also

- [[agent-skills]] — The broader concept of extensible expertise modules
- [[skill-discovery-tiers]] — How skills are discovered across different locations
- [[SKILL.md]] — The file format that contains triggering descriptions
- [[session-management]] — How skill activation fits within conversation sessions