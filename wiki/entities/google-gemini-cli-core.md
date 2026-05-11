---
type: entity
title: "@google/gemini-cli-core"
created: 2026-05-05
updated: 2026-05-05
tags: ["npm-package", "core", "google"]
related: ["@google/gemini-cli", "monorepo-structure", "bundled-vs-unbundled"]
sources: ["5. NPM package structure.md"]
---

# @google/gemini-cli-core

`@google/gemini-cli-core` is the core NPM package containing the business logic for interacting with the Gemini API. Unlike [[@google/gemini-cli]], this package is published as a **standard Node.js package** with its own dependencies rather than being bundled into a single executable.

## Package Responsibilities

The core package handles the essential backend operations:

- **API Requests**: Communicating with the Gemini API endpoints
- **Authentication**: Managing API key validation and user credentials
- **Local Cache Management**: Handling token caching and response caching for cost optimization

## Independent Distribution

Because this package is published as a standard Node.js package, it can be consumed independently by other Node.js applications. This architectural decision enables third-party developers to build tools that leverage the Gemini API functionality without depending on the full CLI application.

## Relationship to Main Package

[[@google/gemini-cli]] bundles this package during its build process, creating a single executable that includes both the UI layer and core logic. However, the core package maintains its own release cycle, allowing for updates to API handling or caching logic without requiring a full CLI release.

## Architecture Context

This package exemplifies the [[monorepo-structure]] design principle of separating concerns between user interface and core logic. The [[bundled-vs-unbundled]] distinction explains the different distribution strategies for these two packages.

## See Also

- [[@google/gemini-cli]] — Main CLI package that bundles this core package
- [[monorepo-structure]] — Explanation of the two-package architecture
- [[bundled-vs-unbundled]] — Technical details on distribution methods