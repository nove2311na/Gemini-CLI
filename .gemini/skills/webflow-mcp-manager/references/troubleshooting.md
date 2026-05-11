# Webflow MCP Troubleshooting

## Common Errors & Solutions

### "Cannot perform dynamic registration without issuer"
- **Cause**: This usually happens when the MCP client (Gemini CLI) tries to initiate OAuth but doesn't have the correct handshake with the SSE server, or the server-side session is invalid.
- **Fix**: 
  1. Run `/mcp reload`.
  2. If that fails, remove and re-add the server:
     ```bash
     gemini mcp remove webflow
     gemini mcp add --transport sse webflow https://mcp.webflow.com/sse
     ```

### "MCP server 'webflow' rejected stored OAuth token"
- **Cause**: The token in `mcp-oauth-tokens.json` has expired or was revoked.
- **Fix**: Simply run `/mcp auth webflow` again. You may need to delete `~/.gemini/mcp-oauth-tokens.json` first if the CLI doesn't automatically prompt for a new login.

### "No sites found" / "Wrong project connected"
- **Cause**: Browser session persistence. Even after clearing CLI tokens, the browser might automatically authorize the *previous* project if you are already logged into Webflow.
- **Fix**: **Use Incognito Mode**. When the `/mcp auth webflow` link appears:
  1. Triple-click to copy the entire URL.
  2. Open an Incognito/Private window.
  3. Paste the URL.
  4. Manually log in to Webflow.
  5. **Carefully check the "Workspace" dropdown** and ensure all desired "Sites" are checked before clicking "Authorize".

### MCP Tool Errors (JSON parsing, etc.)
- **Fix**: Clear the MCP tool cache.
  ```bash
  # Check location in SKILL.md and remove the cache file
  rm C:\Users\ADMIN\.gemini\tmp\gemini-cli\mcp-cache.json
  /mcp reload
  ```
