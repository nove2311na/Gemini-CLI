---
type: entity
title: "WezTerm"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "terminal-emulator"
  - "notifications"
  - "osc-9"
related:
  - "[[iTerm2]]"
  - "[[Ghostty]]"
  - "[[Kitty]]"
  - "[[notifications]]"
  - "[[osc-9]]"
sources: ["III. 13. Notifications (experimental).md"]
---

# WezTerm

WezTerm is a cross-platform terminal emulator written in Rust that supports the [[osc-9]] terminal escape sequence. This enables Gemini CLI to send native system notifications when running in WezTerm.

## Notification Support

WezTerm supports OSC 9 notifications, making it a compatible terminal for the [[notifications]] feature in Gemini CLI. When OSC 9 is available, Gemini CLI can trigger system notifications rather than relying on in-terminal output.

## See Also

- [[iTerm2]] — macOS terminal with OSC 9 support
- [[Ghostty]] — Terminal with OSC 9 support
- [[Kitty]] — Fast terminal emulator with OSC 9 support
- [[osc-9]] — Terminal escape sequence for notifications