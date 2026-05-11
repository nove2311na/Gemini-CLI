---
---
type: entity
title: "Homebrew"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "package-manager"
  - "macos"
  - "linux"
  - "installation"
related:
  - "[[gemini-cli]]"
  - "[[gemini-cli-setup]]"
  - "[[npm]]"
  - "[[macports]]"
sources: ["3. Gemini CLI installation, execution, and releases.md"]
---

# Homebrew

Homebrew is a popular open-source package manager for macOS and Linux that simplifies software installation. It provides an alternative installation method for [[gemini-cli]] on these platforms.

## Overview

Homebrew offers a convenient way to install and manage [[gemini-cli]] for users who prefer package manager workflows or already use Homebrew for other development tools. The `brew` command handles dependencies and provides easy update mechanisms.

## Installation

While the specific Homebrew formula for Gemini CLI depends on community contributions, installation typically follows Homebrew conventions:

```bash
brew install gemini-cli
```

## Advantages

- **Dependency management** — Homebrew automatically resolves and installs dependencies
- **Easy updates** — `brew upgrade` updates all installed packages
- **Tab completion** — Built-in shell completion support
- **Cleanup utilities** — Automatic old version removal

## Platform Support

Homebrew officially supports:

- **macOS** — Primary platform with native bottles (pre-built binaries)
- **Linux** — Full functionality via Homebrew on Linux
- **Windows** — Limited support via Windows Subsystem for Linux (WSL)

## Relationship to Gemini CLI

Homebrew represents one of several installation options for [[gemini-cli]], alongside [[npm]] (the recommended method), [[MacPorts]], and [[Anaconda]]. Users already invested in the Homebrew ecosystem may prefer this approach.

## See Also

- [[gemini-cli-setup]] — Complete installation guide
- [[npm]] — The recommended installation method
- [[macports]] — Alternative macOS package manager
- [[gemini-cli-releases]] — Release channel information