---
type: concept
title: "NPM Workspaces"
created: 2026-05-05
updated: 2026-05-05
tags: ["npm", "monorepo", "development-tools"]
related: ["monorepo-structure", "@google/gemini-cli", "@google/gemini-cli-core"]
sources: ["5. NPM package structure.md"]
---

# NPM Workspaces

NPM Workspaces is a directory-based monorepo management system that simplifies how NPM handles local packages within a single root package. The Gemini CLI project uses this feature to manage its [[monorepo-structure]] containing [[@google/gemini-cli]] and [[@google/gemini-cli-core]].

## Configuration

Workspaces are defined in the root `package.json` file:

```json
{
  "workspaces": ["packages/*"]
}
```

This configuration tells NPM to treat all directories under `packages/` as workspace packages, automatically linking them into the monorepo.

## Key Features

### Simplified Dependency Management

Running `npm install` from the root directory installs dependencies for all workspace packages in a single command. NPM hoists shared dependencies to the root, reducing duplication and disk space usage.

### Automatic Symlinking

Packages within the workspace are symlinked automatically. This means that changes to [[@google/gemini-cli-core]] are immediately visible to [[@google/gemini-cli]] without requiring manual linking or publishing.

### Workspace-Scoped Script Execution

The `--workspace` flag enables running scripts in specific packages:

```bash
# Build only the main CLI package
npm run build --workspace @google/gemini-cli

# Run tests only for the core package
npm run test --workspace @google/gemini-cli-core

# Run a script across all workspaces
npm run build --workspaces
```

## Benefits for Gemini CLI Development

1. **Consistent Environment**: All developers work with the same dependency versions
2. **Fast Iteration**: Changes to one package are immediately available to dependent packages
3. **Unified Tooling**: A single `package.json` at the root manages scripts for all packages
4. **Easier Testing**: Tests can be run across all packages from the root

## See Also

- [[monorepo-structure]] — Overview of the two-package architecture
- [[@google/gemini-cli]] — Main package using workspace features
- [[@google/gemini-cli-core]] — Core package using workspace features