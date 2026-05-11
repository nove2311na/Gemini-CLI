---
type: entity
title: "Extension Linking"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensions"
  - "development"
  - "symlink"
related:
  - "[[extensions]]"
  - "[[gemini-cli-extensions]]"
  - "[[gemini-extension-manifest]]"
sources: ["2. Build Gemini CLI extensions.md"]
---

# Extension Linking

Extension linking is a development workflow that creates a symbolic link from your development directory to the Gemini CLI extensions directory, enabling immediate testing of changes without reinstallation.

## Purpose

When developing an extension, you want rapid iteration. Linking allows you to:
- Edit source code and see changes immediately
- Test configuration changes without reinstalling
- Maintain a single source of truth for your extension code

## How It Works

The `gemini extensions link` command creates a symbolic link (symlink) in the global extensions directory pointing to your local development directory.

## Workflow

### 1. Create and Scaffold Your Extension

```bash
gemini extensions new my-extension mcp-server
cd my-extension
npm install
```

### 2. Link the Extension

```bash
gemini extensions link .
```

This creates a symlink from the global extensions directory to your current working directory.

### 3. Test Changes

1. Restart your Gemini CLI session
2. The extension loads from your development directory
3. Make code changes
4. Restart again (manifest changes may require restart)

## Development vs Production

| Aspect | Linked (Development) | Installed (Production) |
|--------|---------------------|------------------------|
| Source location | Your dev directory | Extensions directory |
| Updates | Immediate | Requires reinstall |
| Version control | Your local repo | Gallery or git clone |
| Debugging | Full access to source | Minified/production |

## Unlinking

To remove the symlink and stop loading the extension:

```bash
gemini extensions unlink my-extension
```

Or manually remove the symlink from your extensions directory.

## Best Practices

1. **Keep dependencies in sync**: Run `npm install` after linking to ensure dependencies are available
2. **Restart after manifest changes**: Configuration changes require a fresh session
3. **Use source control**: Your development directory should be a git repository
4. **Test both environments**: Verify behavior after installing from gallery, not just while linked

## When to Use Linking

Use linking when:
- Actively developing a new extension
- Debugging an existing extension
- Testing changes before publishing

Use full installation when:
- Using an extension from the gallery
- Testing the actual install experience
- Deploying to a different machine