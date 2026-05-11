---
type: source
title: "Gemini CLI Extension Best Practices"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "extensions"
  - "development"
  - "security"
  - "best-practices"
related:
  - "[[gemini-cli-extensions]]"
  - "[[extensions]]"
  - "[[gemini-extension-manifest]]"
  - "[[gemini-md-file]]"
  - "[[extension-development-workflow]]"
  - "[[extension-security-best-practices]]"
  - "[[extension-structure]]"
  - "[[extension-release-practices]]"
sources: ["3. Gemini CLI extension best practices.md"]
url: "https://geminicli.com/docs/extensions/best-practices/"
venue: "geminicli.com"
authors: []
year: 2026
description: "Official guide covering best practices for developing, securing, and maintaining Gemini CLI extensions."
---

# Gemini CLI Extension Best Practices

This source document provides official best practices for building Gemini CLI extensions, covering four critical areas: development workflows, security practices, release management, and testing strategies.

## Key Takeaways

### Development Practices

- TypeScript is strongly recommended for type safety and developer experience
- Organized project structure with `src/` and `dist/` directories improves maintainability
- The `gemini extensions link` command enables rapid local development without reinstallation
- `GEMINI.md` files should focus on goals, remain concise, and include usage examples

### Security Principles

The source emphasizes the principle of least privilege throughout extension development:

- Request only necessary permissions for the MCP server
- Use `excludeTools` to restrict dangerous tools like `run_shell_command`
- Implement input validation to prevent arbitrary code execution
- Mark sensitive settings (API keys) with `sensitive: true` for keychain storage

### Release Strategy

- Follow Semantic Versioning (SemVer) for clear change communication
- Use Git branches for release channels (stable vs. development)
- Clean artifacts by excluding `node_modules/` and `src/` from releases

### Testing and Troubleshooting

- Manual testing via `gemini extensions link` and debug console (F12)
- Automated testing with Vitest or Jest for MCP server tool logic
- Key troubleshooting: restart CLI after manifest changes, verify manifest JSON validity

## Connected Pages

This source serves as the foundation for documenting extension development practices in the wiki. It extends [[gemini-cli-extensions]] with detailed workflows and security patterns.