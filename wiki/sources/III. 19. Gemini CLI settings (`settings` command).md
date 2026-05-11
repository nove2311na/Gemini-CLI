---
type: source
title: "Gemini CLI Settings (`/settings` command)"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "settings"
  - "configuration"
  - "gemini-cli"
related:
  - "[[plan-mode]]"
  - "[[model-steering]]"
  - "[[session-management]]"
  - "[[sandboxing]]"
  - "[[memory-v2]]"
  - "[[yolo-mode]]"
  - "[[voice-mode]]"
  - "[[context-aware-security]]"
  - "[[folder-trust]]"
  - "[[auto-memory]]"
sources: ["III. 19. Gemini CLI settings (`settings` command).md"]
---

# Gemini CLI Settings (`/settings` command)

Control your Gemini CLI experience with the `/settings` command. This command opens a dialog to view and edit all Gemini CLI settings, including UI experience, keybindings, and accessibility features.

## Configuration Storage

Settings are stored in a `settings.json` file at two levels:

- **User settings**: `~/.gemini/settings.json` — applies globally to all workspaces
- **Workspace settings**: `your-project/.gemini/settings.json` — applies only within the project directory

Workspace settings take precedence over user settings when both exist.

## Settings Categories

The settings are organized into 14 categories:

1. **General** — Core behavior including Plan Mode, Vim mode, session cleanup, notifications
2. **Output** — CLI output format (text or JSON)
3. **UI** — Visual presentation, themes, footers, accessibility
4. **IDE** — IDE integration mode
5. **Billing** — Overage strategy for quota exhaustion
6. **Model** — Model selection, context compression, session limits
7. **Agents** — Browser agent security settings
8. **Context** — Memory discovery, file filtering, ignore patterns
9. **Tools** — Shell behavior, sandboxing, search options
10. **Security** — Tool sandboxing, YOLO mode, folder trust, environment redaction, context-aware security
11. **Advanced** — Node.js memory configuration, .env handling
12. **Experimental** — Voice Mode, Memory v2, Gemma models, model steering
13. **Skills** — Agent skills toggle
14. **HooksConfig** — Hooks system and notifications

## Key Settings Highlights

### Plan Mode Configuration

Plan Mode has its own settings hierarchy under `general.plan.*`:
- `enabled` — Enable Plan Mode (default: true)
- `directory` — Custom directory for planning artifacts
- `modelRouting` — Auto-switch between Pro (planning) and Flash (implementation)

### Memory v2 Architecture

Memory v2 (`experimental.memoryV2`, default: true) replaces the legacy `save_memory` tool with direct markdown editing. It routes facts across four tiers:

1. **Team-shared conventions** → project `GEMINI.md` files
2. **Project-specific personal notes** → per-project private memory folder (`MEMORY.md` as index + sibling files)
3. **Cross-project personal preferences** → global `~/.gemini/GEMINI.md`

The agent can only edit `~/.gemini/GEMINI.md` under the global settings directory — other `~/.gemini/` files remain off-limits.

### Security Features

Multiple layers of security configuration:
- **Tool sandboxing** (`security.toolSandboxing`) — Isolates individual tools, disabled by default
- **YOLO mode** — Auto-approve all actions; only available via command-line `--yolo` flag, not via `/settings`
- **Folder Trust** (`security.folderTrust.enabled`) — Track trust levels for workspace directories
- **Context-Aware Security** (`security.enableConseca`) — LLM-based dynamic policy generation
- **Environment variable redaction** — Redact secrets from environment variables

### Voice Mode

Experimental voice dictation with configuration options:
- `experimental.voiceMode` — Master toggle (default: false)
- `experimental.voice.activationMode` — Push-to-talk behavior
- `experimental.voice.backend` — Transcription backend (Gemini Live sends recordings to Google Cloud)

### Auto Memory

Background memory extraction system (`experimental.autoMemory`, default: false):
- Extracts patches from past sessions
- Writes unified diff `.patch` files to `<projectMemoryDir>/.inbox/<kind>/`
- Review via `/memory inbox` command before applying

## Important Behavioral Notes

1. **YOLO mode is CLI-only** — Cannot be set via `/settings` UI, only via `--yolo` or `--approval-mode=yolo` flags
2. **Tool sandboxing defaults to false** — Despite emphasis on security, this feature is disabled by default
3. **Memory v2 defaults to true** — Users may not realize behavior changes from the legacy save_memory tool
4. **Voice Mode has privacy implications** — Gemini Live backend sends recordings to Google Cloud for transcription