# Hands-on Lab: Module 6

## Overview
- **Type:** Automation & Observability
- **Target Audience:** DevOps Engineers & Tool Builders
- **Time Estimate:** 35 Minutes

---

## Level 1: Basic - Connecting an MCP Server
**Objective:** Extend Gemini's capabilities with external data.

1. Ensure Docker is running.
2. Obtain a GitHub Personal Access Token (PAT).
3. Add the GitHub MCP server to your `settings.json` (see Lesson Content for JSON).
4. Launch `rtk gemini` and run:
   ```bash
   /mcp list
   ```
5. Test the connection:
   ```none
   List the issues in my current repository.
   ```

---

## Level 2: Intermediate - Headless Scripting
**Objective:** Build a batch documentation generator.

1. Create a script `bulk-doc.sh`:
   ```bash
   #!/bin/bash
   for file in *.js; do
     echo "Documenting $file..."
     rtk gemini -p "Generate a one-line comment describing @$file" > "${file}.doc"
   done
   ```
2. Make it executable: `chmod +x bulk-doc.sh`.
3. Run it in a folder with JS files and check the `.doc` files.

---

## Level 3: Challenge - Telemetry & Traces
**Objective:** Monitor agent behavior locally.

1. Enable local telemetry in your `settings.json`:
   ```json
   {
     "telemetry": {
       "enabled": true,
       "target": "local",
       "outfile": "agent-traces.log"
     }
   }
   ```
2. Run a complex task in `rtk gemini` (e.g., refactoring a file).
3. Open `agent-traces.log` and search for:
   - `gemini_cli.tool_call`
   - `gemini_cli.token.usage`
4. Use the data to determine which tool took the longest to execute.

---

## Troubleshooting
- **MCP Disconnected:** Verify Docker access and network connectivity.
- **Headless Mode fails:** Ensure you are authenticated (`rtk gemini` works interactively first).
- **Telemetry log empty:** Set `DEBUG=1` to see if there are OTLP export errors.

---

## Citations
- Source: [MCP Setup Tutorial](Clippings/II. Use Gemini CLI/9. Set up an MCP server.md)
- Source: [Headless Mode Guide](Clippings/II. Use Gemini CLI/10. Automate tasks with headless mode.md)
- Source: [Observability Reference](Clippings/III. Features/III. 20. Observability with OpenTelemetry.md)
