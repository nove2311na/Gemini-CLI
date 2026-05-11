---
type: concept
title: "Skill Activation"
created: 2026-05-05
updated: 2025-05-05
tags:
  - "gemini-cli"
  - "agent-skills"
  - "activation"
related:
  - "[[agent-skills]]"
  - "[[skill-discovery]]"
  - "[[workspace-trust-model]]"
sources: ["2. Get started with Agent Skills.md"]
---

# Skill Activation

Skill activation is the consent-based mechanism that triggers an Agent Skill when user request matches its description. The activation system ensures users maintain control over when specialized expertise engages.

## Activation Flow

1. **Trigger**: User makes a request that naturally matches a skill's description
2. **Identification**: Gemini analyzes request and identifies matching skill via description text
3. **Tool Call**: Gemini calls the `activate_skill` tool with the matched skill
4. **Consent**: System displays prompt asking user to approve activation
5. **Execution**: Upon approval, skill becomes active and provides its specialized behavior

## Consent Requirement

Unlike passive tool usage, skill activation requires explicit user approval. The consent prompt ensures users understand when a skill is taking control and can refuse if the match seems incorrect.

```
activate_skill
Skill: api-auditor

Approve this skill activation? (y/N)
```

## Description Matching

The skill's `description:` field in frontmatter serves as the activation trigger. This field should contain natural language keywords and scenarios that indicate when the skill should activate.

Example activation triggers:
- "Use when the user asks to 'check', 'test', or 'audit' a URL"
- "Activated when debugging API timeout issues"
- "Use for any request involving database migration"

## Active State Behavior

Once activated, the skill:
- Provides its instructions to Gemini's reasoning
- May execute bundled scripts via `run_shell_command`
- Remains active until the session ends or another skill activates

## Multiple Skill Matches

The documentation does not specify behavior when multiple skills match a request. Open question: Does activation pick one skill, prompt for choice, or activate all matching skills?

## See Also

- [[agent-skills]] — Full skill structure documentation
- [[skill-discovery]] — How skills are found for activation matching