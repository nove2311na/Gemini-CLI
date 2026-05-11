---
type: entity
title: "Auto Memory"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "experimental"
  - "background-service"
  - "skill-mining"
related:
  - "[[confucius-subagent]]"
  - "[[skill-mining]]"
  - "[[inbox-model]]"
  - "[[session]]"
  - "[[extensions]]"
  - "[[GEMINI.md]]"
  - "[[save-memory-tool]]"
  - "[[memory-inbox-command]]"
sources: ["III. 3. Auto Memory.md"]
---

# Auto Memory

Auto Memory is an experimental Gemini CLI feature that mines past session transcripts in the background to discover recurring procedural patterns and convert them into reusable Agent Skills.

## Overview

Rather than requiring manual skill authoring, Auto Memory automatically extracts multi-step workflows from conversation history. This transforms implicit knowledge—the things users repeatedly explain to the agent—into explicit, reusable assets that future sessions can discover and apply independently.

## How It Works

Auto Memory runs as a non-blocking background task during session startup. It does not interfere with interactive sessions or consume turns. The extraction service follows a five-step pipeline:

1. **Eligibility scan** — Indexes sessions from `~/.gemini/tmp/<project>/chats/`; only idle sessions with 10+ user messages qualify
2. **Lock acquisition** — Coordinates across multiple CLI instances to prevent duplicate extraction runs
3. **Sub-agent extraction** — The `confucius` agent reviews eligible sessions and drafts `SKILL.md` files
4. **Patch validation** — Validates any proposed edits to existing skills via dry-run
5. **Notification** — Surfaces inline message when new inbox items are ready

## Enabling and Disabling

Auto Memory is disabled by default. Enable it by adding `"experimental": { "autoMemory": true }` to `~/.gemini/settings.json` (global) or `.gemini/settings.json` (project-local), then restart the CLI. Disable by setting the flag to `false` and restarting.

## Privacy Model

Auto Memory only reads session files that already exist locally. Nothing is uploaded to Gemini outside normal API calls made by the extraction sub-agent. The sub-agent is instructed to redact secrets, tokens, and credentials, and never copy large tool outputs verbatim.

## Limitations

- Extraction quality depends on the preview Gemini Flash model's pattern recognition capabilities
- Current session is excluded; only sessions idle for 3+ hours are considered
- Inbox items are stored per-project and not automatically shared across workspaces
- Users must manually promote skills to make them discoverable in future sessions