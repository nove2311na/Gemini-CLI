---
type: entity
title: "Terminal Bell"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "terminal"
  - "notifications"
  - "fallback"
  - "BEL"
related:
  - "[[osc-9]]"
  - "[[notifications]]"
sources: ["III. 13. Notifications (experimental).md"]
---

# Terminal Bell

The Terminal Bell (BEL) is a fallback notification mechanism used when the primary [[osc-9]] escape sequence is not supported by the terminal emulator.

## Overview

The BEL character (ASCII code 7) is a traditional terminal control character that signals an alert condition. Modern terminal emulators respond to BEL by flashing the taskbar or playing a system alert sound.

## Role in Gemini CLI Notifications

When Gemini CLI attempts to send a [[notifications]] but the terminal does not support OSC 9, the system falls back to emitting a BEL character. This provides a basic notification capability even on terminals without native notification support.

## Notification Behavior

| Mechanism | Terminal Support | User Feedback |
|-----------|-----------------|----------------|
| OSC 9 | iTerm2, WezTerm, Ghostty, Kitty | Native system notification |
| Terminal Bell (BEL) | Universal | Taskbar flash or alert sound |

## See Also

- [[osc-9]] — Primary notification mechanism
- [[notifications]] — Gemini CLI notification feature