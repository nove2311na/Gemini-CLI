---
type: entity
title: "npx"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "npm"
  - "execution"
  - "tool"
related:
  - "[[npm]]"
  - "[[gemini-cli]]"
sources: ["3-gemini-cli-installation-execution-and-releases.md"]
---

# npx

`npx` is a package runner tool that comes with `npm` (version 5.2.0 and higher). It allows developers to execute Node.js packages without the need for permanent global installation.

## Use with Gemini CLI

`npx` provides a way to run Gemini CLI instantly for one-off tasks or to test specific versions without cluttering the global environment.

### Instant Execution
You can run the latest stable version of Gemini CLI by prefixing the package name with `npx`:

```bash
npx @google/gemini-cli
```

### Running from GitHub Source
For testing features still in development or not yet published to npm, `npx` can execute the CLI directly from the main branch on GitHub:

```bash
npx https://github.com/google-gemini/gemini-cli
```

## Benefits for Gemini CLI Users

1. **No Installation Required:** Perfect for quick trials or machines where you don't want to install software globally.
2. **Version Testing:** Easily test different versions (e.g., `npx @google/gemini-cli@preview`) without changing your main installation.
3. **Always Up-to-Date:** Running with `npx` (without a version tag) ensures you are always using the most recent version available on the registry.

## See Also

- [[npm]] — The underlying package manager that provides `npx`
- [[gemini-cli]] — The application frequently executed via `npx`
