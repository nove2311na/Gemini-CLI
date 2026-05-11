---
type: source
title: "Web Search and Fetch Tutorial"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "tutorial"
  - "web-tools"
  - "research"
related:
  - "[[google-web-search]]"
  - "[[web-fetch-tool]]"
  - "[[web-research-workflow]]"
  - "[[grounding]]"
sources: ["8. Web search and fetch.md"]
---

# Web Search and Fetch Tutorial

Tutorial from geminicli.com demonstrating how to access live internet information directly from CLI prompts using two integrated tools.

## Overview

The tutorial demonstrates that Gemini CLI can access live internet via two tools: `google_web_search` for finding and synthesizing answers from web pages, and `web_fetch` for retrieving raw content from specific URLs. This enables research on technologies released after the model's training cutoff.

## Core Workflows

### Research New Technologies

When a library was released yesterday, the model doesn't know about it yet. Web search enables "grounding" — ensuring the agent's knowledge reflects current reality rather than hallucinating features from outdated training data.

**Example prompts:**
- `Search for the 'Bun 1.0' release notes and summarize the key changes.`
- `Find the documentation for the 'React Router v7' loader API.`

### Fetch Deep Context

Search gives summaries, but sometimes you need raw details. The `web_fetch` tool retrieves page content (stripping away ads and navigation) and feeds it directly into the agent's context.

**Example prompts:**
- `Read https://example.com/fixing-memory-leaks and explain how to apply it to my code.`
- `Compare the pagination patterns in https://api.example.com/v1/docs and https://api.example.com/v2/docs.`

### Apply Knowledge to Code

The real power comes from combining web tools with file editing:

1. **Search:** "How do I implement auth with Supabase?"
2. **Fetch:** "Read this guide: [https://supabase.com/docs/guides/auth](https://supabase.com/docs/guides/auth)."
3. **Implement:** "Great. Now use that pattern to create an `auth.ts` file in my project."

### Troubleshoot Errors

For obscure error messages, paste them into the chat and Gemini CLI will search GitHub issues, StackOverflow, and forums for solutions that might be too new to be in its base training set.

**Example prompt:** `I'm getting 'Error: hydration mismatch' in Next.js. Search for recent solutions.`

## Related Concepts

- [[grounding]] — The conceptual purpose: preventing hallucinations with current information
- [[web-research-workflow]] — The broader pattern connecting search, fetch, and implementation
- [[google-web-search]] — The tool for finding and synthesizing answers
- [[web-fetch-tool]] — The tool for retrieving raw content from URLs

## Next Steps

- Explore [[file-management]] to see how to apply the code you generate
- See [[google-web-search]] tool reference for citation details
- See [[web-fetch-tool]] tool reference for technical limitations