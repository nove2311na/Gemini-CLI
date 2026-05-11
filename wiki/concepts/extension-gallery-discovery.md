---
type: concept
title: "Extension gallery discovery"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "gallery"
  - "discovery"
  - "indexing"
related:
  - "[[gemini-cli-extension-gallery]]"
  - "[[gemini-cli-extensions]]"
  - "[[extension-distribution]]"
  - "[[gemini-extension-json]]"
  - "[[4-release-extensions]]"
sources: ["4. Release extensions.md"]
---

# Extension gallery discovery

The automatic process by which public Gemini CLI extensions become visible in the extension gallery. Discovery is topic-based, requiring no submission process or manual intervention from extension authors.

## Discovery Mechanism

The gallery crawler uses GitHub's topic system to find extensions:

1. Repository must be public
2. Repository must have the `gemini-cli-extension` topic
3. Repository must have `gemini-extension.json` at the root
4. Crawler runs daily and indexes qualifying repositories

## Requirements for Discovery

| Requirement | Description |
|-------------|-------------|
| Public repository | Must be accessible without authentication |
| GitHub topic | Must include `gemini-cli-extension` in repository topics |
| Manifest location | `gemini-extension.json` must be at absolute root |
| Validation | Repository must pass validation checks |

## Timeline

After tagging a repository:
- Crawler runs daily
- Extension appears once indexed (typically within 24-48 hours)
- No notification sent to authors

## Implications for Extension Authors

- **No gatekeeping** — Any public repository with the topic is discoverable
- **Self-service** — No approval process or submission required
- **Responsibility** — Authors control their own quality and validation
- **Discoverability** — Proper metadata in `gemini-extension.json` improves visibility

## Discovery vs. Installation

Discovery refers to the gallery indexing process. Installation is a separate step where users choose to install a discovered extension. The gallery provides browsing and discovery; the CLI handles installation.

## Related Concepts

- [[gemini-cli-extension-gallery]] — The browsing and discovery platform
- [[gemini-cli-extensions]] — Extension system overview
- [[extension-distribution]] — Distribution channel options
- [[gemini-extension-json]] — Manifest file requirements