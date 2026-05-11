---
type: entity
title: "GitHub MCP server"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "mcp"
  - "github"
  - "integration"
related:
  - "[[mcp-servers]]"
  - "[[github-personal-access-token]]"
  - "[[gemini-cli]]"
sources: ["9. Set up an MCP server.md"]
---

# GitHub MCP server

The GitHub MCP server is an official Model Context Protocol server maintained by GitHub that exposes GitHub APIs as tools for AI assistants like Gemini CLI. It enables natural language interactions with GitHub repositories for managing pull requests, issues, and other GitHub resources.

## Overview

Running as a Docker container (`ghcr.io/github/github-mcp-server`), this server bridges Gemini CLI and GitHub's API ecosystem. Once configured, users can perform GitHub operations through conversational requests without needing to use the GitHub web interface or CLI tools directly.

## Available Capabilities

The server exposes multiple tool categories:

### Pull Request Management
- List open pull requests in repositories
- Create new pull requests
- Review and comment on pull requests
- Merge or close pull requests

### Issue Operations
- Create issues with titles and descriptions
- List issues across repositories
- Update issue status and metadata
- Add labels and assignees

### Repository Operations
- Access repository metadata
- Browse repository contents
- Manage repository settings (with appropriate permissions)

## Configuration

The GitHub MCP server is configured in [[settings-json]]:

```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "GITHUB_PERSONAL_ACCESS_TOKEN",
        "ghcr.io/github/github-mcp-server:latest"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    }
  }
}
```

## Authentication

The server uses a [[github-personal-access-token]] for authentication. The token must have appropriate permissions:

| Permission | Access Level | Purpose |
|------------|--------------|---------|
| Metadata | Read | Repository metadata access |
| Contents | Read | Repository content browsing |
| Issues | Read/Write | Issue creation and management |
| Pull Requests | Read/Write | PR management operations |

### Token Setup

1. Create a fine-grained PAT at github.com/settings/tokens?type=beta
2. Grant required repository access and permissions
3. Export the token in your shell environment
4. Reference it in the MCP server configuration

## Docker Image

The server runs from: `ghcr.io/github/github-mcp-server:latest`

This official GitHub container registry image is maintained by GitHub and updated regularly to support new GitHub API capabilities.

## Usage Example

Once connected, users can interact naturally:

**Prompt:** `List the open PRs in the google/gemini-cli repository.`

The agent recognizes this matches the GitHub MCP tool and calls `mcp_github_list_pull_requests` to fetch the data.

## Verification

Use `/mcp list` to verify the server is connected. A successful connection shows:

```
✓ github: docker ... - Connected
```

If showing `Disconnected`, verify Docker is running and the token is valid.