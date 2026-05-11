---
type: source
title: "Auto Memory"
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/auto-memory/"
venue: "gemini-cli documentation"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "auto-memory"
  - "skill-mining"
  - "experimental"
  - "session-analysis"
related:
  - "[[auto-memory]]"
  - "[[skill-mining]]"
  - "[[confucius-subagent]]"
  - "[[session]]"
  - "[[extensions]]"
sources: ["III. 3. Auto Memory.md"]
---

# Auto Memory

Auto Memory is an experimental feature that mines past Gemini CLI sessions in the background and turns recurring workflows into reusable Agent Skills. Users review, accept, or discard each extracted skill before it becomes available to future sessions.

## Core Functionality

Every session run with Gemini CLI is recorded locally as a transcript. Auto Memory scans those transcripts for procedural patterns that recur across sessions, then drafts each pattern as a `SKILL.md` file in a project-local inbox. Users inspect the draft, decide whether it captures real expertise, and promote it to their global or workspace skills directory if they want it.

## Key Features

Auto Memory enables capturing team workflows that users find themselves walking the agent through more than once, codifying hard-won fixes for project-specific issues, and bootstrapping a skills library without writing every `SKILL.md` by hand.

## Prerequisites and Configuration

The feature requires at least 10 user messages across recent, idle sessions in the project, ignoring active or trivial sessions. Auto Memory is off by default and must be enabled via settings.json with the experimental flag `autoMemory: true`, requiring a restart to take effect.

## Processing Pipeline

The system runs a five-step pipeline: eligibility scan of sessions in `~/.gemini/tmp/<project>/chats/`, lock acquisition to coordinate across CLI instances, sub-agent extraction via the `confucius` agent, patch validation for proposed edits to existing skills, and notification when new skills or patches are ready.

## Review Workflow

The `/memory inbox` slash command opens the inbox dialog where users can read full `SKILL.md` bodies, promote skills to user or workspace directories, discard unwanted skills, and apply or reject patch proposals.

## Privacy and Limitations

Session data never leaves the local machine except for normal API calls. The sub-agent is instructed to redact secrets and never copy large tool outputs. Extraction quality depends on a preview Gemini Flash model, and skills are stored per project with per-project inbox isolation.