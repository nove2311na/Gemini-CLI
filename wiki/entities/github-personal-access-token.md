---
type: entity
title: "GitHub Personal Access Token"
created: 2026-05-05
updated: 2025-05-05
tags:
  - "github"
  - "authentication"
  - "credentials"
related:
  - "[[github-mcp-server]]"
  - "[[mcp-servers]]"
sources: ["9. Set up an MCP server.md"]
---

# GitHub Personal Access Token

A GitHub Personal Access Token (PAT) is a credential that authenticates API requests to GitHub on behalf of a user. It is used by the [[github-mcp-server]] to enable Gemini CLI to interact with GitHub repositories, issues, and pull requests.

## Overview

PATs serve as a secure alternative to password-based authentication for command-line and API access. They provide fine-grained permission control, allowing users to grant only the specific capabilities needed for a given integration.

## Token Types

GitHub offers two types of Personal Access Tokens:

### Fine-grained PATs (Recommended)

Fine-grained tokens allow precise control over:
- Specific repositories (vs. all repos)
- Individual permission categories
- Access level (read-only or read/write)

The [[github-mcp-server]] configuration requires a fine-grained PAT with specific permissions for metadata, contents, issues, and pull requests.

### Classic PATs

Classic tokens operate at the user level with broader repository access. They are simpler but provide less granular control.

## Required Permissions for GitHub MCP Server

| Permission | Access | Purpose |
|------------|--------|---------|
| Metadata | Read | Access repository information |
| Contents | Read | Browse repository files |
| Issues | Read/Write | Create and manage issues |
| Pull Requests | Read/Write | Manage pull requests |

## Setting Up for MCP Server Use

### Creation Steps

1. Navigate to github.com/settings/tokens?type=beta
2. Click "Generate new token" and select "Fine-grained"
3. Name the token descriptively (e.g., "Gemini CLI MCP Server")
4. Set expiration as appropriate
5. Select specific repositories or organization access
6. Grant required permissions:
   - Repository permissions: Metadata (read), Contents (read)
   - Issues: Read and write
   - Pull requests: Read and write
7. Generate and copy the token

### Environment Variable Configuration

Store the token securely by setting it as an environment variable:

**macOS/Linux:**
```bash
export GITHUB_PERSONAL_ACCESS_TOKEN="github_pat_..."
```

**Windows (PowerShell):**
```powershell
$env:GITHUB_PERSONAL_ACCESS_TOKEN="github_pat_..."
```

This keeps the token out of configuration files and shell history where possible.

## Security Best Practices

- **Never commit tokens** to version control
- **Use environment variables** rather than hardcoding in [[settings-json]]
- **Set expiration dates** on tokens to limit exposure
- **Grant minimum permissions** needed for the use case
- **Rotate tokens periodically** or immediately if compromised
- **Revoke unused tokens** through the GitHub settings interface