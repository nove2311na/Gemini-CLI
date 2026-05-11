---
type: entity
title: "/memory inbox Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "slash-command"
  - "memory"
  - "skill-review"
  - "inbox"
related:
  - "[[auto-memory]]"
  - "[[inbox-model]]"
  - "[[skill-mining]]"
sources: ["III. 3. Auto Memory.md"]
---

# /memory inbox Command

The `/memory inbox` slash command is the primary interface for reviewing and managing draft skills extracted by Auto Memory. It opens an interactive inbox dialog where users can inspect, promote, or discard pending skill extractions.

## Usage

Simply type `/memory inbox` in any Gemini CLI session to open the inbox dialog. The command works at any time during a session, not just when new items are available.

## Inbox Dialog Features

The inbox dialog presents each draft skill with its name, description, and source sessions. From this interface, users can:

- **Read** — View the full SKILL.md content before deciding whether to keep the skill
- **Promote** — Move the skill to user scope (`~/.gemini/skills/`) or workspace scope (`.gemini/skills/`)
- **Discard** — Remove a skill from the inbox without promoting it
- **Apply patches** — Accept or reject proposed edits to existing skills

## Relationship to Notifications

Auto Memory surfaces an inline notification when new skills or patches are ready. Users can click through from the notification or use `/memory inbox` directly to review items at their convenience.

## Cleanup Functionality

The inbox serves as a holding area for draft skills. Items remain until explicitly promoted or discarded. Users should periodically review the inbox to prevent accumulation of outdated or unwanted draft skills.