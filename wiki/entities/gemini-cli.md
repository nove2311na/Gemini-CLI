---
type: entity
title: "@google/gemini-cli"
created: 2026-05-05
updated: 2026-05-05
tags: ["npm-package", "cli", "google"]
related: ["@google/gemini-cli-core", "monorepo-structure", "bundled-vs-unbundled"]
sources: ["5. NPM package structure.md"]
---

# @google/gemini-cli

`@google/gemini-cli` is the main NPM package for the Gemini CLI application. It is responsible for the user interface, command parsing, and all other user-facing functionality.

## Package Overview

As the primary entry point for the [[gemini-cli]], this package handles:

- **User Interface**: The interactive terminal experience and REPL loop
- **Command Parsing**: Interpreting user commands and routing to appropriate handlers
- **Integration**: Coordinating with the core package for API operations

## Distribution Method

When published, this package is **bundled into a single executable file** using esbuild. The bundle includes all dependencies, including [[@google/gemini-cli-core]]. This approach ensures that end users receive a self-contained executable that requires no additional installation steps beyond downloading and running the binary.

## Architecture Context

The relationship between this package and [[@google/gemini-cli-core]] exemplifies the [[monorepo-structure]]. The core package is bundled into this main package at build time, meaning that updates to the CLI typically include both the UI changes and any core logic updates in a single release.

## See Also

- [[@google/gemini-cli-core]] — Core logic package bundled into this package
- [[monorepo-structure]] — Explanation of the two-package architecture
- [[bundled-vs-unbundled]] — Technical details on distribution methods