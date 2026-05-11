# Module 6: Automation & The Ecosystem

## 1. Learning Objectives
By the end of this module, students will be able to:
- **[Understand]** Explain the architecture of the Model Context Protocol (MCP) and how it enables tool interoperability.
- **[Apply]** Configure and connect specialized MCP servers (e.g., GitHub, Postgres) to Gemini CLI.
- **[Apply]** Execute non-interactive workflows using Headless Mode for batch processing and CI/CD.
- **[Analyze]** Monitor agent performance and behavior using OpenTelemetry logs, metrics, and traces.

---

## 2. MCP: The Bridge to External Tools
Model Context Protocol (MCP) allows Gemini CLI to interact with third-party APIs and databases as if they were built-in tools.

### How to Configure an MCP Server
Servers are added to the `mcpServers` block in `settings.json`.
```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm",
        "-e", "GITHUB_PERSONAL_ACCESS_TOKEN",
        "ghcr.io/github/github-mcp-server:latest"
      ]
    }
  }
}
```

### Discovery & Usage
- **Verify:** Run `/mcp list` in the CLI.
- **Invoke:** Simply ask: `rtk gemini "List my open PRs."` The CLI automatically maps this to `mcp_github_list_pull_requests`.

---

## 3. Headless Mode: Scripting & CI/CD
Headless mode allows Gemini CLI to run a single task and exit. This is ideal for automation scripts.

### Basic Syntax
```bash
rtk gemini -p "Summarize the changes in @README.md"
```

### Piping Context
```bash
rtk git diff | rtk gemini -p "Write a commit message for this diff"
```

### Structured Data Extraction
Combine `--output-format json` with `jq` to build reliable automation:
```bash
rtk gemini --output-format json "Extract the version from @package.json" | jq -r '.response'
```

---

## 4. Observability & OpenTelemetry
Observability turns "black box" AI into predictable software. Gemini CLI supports the industry-standard OpenTelemetry framework.

### The Three Pillars
1. **Logs:** Timestamped records of prompts, tool calls, and errors.
2. **Metrics:** Numerical usage data (Token counts, Latency).
3. **Traces:** Deep "under-the-hood" views of every tool and API interaction.

### Configuration
```json
{
  "telemetry": {
    "enabled": true,
    "target": "local",
    "outfile": ".gemini/telemetry.log"
  }
}
```

---

## 5. Case Study: The "Smart PR Reviewer"
**Scenario:** A team wants to automatically comment on new PRs with an AI summary.
**Solution:**
Create a CI/CD script:
```bash
#!/bin/bash
DIFF=$(rtk git diff main...head)
SUMMARY=$(echo "$DIFF" | rtk gemini -p "Summarize these changes and highlight potential bugs.")
rtk gh pr comment --body "$SUMMARY"
```

---

## 6. Comparison: Interactive vs. Headless
| Feature | Interactive Mode | Headless Mode (`-p`) |
| :--- | :--- | :--- |
| **User Input** | Yes (Real-time) | No (Scripted) |
| **Output** | UI-rich (Terminal) | Raw text or JSON |
| **Best For** | Coding, Researching | CI/CD, Cron jobs, Batching |
| **Lifecycle** | Stateful Session | Request-Response |

---

## Citations
- Source: [MCP Setup Tutorial](Clippings/II. Use Gemini CLI/9. Set up an MCP server.md)
- Source: [Headless Mode Guide](Clippings/II. Use Gemini CLI/10. Automate tasks with headless mode.md)
- Source: [Observability Reference](Clippings/III. Features/III. 20. Observability with OpenTelemetry.md)
