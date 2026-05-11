---
type: source
title: "Gemini CLI Hooks"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "hooks"
  - "extensibility"
  - "documentation"
related:
  - "[[gemini-cli]]"
  - "[[hooks]]"
  - "[[hook-events]]"
  - "[[hook-exit-codes]]"
  - "[[extensions]]"
sources: ["1. Gemini CLI hooks.md"]
---

# Gemini CLI Hooks

**Source:** [Official Hooks Documentation](https://geminicli.com/docs/hooks/)  
**Author:** Google Gemini CLI Documentation  
**Published:** 2026-04-14

## Summary

Hooks are scripts or programs that Gemini CLI executes at specific points in the agentic loop, enabling non-invasive customization of behavior without modifying the CLI source code. They run synchronously as part of the agent loop—when a hook event fires, Gemini CLI waits for all matching hooks to complete before continuing.

## Key Concepts

- **11 Hook Events** spanning lifecycle (SessionStart, SessionEnd, PreCompress, Notification), turn-level (BeforeAgent, AfterAgent), model-level (BeforeModel, AfterModel), and tool-level (BeforeToolSelection, BeforeTool, AfterTool)
- **The "Golden Rule"**: Hooks must output only valid JSON to stdout; stderr is reserved for logging
- **Exit Code Semantics**: 0=Success (preferred), 2=System Block, Other=Warning
- **Security Fingerprinting**: Project hooks are tracked; git-pulled changes treat hooks as untrusted

## Primary Use Cases

- Injecting context (like git history) before model processing
- Validating actions and blocking dangerous operations
- Enforcing security policies and compliance checks
- Logging interactions for auditing
- Dynamically filtering available tools

## Core Pages

- [[hooks]] — Main concept page with overview and use cases
- [[hook-events]] — Detailed reference table of all 11 events
- [[hook-security]] — Security guidance including fingerprinting
- [[hook-writing-guide]] — Tutorial on creating hooks with JSON I/O contract
- [[hook-exit-codes]] — Detailed exit code reference and behavioral implications

## Configuration

Hooks are configured in `settings.json` with precedence: Project → User → System → Extensions (highest to lowest).
