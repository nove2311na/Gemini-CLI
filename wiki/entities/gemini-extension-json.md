---
type: entity
title: "gemini-extension.json"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "manifest"
  - "configuration"
related:
  - "[[extensions]]"
  - "[[gemini-cli-extensions]]"
  - "[[extension-settings]]"
  - "[[extension-custom-commands]]"
  - "[[extension-policies]]"
  - "[[5. Extension reference]]"
sources: ["4. Release extensions.md", "5. Extension reference.md"]
---

# gemini-extension.json

The `gemini-extension.json` file is the manifest that defines the behavior and configuration of a Gemini CLI extension. Every extension must have this file in its root directory. Gemini CLI loads extensions from `<home>/.gemini/extensions` and validates the manifest on startup.

## Schema

```json
{
  "name": "my-extension",
  "version": "1.0.0",
  "description": "My awesome extension",
  "mcpServers": {
    "my-server": {
      "command": "node",
      "args": ["${extensionPath}/my-server.js"],
      "cwd": "${extensionPath}"
    }
  },
  "contextFileName": "GEMINI.md",
  "excludeTools": ["run_shell_command"],
  "migratedTo": "https://github.com/new-owner/new-extension-repo",
  "plan": {
    "directory": ".gemini/plans"
  }
}
```

## Fields

### name (required)
The unique identifier for the extension. This name is used for conflict resolution when extension commands have the same name as user or project commands. The name should be lowercase or numbers and use dashes instead of underscores or spaces. The name must match the extension directory name.

### version (required)
The semantic version of the extension following semver format.

### description
A short description of the extension displayed on the extension gallery at geminicli.com/extensions.

### mcpServers
A map of MCP server configurations. Each key is the server name, and the value contains the server settings. These servers are loaded on startup just like MCP servers defined in `settings.json`. If both an extension and `settings.json` define an MCP server with the same name, the `settings.json` definition takes precedence.

All standard MCP server configuration options are supported except for `trust`. Use `${extensionPath}` for portability when referring to files within the extension directory.

### contextFileName
The name of the context file to load from the extension directory. If not specified but a `GEMINI.md` file exists in the extension directory, that file will be loaded automatically.

### excludeTools
An array of tool names to exclude from the model. Supports command-specific restrictions using syntax like `"excludeTools": ["run_shell_command(rm -rf)"]` to block specific commands. This differs from MCP server `excludeTools` functionality.

### migratedTo
The URL of the new repository source. When set, the CLI automatically checks this new source for updates and migrates the installation if an update is found.

### plan.directory
The directory where planning artifacts are stored. Serves as a fallback if the user hasn't specified a plan directory. Default is `~/.gemini/tmp/<project>/<session-id>/plans/`.

## Loading and Merging

When Gemini CLI starts, it loads all extensions and merges their configurations. Workspace configuration takes precedence when conflicts occur.

## Settings

Extensions can define settings for user configuration like API keys by adding a `settings` array:

```json
{
  "settings": [
    {
      "name": "API Key",
      "description": "Your API key for the service.",
      "envVar": "MY_API_KEY",
      "sensitive": true
    }
  ]
}
```

Each setting has a display `name`, `description`, environment variable `envVar`, and `sensitive` flag. Sensitive values are stored in the system keychain and obfuscated in the UI. See [[extension-settings]] for details.