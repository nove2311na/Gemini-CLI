---
type: concept
title: "Bundled vs Unbundled Distribution"
created: 2026-05-05
updated: 2026-05-05
tags: ["distribution", "build-process", "architecture"]
related: ["monorepo-structure", "@google/gemini-cli", "@google/gemini-cli-core"]
sources: ["5. NPM package structure.md"]
---

# Bundled vs Unbundled Distribution

The Gemini CLI project uses two distinct distribution strategies for its packages, representing a fundamental architectural decision in how the software reaches end users versus how it can be consumed by developers.

## Bundled Distribution: @google/gemini-cli

The main CLI package is **bundled** into a single executable file during the build process. This means:

- All dependencies are compiled into the executable
- The output is a standalone binary (typically using esbuild)
- Users download one file and can run it immediately
- No Node.js runtime or additional dependencies required on the user's machine

This approach prioritizes **ease of distribution and installation** for end users. When you download the Gemini CLI, you receive everything needed in a single file.

## Unbundled Distribution: @google/gemini-cli-core

The core package is **published as a standard npm package** with its own dependencies:

- Distributed through the npm registry like any typical Node.js package
- Dependencies are installed separately via `npm install`
- The package has its own version number and release cycle
- Can be added as a dependency in other Node.js projects

This approach prioritizes **flexibility and external consumption** by other applications.

## Implications

### Update Frequency

Because [[@google/gemini-cli-core]] maintains its own release cycle, core improvements (like better caching logic or API request handling) can be published independently. The main CLI package can then choose when to incorporate these updates.

### External Usage

Developers building tools that need Gemini API functionality can import [[@google/gemini-cli-core]] directly in their Node.js applications without bundling or distributing the full CLI.

### Installation Experience

| Aspect | Bundled Package | Unbundled Package |
|--------|-----------------|-------------------|
| End User Install | Single binary download | `npm install` + setup |
| Dependencies | Contained in executable | Installed separately |
| Update Method | Download new binary | `npm update` |
| Target Audience | CLI users | Developers |

## See Also

- [[monorepo-structure]] — Architecture context for this distribution choice
- [[@google/gemini-cli]] — Package using bundled distribution
- [[@google/gemini-cli-core]] — Package using unbundled distribution