---
type: concept
title: "Enterprise Configuration"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "enterprise"
  - "configuration"
  - "administration"
  - "security"
related:
  - "[[settings-precedence]]"
  - "[[wrapper-scripts]]"
  - "[[user-isolation]]"
  - "[[tool-allowlisting]]"
  - "[[yolo-mode]]"
  - "[[mcp-server-management]]"
  - "[[sandboxing]]"
  - "[[telemetry-and-auditing]]"
  - "[[enterprise-authentication]]"
sources: ["2. Enterprise configuration.md"]
---

# Enterprise Configuration

Enterprise configuration refers to the system-wide management and deployment of [[gemini-cli]] settings across an organization. It enables IT administrators to enforce security policies, manage tool access, and ensure consistent user experiences.

## Overview

The enterprise configuration system relies on **centralized configuration files** that override user-level settings. These files are merged according to a defined [[settings-precedence]] hierarchy, ensuring that organizational policies take precedence over individual preferences.

## Key Components

### System Settings File

The system settings file is the primary configuration mechanism for enterprise deployments:

| Operating System | File Path |
|------------------|-----------|
| Linux | `/etc/gemini-cli/settings.json` |
| Windows | `C:\ProgramData\gemini-cli\settings.json` |
| macOS | `/Library/Application Support/GeminiCli/settings.json` |

The path can be overridden using the `GEMINI_CLI_SYSTEM_SETTINGS_PATH` environment variable.

### Enforcement Mechanisms

To prevent users from bypassing centrally managed configuration, enterprises deploy [[wrapper-scripts]] that ensure the system settings path is always enforced.

### User Isolation

In shared compute environments, [[user-isolation]] is achieved by setting the `GEMINI_CLI_HOME` environment variable to isolate state for specific jobs or users.

## Security Architecture

Enterprise security combines multiple layers:

1. **[[tool-allowlisting]]** — Explicit `coreTools` list specifies approved tools
2. **[[yolo-mode]]** — `disableYoloMode` forces confirmation for all tool executions
3. **[[sandboxing]]** — Docker containerization for isolated execution
4. **[[mcp-server-management]]** — MCP catalog enforcement via `mcp.allowed`

## Related Concepts

- [[settings-precedence]] — Understanding the four-level merge order
- [[wrapper-scripts]] — Preventing configuration bypass
- [[telemetry-and-auditing]] — Compliance and logging configuration
- [[enterprise-authentication]] — Authentication enforcement

---