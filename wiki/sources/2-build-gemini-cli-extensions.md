---
type: source
title: "Build Gemini CLI Extensions"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensions"
  - "tutorial"
  - "mcp"
  - "sdk"
related:
  - "[[gemini-cli-extensions]]"
  - "[[extensions]]"
  - "[[gemini-extension-manifest]]"
  - "[[mcp-server-integration]]"
  - "[[extension-linking]]"
  - "[[extension-settings]]"
sources: ["2. Build Gemini CLI extensions.md"]
---

# Build Gemini CLI Extensions

This tutorial provides a comprehensive guide to creating Gemini CLI extensions, from setting up a template to adding custom functionality and linking for local development.

## Extension Features Overview

Extensions offer six distinct feature types that can be mixed in any combination:

| Feature | Purpose | Invoked By |
|---------|---------|------------|
| **MCP servers** | Expose tools and data sources to the model | Model |
| **Custom commands** | Shortcuts for complex prompts or shell commands | User |
| **Context files (GEMINI.md)** | Persistent instructions loaded at session start | CLI → Model |
| **Agent skills** | Specialized workflows activated on-demand | Model |
| **Hooks** | Lifecycle event interceptors | CLI |
| **Custom themes** | UI color scheme personalization | User |

## Core Workflow

The tutorial walks through creating an MCP server extension using the `gemini extensions new` template command, which scaffolds a project with the required `gemini-extension.json` manifest, example server code using `@modelcontextprotocol/sdk`, and `package.json`.

Key steps include:
1. Creating a new extension from template
2. Understanding the manifest structure and `${extensionPath}` variable
3. Adding configurable settings with secure keychain storage
4. Linking for local development with hot-reload
5. Adding custom commands, context files, and agent skills
6. Releasing via Git/GitHub

## Key Technical Details

The manifest file (`gemini-extension.json`) defines extension metadata including name, version, MCP server configuration, settings schema, and context file references. Settings support sensitive flags for secure credential storage in the system keychain, with values injected as environment variables.

Extension linking creates symbolic links to the extensions directory, enabling immediate testing of changes without reinstallation.