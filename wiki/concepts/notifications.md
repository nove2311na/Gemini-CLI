---
type: concept
title: "Notifications"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "experimental"
  - "notifications"
  - "terminal"
  - "background-work"
related:
  - "[[plan-mode]]"
  - "[[settings]]"
  - "[[osc-9]]"
  - "[[terminal-bell]]"
  - "[[background-processes]]"
  - "[[III. 13. Notifications (experimental)]]"
sources: ["III. 13. Notifications (experimental).md"]
---

# Notifications

Notifications is an experimental feature in [[gemini-cli]] that sends system-level alerts when session events occur. This enables developers to monitor long-running tasks without staying focused on the terminal window.

## Overview

Gemini CLI can send system notifications to alert you when a session completes or when it needs your attention, such as when it is waiting for you to approve a tool call.

## Supported Terminals

The notification system relies on the [[osc-9]] terminal escape sequence. Supported terminal emulators include:

- [[iTerm2]]
- [[WezTerm]]
- [[Ghostty]]
- [[Kitty]]

If your terminal does not support OSC 9, the system falls back to a [[terminal-bell]] (BEL), causing taskbar flash or system alert sound.

## Enabling Notifications

Notifications are disabled by default. Enable them through the [[settings]] interface:

1. Type `/settings` in an interactive session
2. Navigate to the **General** category
3. Toggle **Enable Notifications** to **On**

Alternatively, add to `settings.json`:

```json
{
  "general": {
    "enableNotifications": true
  }
}
```

## Notification Types

| Type | Trigger | Use Case |
|------|---------|----------|
| Action required | Model waiting for input or tool approval | Know when CLI has paused and needs intervention |
| Session complete | Session finishes successfully | Track completion of automated tasks |

## Use Cases

### Background Work with Plan Mode

Notifications are particularly useful when running long-running tasks or using [[plan-mode]]. You can switch to other windows while Gemini CLI works in the background, receiving alerts when:

- The agent requires approval for a tool call
- A complex task in Plan Mode completes
- A background process finishes execution

### Monitoring Automated Tasks

When running scripts or automated workflows, notifications provide passive status updates without requiring constant terminal attention. This complements the [[background-processes]] pattern for detached task management.

## Experimental Status

This feature is marked as experimental. Behavior and terminal support may change in future releases. Monitor official documentation for updates to notification capabilities.

## Related Concepts

- [[background-processes]] — Long-running tasks detached from main session
- [[plan-mode]] — Structured environment for complex tasks
- [[settings]] — Configuration mechanism for enabling features
- [[mid-turn-refinement]] — Corrections during active processing