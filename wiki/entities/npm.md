---
type: entity
title: "npm"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "package-manager"
  - "node-js"
  - "installation"
related:
  - "[[gemini-cli]]"
  - "[[node-js]]"
  - "[[gemini-cli-setup]]"
  - "[[homebrew]]"
sources: ["3. Gemini CLI installation, execution, and releases.md"]
---

# npm

npm (Node Package Manager) is the default package manager for Node.js, used to install, share, and manage JavaScript code packages. It serves as the recommended installation method for [[gemini-cli]].

## Overview

npm is the primary and recommended method for installing [[gemini-cli]] globally on development machines. The official package `@google/gemini-cli` is published to the npm registry and updated according to the [[gemini-cli-releases]] schedule.

## Installation Command

The standard installation command for Gemini CLI using npm is:

```bash
npm install -g @google/gemini-cli
```

This installs Gemini CLI globally, making the `gemini` command available system-wide.

## Package Details

| Field | Value |
|-------|-------|
| Package Name | `@google/gemini-cli` |
| Installation Scope | Global (`-g` flag) |
| Registry | npmjs.com |
| Update Method | Re-run installation command |

## Updating via npm

To update to the latest stable release:

```bash
npm update -g @google/gemini-cli
```

To install a specific release channel:

```bash
npm install -g @google/gemini-cli@preview  # Preview release
npm install -g @google/gemini-cli@nightly   # Nightly release
```

## Relationship to Gemini CLI

npm is the officially recommended installation path for [[gemini-cli]], providing the most straightforward and widely-supported method for adding Gemini CLI to any development environment with Node.js installed.

## See Also

- [[gemini-cli-setup]] — Complete installation guide
- [[node-js]] — Runtime requirement for npm and Gemini CLI
- [[gemini-cli-releases]] — Release channel management via npm
- [[homebrew]] — Alternative package manager option