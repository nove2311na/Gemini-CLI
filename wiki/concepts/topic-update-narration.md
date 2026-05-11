---
type: concept
title: "Topic & Update Narration"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "communication"
  - "ui"
  - "settings"
  - "verbosity"
related:
  - "/settings-command"
  - "settings-json"
  - "combined-workflows"
sources: ["6. Settings.md"]
---

# Topic & Update Narration

Topic & Update Narration is a communication model that reduces verbosity and provides structured progress reporting. It is controlled by the `general.topicUpdateNarration` setting.

## Default Behavior

By default, Topic & Update Narration is **enabled** (`true`). This means users receive more structured, concise updates rather than verbose continuous narration.

```json
{
  "general": {
    "topicUpdateNarration": true
  }
}
```

## What It Affects

The setting controls how Gemini CLI communicates:

- **Reduced chattiness** — Less continuous narration during operations
- **Structured reporting** — Progress updates formatted as clear, discrete items
- **Topic-based updates** — Information grouped into logical topics

## When Disabled

Setting `topicUpdateNarration` to `false` returns to the default verbose mode with continuous status updates and more detailed explanations of ongoing processes.

## Related Concepts

- [[/settings-command]] — Managing this setting via the settings dialog
- [[settings-json]] — The underlying configuration structure
- [[combined-workflows]] — Using this setting within larger workflow patterns

## Further Research Needed

The exact scope of "reduced chattiness" is not fully documented. It may affect:

- Progress reporting verbosity
- Reasoning explanation detail
- Status update frequency
- Error message verbosity

Users seeking more verbose output should experiment with disabling this setting.