---
type: source
title: "Gemini CLI Installation, Execution, and Releases"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "installation"
  - "setup"
  - "releases"
  - "official-documentation"
related:
  - "[[gemini-cli]]"
  - "[[gemini-cli-setup]]"
  - "[[gemini-cli-releases]]"
  - "[[npm]]"
  - "[[homebrew]]"
sources: ["3. Gemini CLI installation, execution, and releases.md"]
---

# Gemini CLI Installation, Execution, and Releases

This document provides the official guidance for setting up [[gemini-cli]] on your development environment, understanding system requirements, and navigating the release channels.

## System Requirements Overview

Before installation, ensure your environment meets the following prerequisites:

- **Operating Systems:** macOS 15+, Windows 11 24H2+, or Ubuntu 20.04+
- **Hardware:** 4GB+ RAM for casual use, 16GB+ RAM for power use scenarios
- **Runtime:** [[Node.js]] 20.0.0 or higher
- **Shell Compatibility:** Bash, Zsh, or PowerShell
- **Location:** Must be in [[Gemini Code Assist]] supported regions
- **Internet connection required**

## Installation Methods

### Recommended: npm Global Install

The primary and recommended installation method uses [[npm]] to install globally:

```bash
npm install -g @google/gemini-cli
```

### Package Managers

Additional installation options include:

- **[[Homebrew]]:** Available for macOS and Linux
- **[[MacPorts]]:** macOS-specific option
- **[[Anaconda]]:** Python-focused environment option

### Pre-installed Environments

For zero-installation scenarios, Gemini CLI comes pre-installed on:

- **[[Cloud Shell]]:** Google's browser-based shell environment
- **[[Cloud Workstations]]:** Managed cloud-based workstation service

## Running Gemini CLI

### Standard Execution

Run Gemini CLI using the `gemini` command:

```bash
gemini
```

### Advanced Execution Methods

#### npx (No Installation Required)

Run instantly without permanent installation:

```bash
npx @google/gemini-cli
```

#### Bleeding-Edge from GitHub

Execute directly from the main branch for testing development features:

```bash
npx https://github.com/google-gemini/gemini-cli
```

## Release Channels

Gemini CLI offers three release channels:

| Channel | Cadence | Tag | Recommended For |
|---------|---------|-----|-----------------|
| Stable | Weekly | `latest` | Most users (default) |
| Preview | Weekly | `preview` | Early adopters |
| Nightly | Daily | `nightly` | Contributors and testers |

The stable release is the default installation and recommended for most users.

## Key Takeaways

- Start with npm as the standard installation method
- Use [[Cloud Shell]] for zero-configuration trials
- Stick to stable releases unless you need preview features
- Ensure your location is within supported Google Code Assist regions

## See Also

- [[gemini-cli-setup]] — Detailed setup and troubleshooting guide
- [[gemini-cli-releases]] — Release channel specifics and update management
- [[1-gemini-cli-extensions]] — Extending Gemini CLI capabilities