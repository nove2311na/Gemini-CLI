---
type: source
title: "Sandboxing in Gemini CLI"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "sandboxing"
  - "security"
  - "docker"
  - "containers"
  - "configuration"
related:
  - "[[sandboxing]]"
  - "[[shells-command]]"
  - "[[confirmation-prompts]]"
  - "[[run-shell-command-tool]]"
sources: ["III. 18. Sandboxing in Gemini CLI.md"]
authors: []
year: 2026
url: "https://geminicli.com/docs/cli/sandbox/"
venue: "geminicli.com"
---

# Sandboxing in Gemini CLI

This official documentation covers the sandboxing capabilities of Gemini CLI, which isolates potentially dangerous operations (shell commands, file modifications) from the host system using multiple backend options including Docker, Podman, macOS Seatbelt, Windows Native Sandbox, gVisor, and LXC/LXD.

## Key Sections

- **Prerequisites and Quickstart**: Enable sandboxing via command flag (`-s`), environment variable (`GEMINI_SANDBOX`), or settings file
- **Sandboxing Methods**: Five platform-specific approaches with different isolation levels and prerequisites
- **Tool Sandboxing**: Granular per-tool isolation alternative to full-process sandboxing
- **Sandbox Expansion**: Dynamic permission requests when commands need extra access
- **Workspace Mounting**: Host directory bind-mounted at identical absolute path inside container
- **Advanced Settings**: Custom sandbox flags and Linux UID/GID handling
- **Troubleshooting**: Debug commands and common issues resolution

## Core Concepts Covered

- Container-based sandboxing with Docker/Podman
- macOS Seatbelt profiles (`permissive-open`, `strict-proxied`, etc.)
- Windows integrity level persistence side effects
- gVisor/runsc for strongest Linux isolation
- LXC/LXD for full-system container sandboxing
- Tool-level vs. full-process sandboxing trade-offs
- Docker-in-Docker setup requirements

## Related Pages

- [[sandboxing]] — Canonical documentation on sandboxing concepts
- [[sandbox-expansion]] — Dynamic permission escalation workflow
- [[sandbox-profiles]] — macOS Seatbelt profile reference
- [[shells-command]] — Core use case for sandboxing
- [[tool-level-sandboxing]] — Granular tool isolation approach
- [[workspace-mounting]] — Technical details on path preservation
- [[confirmation-prompts]] — User approval mechanisms including sandbox expansion