---
type: source
title: "IDE Integration"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "ide-integration"
  - "vs-code"
  - "acp"
  - "companion-extension"
related:
  - "[[ide-integration]]"
  - "[[gemini-cli-companion-extension]]"
  - "[[agent-client-protocol]]"
  - "[[ide-command]]"
  - "[[workspace-context]]"
  - "[[native-diffing]]"
sources: ["1. IDE Integration.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/ide-integration/"
venue: "gemini-cli documentation"
---

# IDE Integration

This source document covers the two primary methods for integrating Gemini CLI with Integrated Development Environments (IDEs): the VS Code companion extension and the Agent Client Protocol (ACP).

## Key Points

### VS Code Companion Extension

The **Gemini CLI Companion extension** provides real-time context awareness and native diffing capabilities. Key features include workspace context (10 most recent files, cursor position, text selection up to 16KB), native diff viewing, and VS Code Command Palette integration with commands like `Gemini CLI: Run`, `Gemini CLI: Accept Diff`, and `Gemini CLI: Close Diff Editor`.

Installation is available through three methods: automatic prompt when running in a supported editor, manual CLI installation via `/ide install`, or direct marketplace installation from VS Code Marketplace or Open VSX Registry.

### Agent Client Protocol (ACP)

ACP is an open protocol that standardizes AI coding agent communication with IDEs, addressing fragmented distribution challenges. Gemini CLI is officially available in the ACP Agent Registry, enabling discovery and installation directly within supporting IDEs like JetBrains and Zed.

### Integration Commands

The `/ide` command group provides control over IDE integration: `/ide enable` and `/ide disable` control the connection, while `/ide status` displays connection status and workspace context.

### Sandboxing Considerations

IDE integration requires special attention in sandboxed environments. On macOS, a Seatbelt profile allowing network access is required. In Docker containers, the CLI automatically connects via `host.docker.internal`.

## Related Documentation

- Troubleshooting connection errors and directory mismatches
- Manual PID override via `GEMINI_CLI_IDE_PID` environment variable
- Configuration errors for unsupported environments