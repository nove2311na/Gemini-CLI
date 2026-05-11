# Agent Maintenance Guide

This workspace uses two kinds of Gemini CLI agent files.

## Native Agents

Native agents are authored directly as Gemini CLI Markdown agent files in `.gemini/agents/`.

Current native agent:

- `.gemini/agents/project-director.md`

Rules for native agents:

- Edit the Markdown file directly.
- Keep YAML frontmatter at the top, starting with `---` as the first bytes of the file.
- Use UTF-8 without BOM. A BOM before `---` can make Gemini report missing frontmatter.
- Native agents include a `GEMINI_AGENT_NATIVE` marker in the body.

## Mirror Agents

Mirror agents are generated Markdown files that Gemini CLI can load, but their source of truth is JSON.

Source files:

- `.gemini/subagents/*.json`

Generated Gemini-loadable files:

- `.gemini/agents/mirror--*.md`

Rules for mirror agents:

- Edit JSON in `.gemini/subagents/`, not the generated Markdown mirror.
- Run sync after editing JSON.
- Mirror frontmatter `tools:` is generated from the JSON `tools` array. Do not replace it with `["*"]` unless the JSON source explicitly uses `*`.
- The generated file name has `mirror--` so humans can identify it quickly.
- The frontmatter `name:` stays unchanged, so mentions use `@gemini-course-master`, not `@mirror--gemini-course-master`.
- Mirror agents include a `GEMINI_AGENT_MIRROR` marker in the body.

## Sync Commands

From the project root:

```powershell
powershell -ExecutionPolicy Bypass -File .gemini/sync-subagents.ps1
```

Check only, without writing:

```powershell
powershell -ExecutionPolicy Bypass -File .gemini/sync-subagents.ps1 -Check
```

Inside Gemini CLI:

```text
/sync-subagents
/agents reload
```

## Agent Quality Rubric

Use this rubric when editing native or mirror source agents. Target: 10/10. If any agent scores below 10, revise the prompt and validate again.

- Gemini CLI compatibility: valid frontmatter, valid agent name, loadable by parser.
- Role clarity: one clear job, visible boundaries, good description.
- Actionability: concrete workflow, expected outputs, practical defaults.
- Context discipline: clear English prompt, useful domain sections, avoids bloated capability catalogs and repetitive checklists.
- Tool and verification safety: reads before acting, verifies before claiming, avoids destructive actions.
- Anti-hallucination: cites local sources, flags unverifiable claims, avoids fake metrics.
- Workspace fit: respects `Clippings/` as source of truth and writes to expected folders.
- Tool parity: mirror `.md` tools must match source JSON tools exactly.

## Verification

After edits, run:

```powershell
powershell -ExecutionPolicy Bypass -File .gemini/sync-subagents.ps1 -Check
node -e "import('file:///C:/Users/ADMIN/AppData/Roaming/npm/node_modules/@google/gemini-cli/bundle/chunk-B2OARGJJ.js').then(async m=>{const r=await m.loadAgentsFromDirectory('E:/My Wiki/Gemini CLI/.gemini/agents'); console.log(JSON.stringify({agents:r.agents.map(a=>a.name), errors:r.errors.map(e=>e.message)}, null, 2));})"
```

Expected result: all intended agents listed and `errors` is empty.
