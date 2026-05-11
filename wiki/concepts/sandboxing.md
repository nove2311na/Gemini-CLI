---
type: concept
title: "Sandboxing"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "security"
  - "isolation"
  - "docker"
  - "container"
  - "gemini-cli"
related:
  - "[[shells-command]]"
  - "[[confirmation-prompts]]"
  - "[[run-shell-command-tool]]"
  - "[[sandbox-expansion]]"
  - "[[sandbox-profiles]]"
  - "[[workspace-mounting]]"
  - "[[tool-level-sandboxing]]"
  - "[[container-based-sandboxing]]"
sources: ["4. Execute shell commands.md", "III. 18. Sandboxing in Gemini CLI.md"]
---

# Sandboxing

Sandboxing isolates potentially dangerous operations such as shell commands and file modifications from the host system, creating a security barrier between AI operations and the development environment. In Gemini CLI, sandboxing provides essential protection against accidental system damage or data loss when the AI executes commands or modifies files.

## Benefits

- **Security**: Prevents accidental system damage or data loss from AI-executed commands
- **Isolation**: Limits file system access to the project directory
- **Consistency**: Ensures reproducible environments across different systems
- **Safety**: Reduces risk when working with untrusted code or experimental commands

## Sandboxing Methods

| Method | Platform | Isolation Level | Prerequisites |
|--------|----------|-----------------|----------------|
| **Docker/Podman** | Cross-platform | High | Docker or Podman installed |
| **macOS Seatbelt** | macOS only | Medium-High | Built-in `sandbox-exec` |
| **Windows Native** | Windows only | Medium | `icacls` command |
| **gVisor/runsc** | Linux only | Highest | Docker + gVisor runtime |
| **LXC/LXD** | Linux only | Highest | LXC/LXD installed, container running |

## Configuration Precedence

Sandboxing can be enabled using multiple methods (in order of precedence):

1. **Command flag**: `-s` or `--sandbox`
2. **Environment variable**: `GEMINI_SANDBOX=true|docker|podman|sandbox-exec|runsc|lxc`
3. **Settings file**: `"sandbox": true` in `settings.json` under `tools`

## Container-Based Sandboxing

Cross-platform sandboxing uses Docker or Podman with complete process isolation. The workspace directory is mounted at the **exact same absolute path** inside the container, enabling seamless file access while maintaining isolation from the host system.

By default, uses the `ghcr.io/google/gemini-cli:latest` container image. Custom images can be specified via `GEMINI_SANDBOX_IMAGE` or the `settings.json` configuration.

## Security Considerations

- Sandboxing reduces but does not eliminate all risks
- Use the most restrictive profile that allows your work
- Container overhead is minimal after first build
- GUI applications may not work in sandboxes
- Windows: Files created in sandbox retain "Low" integrity level permanently and must be manually reset using `icacls` if needed

## Troubleshooting

```bash
# Debug mode
DEBUG=1 gemini -s -p "debug command"

# Check environment
gemini -s -p "run shell command: env | grep SANDBOX"

# List mounts
gemini -s -p "run shell command: mount | grep workspace"
```

## Related Concepts

- [[sandbox-expansion]] — Dynamic permission escalation workflow
- [[sandbox-profiles]] — macOS Seatbelt profile reference
- [[workspace-mounting]] — Path preservation in containers
- [[tool-level-sandboxing]] — Alternative granular isolation approach
- [[container-based-sandboxing]] — Technical details on Docker/Podman approach