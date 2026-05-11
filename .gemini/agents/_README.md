# Gemini Agents Directory

Gemini CLI loads custom agents from this folder as Markdown files with YAML frontmatter.

Read `.gemini/AGENT_MAINTENANCE.md` before editing agents. That file is the handoff guide for future AI agent sessions.

Files in this directory are split into two groups:

- Native agents: edited directly in `.gemini/agents/`.
- Mirror agents: generated from JSON source files in `.gemini/subagents/`.

Naming convention:

- `project-director.md` is a native agent.
- `mirror--*.md` files are generated mirror agents cloned from `.gemini/subagents/*.json`.

The `name:` inside each mirror file intentionally stays unchanged, so Gemini mentions still use names like `@gemini-course-master`, not `@mirror--gemini-course-master`.

Current mirror agents are listed in `_mirror-manifest.json` and include a `GEMINI_AGENT_MIRROR` marker near the top of the file body.

Sync rule:

1. Edit source JSON in `.gemini/subagents/`.
2. Run `powershell -ExecutionPolicy Bypass -File .gemini/sync-subagents.ps1` from the project root, or use `/sync-subagents` in Gemini CLI.
3. Restart Gemini CLI or run `/agents reload` in an existing Gemini session.

Check without writing:

```powershell
powershell -ExecutionPolicy Bypass -File .gemini/sync-subagents.ps1 -Check
```

Do not remove the leading underscore from this file. Gemini CLI ignores underscore-prefixed Markdown files; without it, Gemini would try to load this README as an agent.