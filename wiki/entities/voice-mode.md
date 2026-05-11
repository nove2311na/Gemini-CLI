---
type: entity
title: "Voice Mode"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "voice"
  - "experimental"
  - "gemini-cli"
related:
  - "[[settings-command]]"
  - "[[auto-memory]]"
  - "[[memory-v2]]"
sources: ["III. 19. Gemini CLI settings (`settings` command).md"]
---

# Voice Mode

Voice Mode is an experimental feature in Gemini CLI that enables voice dictation and voice commands for hands-free interaction.

## Overview

Voice Mode provides two primary capabilities:
- **Voice dictation** — Speak to input text into the CLI
- **Voice commands** — Issue commands using voice

## Enabling Voice Mode

Voice Mode is controlled by multiple settings under `experimental.voice.*`:

```json
{
  "experimental": {
    "voiceMode": true
  }
}
```

## Configuration Options

### Activation Mode

`experimental.voice.activationMode` controls how voice recording is triggered:

- `"push-to-talk"` — Press and hold Space to record (default)
- Other modes may be available in future versions

### Transcription Backend

`experimental.voice.backend` determines where voice recordings are processed:

| Backend | Behavior | Privacy |
|---------|----------|---------|
| `"gemini-live"` | Recordings sent to Google Cloud | Privacy implications |
| `"whisper"` | Local transcription using Whisper model | Privacy-preserving |

**Important**: When using the Gemini Live backend, voice recordings are sent to Google Cloud for transcription. This has significant privacy implications that users should understand before enabling.

### Whisper Model

`experimental.voice.whisperModel` specifies the local Whisper model for transcription when using the Whisper backend:

- Default: `"ggml-base.en.bin"`

### Stop Grace Period

`experimental.voice.stopGracePeriodMs` controls how long to wait for final transcription after stopping recording:

- Default: `1000` (1 second)

## Usage Commands

- `/voice` — Activate voice mode
- `/voice model` — Configure voice model settings

## Privacy Considerations

Users should be aware that:

1. **Gemini Live backend transmits data** — Voice recordings are sent to Google Cloud
2. **Whisper backend is local** — Provides privacy-preserving transcription option
3. **No on-device processing** (Gemini Live) — Data leaves the local machine

## Related Settings

- `experimental.voiceMode` — Master toggle
- `experimental.voice.activationMode` — Recording trigger
- `experimental.voice.backend` — Transcription backend
- `experimental.voice.whisperModel` — Local Whisper model
- `experimental.voice.stopGracePeriodMs` — Grace period after recording