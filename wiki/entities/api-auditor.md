---
type: entity
title: "api-auditor"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "agent-skills"
  - "example"
related:
  - "[[agent-skills]]"
  - "[[skill-discovery]]"
  - "[[skill-activation]]"
sources: ["2. Get started with Agent Skills.md"]
---

# api-auditor

The `api-auditor` is an example skill created in the "Get started with Agent Skills" tutorial. It demonstrates the complete skill creation workflow, including directory structure, frontmatter configuration, bundled scripts, and activation.

## Purpose

The api-auditor skill provides expertise in auditing and testing API endpoints. It activates when users ask to "check", "test", or "audit" a URL or API.

## Structure

```
.gemini/skills/api-auditor/
  SKILL.md          # Skill definition with instructions
  scripts/
    audit.js        # Bundled Node.js script for endpoint testing
```

## SKILL.md Contents

```yaml
---
name: api-auditor
description:
  Expertise in auditing and testing API endpoints. Use when the user asks to
  "check", "test", or "audit" a URL or API.
---

# API Auditor Instructions

When active, the skill:
1. Audits URLs using the bundled audit.js utility
2. Reports status codes and latency in plain English
3. Warns about insecure (non-HTTPS) endpoint testing
```

## Bundled Script

The `scripts/audit.js` file performs deterministic API testing:

```javascript
const url = process.argv[2];
fetch(url, { method: 'HEAD' })
  .then((r) => console.log(`Result: Success (Status ${r.status})`))
  .catch((e) => console.error(`Result: Failed (${e.message})`));
```

## Usage Example

1. User: "Can you audit https://google.com"
2. Gemini identifies description match, calls `activate_skill`
3. User approves consent prompt
4. Gemini executes: `node .gemini/skills/api-auditor/scripts/audit.js https://google.com`

## See Also

- [[agent-skills]] — General skill format documentation
- [[skill-activation]] — How activation and consent work