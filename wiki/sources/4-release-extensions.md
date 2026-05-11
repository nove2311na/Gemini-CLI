---
type: source
title: "Release extensions"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "distribution"
  - "publishing"
  - "gallery"
related:
  - "[[1-gemini-cli-extensions]]"
  - "[[gemini-cli-extensions]]"
  - "[[gemini-cli-extension-gallery]]"
  - "[[extension-distribution]]"
  - "[[extension-gallery-discovery]]"
  - "[[extension-migration]]"
  - "[[platform-specific-archives]]"
sources: ["4. Release extensions.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/extensions/releasing/"
venue: "gemini-cli documentation"
---

# Release extensions

This document covers the distribution and publishing workflow for Gemini CLI extensions. It explains two primary distribution channels—Git repositories and GitHub Releases—along with automatic gallery discovery, platform-specific archive naming, and repository migration procedures.

## Key Topics

### Distribution Methods

Extensions can be released through Git repositories (flexible, clone-based) or GitHub Releases (archive-based, faster initial install). Git is simpler and supports development branches; GitHub Releases avoid full clones and support platform-specific binaries.

### Gallery Discovery

Public extensions with the `gemini-cli-extension` GitHub topic are automatically indexed by the extension gallery crawler. No submission process is required—discovery happens daily via topic-based indexing.

### Archive Requirements

Custom archives must be self-contained with `gemini-extension.json` at the root. Platform-specific naming follows the pattern `{platform}.{arch}.{name}.{extension}` (e.g., `darwin.arm64.my-tool.tar.gz`).

### Migration Path

The `migratedTo` property in the manifest enables seamless user transitions when moving repositories, preserving all extension settings.

## Practical Applications

Extension authors use this guide to choose distribution strategies, configure automated releases via GitHub Actions, and manage repository transitions without breaking user installations.

## Related Documentation

- [[1-gemini-cli-extensions]] — Extension system overview
- [[extension-distribution]] — Detailed comparison of Git vs. GitHub Releases
- [[extension-gallery-discovery]] — Topic-based gallery indexing mechanics
- [[extension-migration]] — migratedTo workflow for repository transitions
- [[platform-specific-archives]] — Multi-platform archive naming conventions