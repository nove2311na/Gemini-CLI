---
type: entity
title: "Confucius Sub-agent"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "sub-agent"
  - "skill-mining"
  - "extraction"
  - "background-service"
related:
  - "[[auto-memory]]"
  - "[[skill-mining]]"
  - "[[session]]"
sources: ["III. 3. Auto Memory.md"]
---

# Confucius Sub-agent

Confucius is the specialized sub-agent that performs skill extraction within the Auto Memory system. Named after the philosopher known for collecting and teaching wisdom, this agent reviews session transcripts and drafts `SKILL.md` files that capture recurring procedural patterns.

## Role and Responsibilities

The Confucius sub-agent performs the core extraction work for Auto Memory. During each background extraction run, it:

1. Reviews the session index for eligible past sessions
2. Reads sessions that appear to contain repeated procedural workflows
3. Identifies patterns that recur across multiple sessions
4. Drafts new `SKILL.md` files for patterns that meet quality thresholds
5. Proposes patches to existing skills when appropriate

## Behavioral Guidelines

Confucius is instructed with a conservative bias: it defaults to creating zero skills unless the evidence for a recurring pattern is strong. This quality-first approach prevents the inbox from being cluttered with one-off incidents or trivial interactions. The sub-agent will redact any secrets, tokens, or credentials encountered during analysis and will never copy large tool outputs verbatim.

## Technical Implementation

The sub-agent runs on a preview Gemini Flash model, which is a separate model from the one used for interactive sessions. This allows extraction to proceed without competing for resources during active work. The preview model designation means extraction quality may vary as the model evolves.

## Privacy Considerations

Confucius only accesses local session files. It communicates with the Gemini API only through normal API calls made during its analysis. No session content is uploaded to external servers; only the structured results of its analysis (draft skills and proposed patches) are written to local disk.