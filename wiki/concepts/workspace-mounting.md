---
type: concept
title: "Workspace Mounting"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "docker"
  - "mounting"
  - "path-preservation"
  - "sandboxing"
  - "gemini-cli"
related:
  - "[[sandboxing]]"
  - "[[container-based-sandboxing]]"
  - "[[shells-command]]"
sources: ["III. 18. Sandboxing in Gemini CLI.md"]
---

# Workspace Mounting

Workspace mounting is the technique used in container-based sandboxing to enable seamless file access within the sandbox. The host's current working directory is bind-mounted at the exact same absolute path inside the container, allowing the AI to read and modify project files while remaining isolated from the rest of the system.

## How It Works

When running Gemini CLI from a directory like `/Users/you/project` on the host machine, the sandbox container mounts the local project folder and operates within `/Users/you/project` inside the container. This path symmetry ensures that file paths in commands and responses work consistently inside and outside the sandbox.

## Key Technical Details

- **Path preservation**: The absolute path on the host must match the path inside the container
- **Bind mounting**: Host directory is mounted at the same absolute path inside the container
- **Bidirectional access**: The AI can read and write to the workspace seamlessly
- **Isolation**: No other host directories are accessible unless explicitly mounted via `SANDBOX_MOUNTS`

## Docker-in-Docker Consideration

When running Gemini CLI inside a Docker container and wanting to enable sandboxing:

1. Mount the Docker socket: `-v /var/run/docker.sock:/var/run/docker.sock`
2. Align workspace paths: The path inside the container must exactly match the absolute path on the host

```bash
docker run -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /absolute/path/on/host/project:/absolute/path/on/host/project \
  -w /absolute/path/on/host/project \
  -e GEMINI_SANDBOX=docker \
  ghcr.io/google/gemini-cli:latest
```

## External Mounts

Use `SANDBOX_MOUNTS` to include files outside the workspace:

```bash
export SANDBOX_MOUNTS="/path/on/host:/path/in/container:rw,/another/path:ro"
```

## Related Concepts

- [[sandboxing]] — Core sandboxing concept
- [[container-based-sandboxing]] — Docker/Podman sandboxing approach