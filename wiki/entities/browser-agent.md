---
type: entity
title: "Browser Agent"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "subagent"
  - "built-in"
  - "browser-automation"
  - "experimental"
related:
  - "[[subagents]]"
  - "[[visual-agent]]"
  - "[[chrome-devtools-mcp]]"
  - "[[gemini-cli]]"
sources: ["III. 15. Subagents.md"]
---

# Browser Agent

The `browser_agent` is an experimental built-in subagent in Gemini CLI that automates web browser tasks—navigating websites, filling forms, clicking buttons, and extracting information from web pages.

**Note:** This is an experimental feature.

## Prerequisites

- **Chrome** version 144 or later (any recent stable release works)
- The underlying `chrome-devtools-mcp` server is bundled with Gemini CLI and launched automatically

## Enabling the Browser Agent

Disabled by default. Enable in `settings.json`:

```json
{
  "agents": {
    "overrides": {
      "browser_agent": {
        "enabled": true
      }
    }
  }
}
```

## Session Modes

| Mode | Description |
|------|-------------|
| `persistent` | **(Default)** Launches Chrome with a persistent profile at `~/.gemini/cli-browser-profile/`. Cookies, history, and settings are preserved. |
| `isolated` | Launches Chrome with a temporary profile deleted after each session. |
| `existing` | Attaches to an already-running Chrome instance with remote debugging enabled. |

Configure via `agents.browser.sessionMode` in `settings.json`.

## Configuration Reference

| Setting | Type | Default | Description |
|---------|------|---------|-------------|
| `sessionMode` | string | `"persistent"` | Chrome management mode |
| `headless` | boolean | `false` | Run without visible window |
| `profilePath` | string | — | Custom browser profile directory |
| `visualModel` | string | — | Model override for the visual agent |
| `allowedDomains` | string[] | — | Restrict navigation to specific domains |
| `disableUserInput` | boolean | `true` | Block user input during automation |
| `maxActionsPerTask` | number | `100` | Maximum tool calls per task |
| `confirmSensitiveActions` | boolean | `false` | Require confirmation for file upload and script evaluation |
| `blockFileUploads` | boolean | `false` | Hard-block all file upload requests |

## Security Features

- **Domain restrictions:** When `allowedDomains` is set, navigation is limited to listed domains
- **Blocked URL patterns:** `file://`, `javascript:`, `data:text/html`, `chrome://extensions`, `chrome://settings/passwords`
- **Sensitive action confirmation:** Form filling always requires confirmation
- **File upload blocking:** Optional hard-block for all file uploads
- **Rate limiting:** `maxActionsPerTask` prevents runaway execution

## Sandbox Support

### macOS Seatbelt

When running under macOS seatbelt sandbox, `persistent` and `isolated` modes are forced to `isolated` with `headless` enabled.

### Docker Containers

Browser agent is disabled unless `sessionMode` is set to `"existing"`. Automatically connects to Chrome on host via `host.docker.internal:9222`.

## Usage Examples

- "Go to example.com and fill out the contact form"
- "Extract the pricing table from this page"
- "Click the login button and enter my credentials"
- "Take a screenshot of the dashboard and describe any error messages"

## See Also

- [[subagents]] — General subagent documentation
- [[visual-agent]] — Screenshot-based automation
- [[chrome-devtools-mcp]] — Underlying browser automation technology