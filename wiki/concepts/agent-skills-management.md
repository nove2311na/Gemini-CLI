---
type: concept
title: "Agent Skills Management"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "agent-skills"
  - "cli-commands"
  - "skill-management"
  - "workflow"
related:
  - "[[agent-skills]]"
  - "[[discovery-tiers]]"
  - "[[session]]"
sources: ["4. Managing Agent Skills.md"]
---

# Agent Skills Management

Agent Skills Management encompasses the commands and interfaces for discovering, installing, configuring, and maintaining skills within Gemini CLI. Skills can be managed through two complementary interfaces: in-session slash commands for interactive use and terminal commands for shell-based workflows.

## In-Session Commands

The `/skills` slash command group provides skill management within active Gemini CLI sessions. These commands operate on the current session's context and affect skill availability for ongoing work.

### Listing Skills

```bash
/skills list
```

Displays all discovered skills across all tiers. Use these variations for specialized views:

| Command | Purpose |
|---------|---------|
| `/skills list all` | Includes internal built-in skills |
| `/skills list nodesc` | Hides descriptions for compact output |

### Reloading Skills

```bash
/skills reload
# or
/skills refresh
```

Scans the skill directories for new or modified skills without requiring a CLI restart. This is useful after creating new skills or updating existing ones during development.

### Toggling Skills

```bash
/skills disable <skill-name>
/skills enable <skill-name>
```

Disabling a skill prevents it from being triggered automatically or invoked by name. This provides temporary exclusion without uninstalling. Re-enabling restores normal behavior.

### Linking Local Skills

```bash
/skills link <path> [--scope user|workspace]
```

Creates a reference to a local skill directory for immediate use during development. The linked skill becomes active without being copied to the standard skill locations. The `--scope` flag determines whether the link is user-wide or workspace-specific.

## Terminal Commands

The `gemini skills` command group provides management utilities from the system shell, supporting scripted and automated workflows.

### Installation

```bash
gemini skills install <source> [--scope workspace]
```

Installs a skill from a remote URL or local `.skill` package. By default, skills install to the user profile (`~/.gemini/skills/`). The `--scope workspace` flag installs to the project directory instead.

### Linking for Development

```bash
gemini skills link ./path/to/my-skill
```

Equivalent to the in-session link command, this creates a development reference from the terminal. Useful for integrating skill development into external editors or build processes.

### Uninstallation

```bash
gemini skills uninstall <name>
```

Removes an installed or linked skill completely. The skill is deleted from its installation location and no longer appears in discovery.

## Security and Consent

Skill management implements two security checkpoints:

**Installation consent** prompts for confirmation when installing from remote URLs. This ensures verification of the source before adding external code to the local environment.

**Activation consent** prompts each time a skill is triggered during a session. Even installed skills require explicit permission before the agent can use them, preventing unauthorized script execution or file access.

## Workflow Patterns

**Development workflow**: Link local skill directories using `/skills link` or `gemini skills link` for immediate testing. Modify the skill source, then use `/skills reload` to pick up changes without restarting.

**Deployment workflow**: Install skills from remote repositories using `gemini skills install`. Verify the source during the installation consent prompt, then confirm activation when the skill is first triggered.

**Team collaboration**: Install skills with `--scope workspace` to include project-specific expertise in version control. Team members clone the repository and immediately have access to shared skills.