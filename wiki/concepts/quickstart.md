---
type: concept
title: "Quickstart"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "onboarding"
  - "tutorial"
  - "setup"
related:
  - "[[gemini-cli]]"
  - "[[authentication-methods]]"
  - "[[npm]]"
sources: ["2-gemini-cli-get-started.md"]
---

# Quickstart

The Gemini CLI Quickstart provides a rapid path from installation to your first AI-assisted terminal session. This guide summarizes the essential steps to get up and running.

## 1. Install
Install Gemini CLI globally using [[npm]]:

```bash
npm install -g @google/gemini-cli
```

## 2. Authenticate
Start the CLI and sign in with your Google account:

1. Run the `gemini` command.
2. Select **Sign in with Google**.
3. Complete the login in your web browser.

## 3. Your First Commands

### Ask a Question
```bash
gemini "How do I list files in this directory including hidden ones?"
```

### Analyze a File
```bash
cat README.md | gemini "Summarize this file in three bullet points"
```

### Interactive Session
Simply type `gemini` to enter the interactive REPL where you can have a continuous conversation.

## 4. Explore Capabilities

Once you've mastered the basics, try these common development tasks:
- **[[Rapid Codebase Exploration]]:** Ask Gemini to explain how a specific function or repository works.
- **[[Task Planning]]:** Use `/plan` to decompose complex goals into actionable steps.
- **[[Shell Commands]]:** Ask Gemini to execute builds or git operations directly.

## Next Steps

- Review the [[gemini-cli-cheatsheet]] for a full list of commands.
- Configure your [[project-context]] using `GEMINI.md`.
- Explore [[agent-skills]] for specialized expertise.
