---
type: entity
title: "trustedFolders.json"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "configuration"
  - "security"
  - "persistence"
related:
  - "[[trusted-folders]]"
  - "[[safe-mode]]"
  - "[[session-management]]"
sources: ["9. Trusted folders.md"]
---

# trustedFolders.json

A JSON configuration file that persists user trust decisions across Gemini CLI sessions. Located in `~/.gemini/trustedFolders.json` by default, it stores the trust level assigned to each workspace folder.

## Overview

The file acts as a persistent trust database, ensuring users are prompted only once per folder. When a folder is trusted via the `/permissions` command, an entry is added to this file for future sessions.

## Default Location

```
~/.gemini/trustedFolders.json
```

## Custom Location

Override the default location using the environment variable:

```bash
export GEMINI_CLI_TRUSTED_FOLDERS_PATH=/path/to/custom/trustedFolders.json
```

## Structure

The file contains entries mapping folder paths to their trust levels. Entries follow the trust levels defined in [[trusted-folders]]:

| Trust Level | Description |
|-------------|-------------|
| **Trust folder** | Full trust for specific folder only |
| **Trust parent folder** | Trust applies to parent and all subdirectories |
| **Don't trust** | Folder explicitly marked as untrusted |

## Manual Editing

Trust settings can be manually edited to:

- **Add trust** for additional folders
- **Remove trust** by deleting entries (note: the `/permissions` command only adds trust, not removes it)
- **Modify trust levels** by changing the stored value

## Security Considerations

- **No automatic revocation**: Once an entry is added, users must manually delete it to remove trust
- **Corruption risk**: If the file is corrupted or malformed, trust decisions may be inconsistent
- **Privacy**: The file contains a record of all workspaces the user has interacted with

## Relationship to Session Management

Similar to [[session-management]], trust settings persist per-workspace across sessions. Just as sessions store conversation history, `trustedFolders.json` stores security decisions for each workspace.

## See Also

- [[trusted-folders]] — The feature this file supports
- [[safe-mode]] — The restricted state applied to untrusted folders
- [[session-management]] — Session persistence concepts