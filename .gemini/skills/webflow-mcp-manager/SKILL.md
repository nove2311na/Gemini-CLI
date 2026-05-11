---
name: webflow-mcp-manager
description: Manage and troubleshoot Webflow MCP integration, specifically handling OAuth authentication, project selection, and session resets. Use when users need to connect Gemini CLI to Webflow, switch workspaces/projects, or resolve sticky authentication issues.
---

# Webflow MCP Manager

This skill provides procedural guidance for managing the Webflow Model Context Protocol (MCP) server integration.

## Core Workflows

### 1. Initial Setup (OAuth via SSE)
Webflow MCP is best used via the official Server-Sent Events (SSE) endpoint for security and full feature support (like Designer API access).

1. Add the server using SSE transport:
   ```bash
   gemini mcp add --transport sse webflow https://mcp.webflow.com/sse
   ```
2. Trigger the authentication flow:
   ```bash
   /mcp auth webflow
   ```
3. Copy the URL provided in the terminal.
4. Open the URL in a browser, log in, and authorize the requested projects/workspaces.

### 2. Switching Projects or Workspaces
Webflow sessions can be "sticky." To force a new project selection screen, you must clear the cached OAuth tokens.

1. **Locate the token file**: `~/.gemini/mcp-oauth-tokens.json`
2. **Remove the file** (or delete the "webflow" entry inside it):
   ```bash
   # Windows PowerShell
   rm $HOME\.gemini\mcp-oauth-tokens.json
   ```
3. **Reload MCP**:
   ```bash
   /mcp reload
   ```
4. **Re-authenticate**: Run `/mcp auth webflow`.
5. **CRITICAL**: Open the resulting URL in an **Incognito/Private Tab**. This ensures the browser doesn't automatically reuse your previous session, forcing Webflow to show the Project/Workspace selection screen.

### 3. Verification
After connecting, verify the accessible sites:
```bash
# Using the webflow MCP tool
mcp_webflow_data_sites_tool --actions '[{"label":"list_sites","list_sites":{}}]'
```

## Critical File Locations
- **Connection Config**: `.gemini/settings.json` (Project or User level)
- **OAuth Tokens**: `~/.gemini/mcp-oauth-tokens.json`
- **MCP Cache**: `~/.gemini/tmp/gemini-cli/mcp-cache.json`

## Troubleshooting
For common errors like "Cannot perform dynamic registration" or "Stored OAuth token rejected," see [troubleshooting.md](references/troubleshooting.md).
