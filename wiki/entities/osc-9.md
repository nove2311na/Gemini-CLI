---
type: entity
title: "OSC 9"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "terminal"
  - "escape-sequence"
  - "notifications"
  - "osc"
related:
  - "[[terminal-bell]]"
  - "[[notifications]]"
  - "[[iTerm2]]"
  - "[[WezTerm]]"
  - "[[Ghostty]]"
  - "[[Kitty]]"
sources: ["III. 13. Notifications (experimental).md"]
---

# OSC 9

OSC 9 is a terminal escape sequence (Operating System Command) used to trigger system-level notifications from terminal applications. It is part of the ECMA-48 standard for terminal control sequences.

## Overview

The OSC 9 escape sequence allows terminal applications to send native system notifications without requiring in-terminal output. When a terminal emits this sequence, the operating system displays a notification to the user.

## Usage in Gemini CLI

Gemini CLI uses OSC 9 to send [[notifications]] for two event types:

- **Action required:** When the model is waiting for user input or tool approval
- **Session complete:** When a session finishes successfully

## Terminal Support

OSC 9 notifications are supported by several modern terminal emulators:

- [[iTerm2]]
- [[WezTerm]]
- [[Ghostty]]
- [[Kitty]]

## Fallback Mechanism

If the terminal does not support OSC 9, Gemini CLI falls back to the [[terminal-bell]] (BEL) character. This triggers a taskbar flash or system alert sound as an alternative notification mechanism.

## See Also

- [[terminal-bell]] — Fallback notification mechanism
- [[notifications]] — Gemini CLI notification feature
- [[settings]] — Configuration for enabling notifications