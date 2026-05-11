---
type: entity
title: "Extension Structure"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extension"
  - "project-layout"
related:
  - "[[gemini-cli-extensions]]"
  - "[[extension-development-workflow]]"
sources: ["3. Gemini CLI extension best practices.md"]
---

# Extension Structure

The organization of files within a Gemini CLI extension impacts maintainability, development experience, and distribution efficiency. This page documents recommended structure patterns.

## Recommended Project Structure

For complex extensions, use an organized directory layout:

```text
my-extension/
├── package.json
├── tsconfig.json
├── gemini-extension.json
├── GEMINI.md
├── src/
│   ├── index.ts
│   └── tools/
└── dist/
```

## Directory Purposes

| Directory/File | Purpose |
|----------------|---------|
| `package.json` | Node.js dependency manifest and scripts |
| `tsconfig.json` | TypeScript compiler configuration |
| `gemini-extension.json` | Extension manifest (required) |
| `GEMINI.md` | AI-facing documentation |
| `src/` | Source code (TypeScript) |
| `dist/` | Build output (JavaScript) |

## Key Recommendations

### Use TypeScript

TypeScript is strongly recommended for all extensions. It provides:
- Compile-time type checking
- Improved IDE support
- Better documentation through types
- Catch errors before runtime

### Separate Source and Build

Keep source code in `src/` and output build artifacts to `dist/`. This:
- Keeps repository clean
- Makes it clear what should be committed
- Simplifies distribution (only ship `dist/`)

### Bundle Dependencies

If an extension has many dependencies, bundle them using a tool like `esbuild`. This:
- Reduces installation time
- Avoids dependency conflicts
- Minimizes download size for users

## Simple vs. Complex Extensions

While simple extensions may contain only a few files in a flat structure, organized structure is recommended for any extension that will be maintained long-term or shared publicly. The TypeScript requirement should be considered the default practice.

## Related Concepts

- [[gemini-cli-extensions]] — Overview of the extension system
- [[extension-development-workflow]] — Development workflow using this structure
- [[extension-release-practices]] — Distribution considerations