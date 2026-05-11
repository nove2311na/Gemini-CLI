---
type: concept
title: "Extension migration"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "migration"
  - "repository-transfer"
  - "user-experience"
related:
  - "[[gemini-cli-extensions]]"
  - "[[extension-distribution]]"
  - "[[gemini-extension-json]]"
  - "[[4-release-extensions]]"
sources: ["4. Release extensions.md"]
---

# Extension migration

The process of moving an extension to a new repository while maintaining a seamless experience for existing users. Migration preserves settings, updates installation sources, and redirects users automatically.

## When to Migrate

- Transferring from personal account to organization
- Renaming an extension
- Consolidating multiple related extensions
- Restructuring repository organization

## Migration Workflow

### Step 1: Create New Repository

Set up the extension in its new location:
- Ensure `gemini-extension.json` is present and valid
- Verify functionality works in the new location
- Prepare any new version if needed

### Step 2: Update Old Repository

In the original repository, modify `gemini-extension.json`:

```json
{
  "name": "my-extension",
  "version": "1.1.0",
  "migratedTo": "https://github.com/new-owner/new-extension-repo"
}
```

- Include `migratedTo` property pointing to new repository URL
- Bump version number (semantic versioning)
- Optionally change extension name in the new repository

### Step 3: Publish Update

Release the new version from the old repository:
- Publish to GitHub Releases or push to default branch
- Users checking for updates will receive migration notification

## Automatic User Updates

When users check for updates:
1. Gemini CLI detects `migratedTo` field
2. Verifies new repository contains valid extension update
3. Updates local installation to track new source
4. Migrates all extension settings automatically

## User Experience Impact

| Aspect | Behavior |
|--------|----------|
| Settings | Preserved automatically |
| Installation source | Updated to new repository |
| Extension name | Changed if specified in new manifest |
| Version continuity | Maintained via version bump |

## Design Considerations

- **Version bump** — Must be higher than any previously released version
- **URL accuracy** — `migratedTo` URL must be accessible and contain valid extension
- **Timing** — Old repository should remain available until most users migrate
- **Communication** — Consider notifying users through README or release notes

## Related Concepts

- [[extension-distribution]] — Distribution channel options
- [[gemini-cli-extensions]] — Extension packaging system
- [[gemini-extension-json]] — Manifest file structure