---
type: entity
title: "softprops/action-gh-release@v1"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "github-actions"
  - "ci-cd"
  - "extension-releases"
  - "automation"
related:
  - "[[extension-distribution]]"
  - "[[platform-specific-archives]]"
  - "[[gemini-cli-extensions]]"
sources: ["4. Release extensions.md"]
---

# softprops/action-gh-release@v1

A GitHub Action that automates the creation of GitHub Releases from CI/CD pipelines. In the Gemini CLI extension ecosystem, this action is used to publish pre-built extension archives for multiple platforms.

## Overview

The action accepts file paths to attach as release assets and can be triggered on tag pushes (e.g., `v*`). It automatically uses the tag as the release title and creates a GitHub Release with the specified artifacts.

## Usage in Extension Publishing

Extension authors use this action in workflows that build platform-specific binaries and attach them to GitHub Releases. The workflow:

1. Triggers on version tags (`v*`)
2. Builds extensions for each target platform (darwin, linux, win32)
3. Packages results using `npm run package -- --platform=X --arch=Y`
4. Attaches assets using `files:` parameter

## Key Parameters

| Parameter | Purpose |
|-----------|---------|
| `files` | Comma-separated list of file paths to attach |
| `prerelease` | Set to `true` for pre-release versions |
| `generate_release_notes` | Auto-generate changelog from commits |

## Example Workflow

```yaml
- name: Create GitHub Release
  uses: softprops/action-gh-release@v1
  with:
    files: |
      release/darwin.arm64.my-tool.tar.gz
      release/linux.arm64.my-tool.tar.gz
      release/win32.arm64.my-tool.zip
```

## Related Concepts

- [[extension-distribution]] — Distribution method selection
- [[platform-specific-archives]] — Archive naming conventions
- [[gemini-cli-extensions]] — Extension packaging system