---
type: concept
title: "Skill Activation Lifecycle"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "agent-skills"
  - "lifecycle"
related:
  - "[[agent-skills]]"
  - "[[discovery-tiers]]"
  - "[[confirmation-prompts]]"
sources: ["1. Agent Skills.md"]
---

# Skill Activation Lifecycle

The skill activation lifecycle defines the end-to-end workflow from when a skill is discovered to when it is used during task execution. Understanding this lifecycle helps users anticipate what happens at each stage.

## The Five Steps

### Step 1: Discovery

At the start of a session, [[gemini-cli]] scans the [[discovery-tiers]] and injects the name and description of all enabled skills into the system prompt. This initial scan loads only metadata—not full skill content—preserving context tokens.

### Step 2: Activation

When Gemini identifies a task matching a skill's description, it calls the `activate_skill` tool. This triggers the activation request that initiates the consent phase.

### Step 3: Consent

The user sees a [[confirmation-prompts|confirmation prompt]] in the UI detailing:
- The skill's name
- The skill's purpose
- The directory path it will gain access to

User approval is required before the skill content is injected into the conversation.

### Step 4: Injection

Upon user approval:
1. The `SKILL.md` body is added to the conversation history
2. The skill's folder structure is revealed
3. The skill's directory is added to the agent's allowed file paths, granting permission to read any bundled assets

### Step 5: Execution

The model proceeds with the specialized expertise active. It is instructed to prioritize the skill's procedural guidance within reason during task execution.

## Lifecycle Diagram

```
Discovery → Activation → Consent → Injection → Execution
    │            │            │           │           │
 Session    Model calls    User sees   Content      Model uses
  start     activate_skill confirmation injected     skill guidance
```

## Key Characteristics

- **Progressive disclosure**: Content is only injected after consent, not before
- **User control**: Consent step ensures users approve any skill activation
- **Scope enforcement**: Allowed file paths are explicitly granted per skill
- **Context management**: Only relevant skills are activated, avoiding context pollution

## Contrast with Persistent Context

Unlike [[GEMINI.md]] which provides persistent workspace-wide background, skills activate on-demand. This means:
- Skills don't consume context tokens until activated
- Multiple skills can be available without overhead
- Users control when specialized expertise is introduced