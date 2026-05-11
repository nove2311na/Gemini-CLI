---
type: source
title: "Gemini CLI cheatsheet"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "reference"
  - "cheatsheet"
  - "cli"
related:
  - "[[gemini-cli]]"
  - "[[cli-options]]"
  - "[[model-aliases]]"
  - "[[approval-modes]]"
  - "[[mcp-server-management]]"
  - "[[agent-skills]]"
  - "[[output-formats]]"
sources: ["5. Gemini CLI cheatsheet.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/cli-reference/"
venue: "geminicli.com"
---

# Gemini CLI cheatsheet

This source provides a comprehensive command reference for Gemini CLI, covering CLI commands, interactive commands, CLI options, model selection, extensions management, MCP server management, and skills management. It serves as the primary reference document for the command-line interface.

## Key Sections

### CLI Commands

The cheatsheet documents multiple execution modes: interactive REPL, non-interactive queries with `-p`, piped content processing, and session resumption with `-r`. Session resumption supports `latest`, numeric indices, and arbitrary session IDs.

### CLI Options

Comprehensive coverage of all command-line flags including `--debug`, `--model`, `--prompt`, `--sandbox`, `--skip-trust`, `--approval-mode`, `--worktree`, and various session management options. The document notes that `--yolo` and `--allowed-tools` are deprecated in favor of `--approval-mode=yolo` and the Policy Engine.

### Model Selection

Documents the alias system with `auto`, `pro`, `flash`, and `flash-lite` shortcuts that resolve to concrete model names. The `auto` alias defaults to `gemini-2.5-pro` or `gemini-3-pro-preview` depending on preview settings.

### Extensions Management

Full command reference for extension lifecycle: install, uninstall, list, update, enable, disable, link, new, and validate. Extensions can be installed from Git URLs, local paths, with specific branches or tags, and with auto-update enabled.

### MCP Server Management

Documents adding stdio-based and HTTP-based MCP servers with environment variables, scopes, and tool filtering. Commands include `add`, `remove`, and `list` operations.

### Skills Management

Distinguishes skills from extensions as a separate extensibility mechanism. Skills are discovered agent capabilities managed through `list`, `install`, `link`, `uninstall`, `enable`, and `disable` commands.

## Important Distinctions

- **CLI options vs interactive commands**: CLI flags apply to command invocation, while interactive commands like `/skills reload` are REPL-only
- **Skills vs extensions**: Two distinct extensibility systems documented separately
- **Experimental features**: `--experimental-acp`, `--experimental-zed-integration`, and `--worktree` are marked experimental without detailed documentation

## Related Documentation

- [Extensions Documentation](https://geminicli.com/docs/extensions)
- [MCP Server Integration](https://geminicli.com/docs/tools/mcp-server)
- [Agent Skills Documentation](https://geminicli.com/docs/cli/skills)