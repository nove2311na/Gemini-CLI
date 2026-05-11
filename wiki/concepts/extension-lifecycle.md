---
type: concept
title: "Extension Lifecycle"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensions"
  - "lifecycle"
related:
  - "[[extensions]]"
  - "[[extension-linking]]"
  - "[[gemini-extension-manifest]]"
  - "[[extension-settings]]"
sources: ["2. Build Gemini CLI extensions.md"]
---

# Extension Lifecycle

Extensions follow a lifecycle from creation through development, installation, and optionally release to the community.

## Phases

### 1. Creation

Create a new extension using the template command:

```bash
gemini extensions new <name> <template>
```

Templates available:
- `mcp-server` - Full MCP server with SDK
- `command` - Custom commands only
- `context` - Context files only

This scaffolds the directory structure with `gemini-extension.json` and starter files.

### 2. Development

During development, link the extension for immediate testing:

```bash
gemini extensions link .
```

Changes to code are reflected after restarting the session. Manifest changes also require restart.

### 3. Configuration

If the extension defines settings, users are prompted to configure them at install time. Sensitive values are stored securely in the keychain.

### 4. Installation

For users, install the extension by cloning the git repository or installing from the gallery. The manifest is validated and dependencies are installed.

### 5. Activation

On each Gemini CLI session start:
1. Installed extensions are discovered
2. Settings are loaded from keychain
3. MCP servers are started
4. Context files are loaded
5. Skills are registered for discovery

### 6. Execution

During conversation:
- MCP tools are available to the model when relevant
- Custom commands are available to users
- Hooks intercept lifecycle events
- Skills activate based on task detection

### 7. Deactivation

On session end:
- MCP servers are terminated
- State is preserved for session resume

### 8. Unlinking/Uninstalling

```bash
gemini extensions unlink <name>  # Development
gemini extensions uninstall <name>  # Production
```

## Lifecycle Events (Hooks)

Extensions can intercept lifecycle events through hooks:
- `before-tool-call`
- `after-tool-call`
- `before-message`
- `after-message`

This enables logging, validation, and modification of CLI behavior.