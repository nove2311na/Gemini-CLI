---
type: concept
title: "Extension distribution"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "extensions"
  - "distribution"
  - "publishing"
  - "git"
  - "github-releases"
related:
  - "[[gemini-cli-extensions]]"
  - "[[gemini-cli-extension-gallery]]"
  - "[[platform-specific-archives]]"
  - "[[extension-migration]]"
  - "[[4-release-extensions]]"
sources: ["4. Release extensions.md"]
---

# Extension distribution

The mechanisms by which Gemini CLI extensions reach end users. Two primary channels exist: Git repository distribution and GitHub Releases distribution. Each offers different tradeoffs for extension authors.

## Git Repository Distribution

The simplest approach, suitable for extensions that remain platform-independent or where users may benefit from tracking development branches.

### Characteristics

- **Flexibility** — Users can reference any branch, tag, or commit via `--ref`
- **Update mechanism** — Pushing to a referenced branch triggers update prompts
- **Discovery** — Gallery indexing based on `gemini-cli-extension` topic
- **Version concept** — `HEAD` commit is always treated as "latest"

### Usage

```bash
gemini extensions install <repo-uri> --ref=stable
```

### Recommended Channel Structure

| Channel | Branch | Purpose |
|---------|--------|---------|
| stable | default branch | Most reliable version |
| preview | named branch | Upcoming features |
| dev | named branch | Active development |

## GitHub Releases Distribution

More efficient for initial installations since users download single archives rather than cloning the full repository.

### Characteristics

- **Speed** — Single archive download vs. full clone
- **Platform-specific binaries** — Support for multi-platform builds
- **Semantic versioning** — Installer checks "Latest" release
- **Version pinning** — `--ref` with release tag for specific versions

### Update Flow

1. Gemini CLI queries GitHub for the "Latest" release
2. If newer version exists, prompts user to update
3. Downloads and extracts appropriate archive asset

### When to Use GitHub Releases

- Extension requires build step
- Platform-specific binaries are bundled
- Faster installation is prioritized
- Clear version boundaries are needed

## Decision Matrix

| Factor | Git | GitHub Releases |
|--------|-----|-----------------|
| Initial install speed | Slower (full clone) | Faster (archive) |
| Development branches | Full support | Limited (tags only) |
| Platform-specific assets | Not supported | Supported |
| Version control | Any ref | Tags only |
| CI/CD complexity | Minimal | Moderate |

## Related Concepts

- [[platform-specific-archives]] — Archive naming for multi-platform support
- [[extension-migration]] — Repository transition handling
- [[gemini-cli-extension-gallery]] — Discovery mechanism
- [[gemini-cli-extensions]] — Packaging format overview