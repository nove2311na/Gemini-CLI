---
type: concept
title: "Extension Development Workflow"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensions"
  - "development"
  - "workflow"
related:
  - "[[gemini-cli-extensions]]"
  - "[[extension-structure]]"
  - "[[extension-security-best-practices]]"
sources: ["3. Gemini CLI extension best practices.md"]
---

# Extension Development Workflow

Developing extensions for Gemini CLI is a lightweight, iterative process. This page documents the recommended workflow for creating, testing, and refining extensions.

## Local Development with Link

The primary workflow for developing extensions locally uses `gemini extensions link`. This command creates a symbolic link to your extension directory, allowing development without reinstallation.

### Basic Workflow

```bash
cd my-extension
gemini extensions link .
```

After linking, changes to your code are immediately available in the CLI after rebuilding and restarting the session.

### Iteration Pattern

1. Make code changes in your editor
2. Rebuild the project (`npm run build` or similar)
3. Restart the Gemini CLI session
4. Test changes interactively
5. Repeat

This cycle allows rapid development without the overhead of uninstalling and reinstalling the extension for each change.

## Project Setup

### Initialize Project Structure

Create the recommended [[extension-structure]] with `src/` and `dist/` directories, TypeScript configuration, and manifest file.

### Configure Build Process

Set up a build script that compiles TypeScript and bundles dependencies. Common tools include:
- `tsc` for TypeScript compilation
- `esbuild` for bundling
- `npm scripts` or `tsx` for development watching

## Testing Strategies

### Manual Testing

Use `gemini extensions link` to test your extension in a live CLI session:

1. Verify that tools appear in the debug console (F12)
2. Test custom commands resolve correctly
3. Check that settings are recognized
4. Exercise each tool with various inputs

### Automated Testing

For extensions with MCP server components, write unit tests using Vitest or Jest. MCP tools can be tested in isolation by mocking the transport layer.

## Troubleshooting During Development

### Extension Not Loading

If your extension doesn't appear in `/extensions list`:
- Check that `gemini-extension.json` is in the root directory
- Verify the manifest contains valid JSON
- Ensure the `name` field matches the directory name exactly
- **Restart the CLI** after making changes to the manifest

### MCP Server Failures

If tools aren't working as expected:
- View CLI logs to check if the MCP server failed to start
- Run the server's `command` and `args` directly in your terminal
- Press **F12** to open the debug console and inspect tool calls and responses

## Related Concepts

- [[gemini-cli-extensions]] — Overview of extension system
- [[extension-structure]] — Project layout recommendations
- [[extension-security-best-practices]] — Security considerations during development
- [[extension-release-practices]] — Releasing the completed extension