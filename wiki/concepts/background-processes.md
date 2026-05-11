---
type: concept
title: "Background Processes"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "shell"
  - "process"
  - "dev-server"
related:
  - "[[shell-commands]]"
  - "[[shells-command]]"
  - "[[gemini-cli]]"
sources: ["4. Execute shell commands.md"]
---

# Background Processes

Background processes are long-running shell tasks that Gemini CLI can start and manage without blocking the main conversation. Common examples include development servers, file watchers, and build watchers.

## Starting Background Processes

You can ask Gemini CLI to start background tasks:

```
Prompt: Start the React dev server in the background.
```

The AI will execute the appropriate command (e.g., `npm run dev`) and detach it from the main session. The process continues running independently while the conversation proceeds.

## Managing Background Processes

The `/shells` command provides a dashboard interface for viewing and managing background processes:

```
/shells
```

From this dashboard you can:

- View logs from running processes
- Kill runaway or hung processes
- Monitor which processes are active

## Use Cases

**Development Servers:** Start local web servers, API backends, or database services that need to run continuously while you work.

**File Watchers:** Run tools like `nodemon`, `tsc --watch`, or hot reloaders that respond to file changes.

**Build Processes:** Start long-running build or compilation tasks.

**Service Monitoring:** Run health checks or log aggregators.

## Session Persistence

Background processes may or may not persist across Gemini CLI restarts, depending on how they were started and your system's process management. Use the `/shells` command to check status when resuming a session.

## Related Commands

The [[shells-command]] provides the interface for process management. Background processes are initiated via [[shell-commands]] but run detached from conversational flow.