---
type: concept
title: "Release Channels"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "installation"
  - "releases"
  - "versioning"
related:
  - "[[gemini-cli]]"
  - "[[npm]]"
sources: ["3-gemini-cli-installation-execution-and-releases.md"]
---

# Release Channels

Gemini CLI offers three distinct release channels to balance stability with early access to new features. This tiered approach allows users to choose the version that best fits their risk tolerance and development needs.

## Available Channels

### 1. Stable Release (Default)
The Stable channel is the recommended version for most users. It provides a reliable experience with tested features.
- **Frequency:** Published weekly.
- **Source:** Created from the previous week's Preview release, incorporating any critical bug fixes.
- **Tag:** Uses the `latest` tag on npm.
- **Installation:** `npm install -g @google/gemini-cli` or `npm install -g @google/gemini-cli@latest`.

### 2. Preview Release
The Preview channel contains new features and improvements that are being prepared for the Stable release. It is suitable for users who want to try upcoming features before they are finalized.
- **Tag:** Uses the `preview` tag on npm.
- **Installation:** `npm install -g @google/gemini-cli@preview`.

### 3. Nightly Release
The Nightly channel provides the most bleeding-edge version of Gemini CLI, built directly from the latest development branches. It may contain experimental features and is less stable than the other channels.
- **Tag:** Uses the `nightly` tag on npm.
- **Installation:** `npm install -g @google/gemini-cli@nightly`.

## Managing Releases

Users can easily switch between channels or update to the latest version within their current channel:

- **Update to Latest Stable:** `gemini update`
- **Install Specific Channel:** Use the `@tag` syntax with `npm install`.

## See Also

- [[npm]] — The primary distribution platform for Gemini CLI releases
- [[gemini-cli]] — The main application distributed through these channels
