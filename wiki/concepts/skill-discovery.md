---
type: concept
title: "Skill Discovery"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "agent-skills"
  - "discovery"
related:
  - "[[agent-skills]]"
  - "[[workspace-trust-model]]"
  - "[[skill-activation]]"
sources: ["2. Get started with Agent Skills.md"]
---

# Skill Discovery

Skill discovery is the mechanism by which Gemini CLI automatically finds and loads Agent Skills at runtime. Understanding the discovery rules is essential for creating skills that load correctly.

## Discovery Locations

Skills are discovered in two locations:

| Location | Scope | Trust Required |
|----------|-------|----------------|
| `~/.gemini/skills/` | User | No |
| `<workspace>/.gemini/skills/` | Workspace | Yes via `/trust` |

The `.agents/skills/` alias is also recognized as equivalent to `.gemini/skills/`.

## Discovery Rules

### Valid Patterns

Skills are discovered in these patterns:

```
# Root-level (single skill per directory)
.gemini/skills/SKILL.md

# Per-skill directory (recommended for bundled resources)
.gemini/skills/<skill-name>/SKILL.md
```

### Invalid Patterns

Files nested more than one level deep are ignored:

```
.gemini/skills/<skill-name>/subfolder/SKILL.md  # Not discovered
.gemini/skills/<skill-name>/scripts/SKILL.md    # Not discovered
```

## File Requirements

- Filename must be exactly `SKILL.md` (case-sensitive on Linux/macOS)
- `skill.md`, `Skill.md`, and other variations are ignored
- File must be valid UTF-8 text

## Frontmatter Requirements

The `SKILL.md` file must begin with valid YAML frontmatter containing:
- `name:` field (becomes the skill's display name)
- `description:` field (used for activation matching)

No content—blank lines, comments, headings, or anything else—may appear before the opening `---` delimiter.

## Refresh Commands

- `/skills list` — Display all currently discovered skills
- `/skills reload` — Refresh discovery without restarting session

## Troubleshooting

If a skill doesn't appear in `/skills list`:

1. Verify workspace is trusted (`/trust`) if using workspace scope
2. Check path layout is valid (root or one level deep)
3. Verify filename is exactly `SKILL.md`
4. Confirm frontmatter has both required fields and starts with `---`
5. Check name field content (this becomes the displayed name)

## See Also

- [[agent-skills]] — Full skill format documentation
- [[workspace-trust-model]] — Security mechanism affecting workspace discovery
- [[skill-activation]] — How discovered skills get activated