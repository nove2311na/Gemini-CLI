---
type: concept
title: "Monorepo Structure"
created: 2026-05-05
updated: 2026-05-05
tags: ["architecture", "monorepo", "package-design"]
related: ["@google/gemini-cli", "@google/gemini-cli-core", "npm-workspaces", "bundled-vs-unbundled"]
sources: ["5. NPM package structure.md"]
---

# Monorepo Structure

The Gemini CLI project uses a **monorepo architecture** with two main packages that serve distinct purposes. This design separates concerns between user-facing functionality and core API logic, enabling independent distribution and maintenance of each component.

## Two-Package Architecture

The project is organized into two primary packages:

### [[@google/gemini-cli]]

The main package responsible for:
- User interface and terminal interaction
- Command parsing and routing
- User experience and workflow orchestration

This package is bundled into a single executable during the build process, creating a distributable binary for end users.

### [[@google/gemini-cli-core]]

The core package handling:
- Gemini API communication
- Authentication and credential management
- Token caching and cost optimization

This package is published independently as a standard Node.js package, allowing other applications to consume its functionality.

## Design Benefits

The monorepo structure provides several advantages:

1. **Shared Development**: Both packages can be developed and tested together in a single repository
2. **Atomic Changes**: Updates affecting both UI and core logic can be committed atomically
3. **Simplified Dependency Management**: Using [[npm-workspaces]], all dependencies are installed from a single root
4. **Independent Releases**: Each package can be published separately when needed
5. **External Consumption**: The core package can be used by third-party applications without the CLI

## Technical Implementation

The root `package.json` defines workspace configuration:

```json
{
  "workspaces": ["packages/*"]
}
```

This configuration enables the [[npm-workspaces]] features including automatic package linking and workspace-scoped script execution.

## Bundling Strategy

The distinction between how these packages are distributed reflects the [[bundled-vs-unbundled]] concept:

| Aspect | Main Package | Core Package |
|--------|--------------|--------------|
| Distribution | Single executable | Standard npm package |
| Dependencies | Bundled in | Installed separately |
| Update Cycle | Full CLI releases | Can update independently |

## See Also

- [[npm-workspaces]] — Technical implementation of the monorepo setup
- [[bundled-vs-unbundled]] — Detailed explanation of distribution methods
- [[@google/gemini-cli]] — Main CLI package documentation
- [[@google/gemini-cli-core]] — Core package documentation