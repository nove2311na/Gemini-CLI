---
type: entity
title: "permissions Command"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "command"
  - "security"
  - "workspace-management"
related:
  - "[[trusted-folders]]"
  - "[[safe-mode]]"
sources: ["9. Trusted folders.md"]
---

# /permissions Command

A built-in Gemini CLI command that reopens the interactive trust dialog for the current workspace folder, allowing users to change the trust level without navigating to settings files.

## Overview

The `/permissions` command provides a convenient interface for managing workspace trust settings. It triggers the same trust dialog that appears during the initial discovery phase, enabling users to update trust decisions at any time.

## Usage

```
/permissions
```

Running this command within any workspace folder opens the trust dialog for that folder.

## Capabilities

The command allows users to:

| Action | Description |
|--------|-------------|
| **Grant trust to folder** | Trust the current folder only |
| **Grant trust to parent folder** | Trust the parent directory, including all subdirectories |
| **Decline trust** | Mark folder as untrusted, triggering safe mode |

## Limitations

The `/permissions` command only **adds** trust levels. It does not provide a direct mechanism for **removing** trust once granted. To remove trust, users must manually edit `~/.gemini/trustedFolders.json`.

## Relationship to trustedFolders.json

The command modifies `~/.gemini/trustedFolders.json` by adding or updating entries for the current workspace. The command cannot remove entries from this file.

## Use Cases

- Changing trust level after initial setup
- Adjusting trust settings when project requirements change
- Re-evaluating trust for folders previously marked as trusted

## See Also

- [[trusted-folders]] — The broader feature this command supports
- [[safe-mode]] — The restricted state when trust is declined
- [[trustedFolders-json]] — The file modified by this command