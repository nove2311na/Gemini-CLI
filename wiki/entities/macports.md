---
type: entity
title: "MacPorts"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "package-manager"
  - "macos"
  - "installation"
related:
  - "[[gemini-cli]]"
  - "[[gemini-cli-setup]]"
  - "[[homebrew]]"
sources: ["3. Gemini CLI installation, execution, and releases.md"]
---

# MacPorts

MacPorts is a BSD-based package manager designed specifically for macOS, providing a way to install and manage Unix software on Apple systems. It offers an alternative installation method for [[gemini-cli]] on macOS.

## Overview

MacPorts takes a different approach than other package managers by building software from source with dependencies managed through a self-contained ports tree. This can offer advantages in terms of version control and avoiding conflicts with system software.

## Installation Method

MacPorts installs [[gemini-cli]] through its port system. Users with MacPorts already installed can use the standard port installation workflow.

## Key Characteristics

- **Source-based compilation** — Builds packages from source code
- **Self-contained** — Avoids conflicts with macOS system libraries
- **Port tree updates** — Regular synchronization with upstream sources
- **Active community** — Maintained ports for thousands of software packages

## Platform Support

MacPorts is available exclusively on macOS, with versions supporting multiple macOS releases.

## Relationship to Gemini CLI

MacPorts provides an installation alternative for macOS users who prefer its source-based approach or already use MacPorts for managing their development tools. It complements [[npm]] (the recommended method), [[Homebrew]], and [[Anaconda]] as package manager options.

## See Also

- [[gemini-cli-setup]] — Complete installation guide
- [[homebrew]] — Alternative macOS package manager
- [[npm]] — The recommended installation method
- [[gemini-cli-releases]] — Release channel information