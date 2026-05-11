---
type: overview
title: "Project Overview"
tags:
  - "gemini-cli"
  - "documentation"
  - "workflow"
related:
  - "[[gemini-cli]]"
  - "[[plan-mode]]"
  - "[[model-steering]]"
  - "[[session]]"
sources: []
---

# Overview

This wiki documents features, techniques, and best practices for using [[gemini-cli]] effectively in development workflows. It serves as a living reference for both individual contributors and teams exploring advanced capabilities.

## Core Session Management

[[Session-management]] enables conversation persistence across multiple work sessions, allowing developers to resume complex tasks without losing context. The `/resume` command and `-r` flag provide quick access to recent work, while the interactive session browser enables discovery of older conversations by showing timestamps, first messages, and turn counts. Sessions can be cleaned up through inline browser deletion, CLI commands, or the `/exit --delete` pattern for privacy-sensitive tasks.

The [[rewind-feature]] provides a powerful undo mechanism that allows returning to any previous conversation state with optional file reversion. The [[selective-reversion]] system offers three granular modes: conversation-only reversion (preserving code changes), code-only reversion (preserving conversation context), or full reversion of both. This granular control lets users keep beneficial changes while discarding unwanted ones, reducing the need for complete session restarts.

The [[checkpointing]] system serves as the technical foundation for these safety mechanisms, enabling history reconstruction across compression boundaries. [[Forking-conversations]] provides branching capabilities for exploring alternative approaches while preserving the main conversation thread, using named save points created with `/resume save`.

## Planning and Task Execution

Complex development tasks benefit from structured planning to overcome the context window limitations that affect standard LLMs. [[Task-planning]] decomposes complex goals into structured lists that provide visibility, focus, and resilience throughout execution. The [[todo-list]] provides real-time progress tracking, showing tasks with statuses (pending, in-progress, done, cancelled) updated as the agent works through each step. Pressing **Ctrl+T** toggles the full todo list view for quick progress assessment.

The [[write-todos-tool]] generates these task plans automatically from natural language descriptions like "Please make a plan first." Plans are treated as living documents—users can add missing steps, reorder tasks, or cancel items mid-execution. This dynamic adjustment prevents rigid plans from breaking when requirements change.

[[Plan-mode]] offers a structured environment for complex tasks, following a linear research → propose → draft workflow. When combined with [[model-steering]], developers gain real-time correction capabilities that dramatically improve architectural outcomes. The [[combined-workflows]] pattern documents how to integrate these features for maximum effectiveness.

## Web Research and Grounding

A critical capability for working with current technologies is the web research workflow. [[google-web-search]] enables access to live internet information, while [[web-fetch-tool]] retrieves detailed content from specific URLs. Together, these tools serve the concept of [[grounding]] — ensuring agent responses reflect current, accurate reality rather than potentially outdated training data.

The [[web-research-workflow]] connects search, fetch, and implementation into a cohesive pipeline for researching new technologies, troubleshooting errors, and applying knowledge directly to code. This is particularly valuable when working with libraries released after the model's training cutoff, as web search prevents hallucination about non-existent features. The workflow supports multiple scenarios: finding documentation for new releases, comparing approaches across different sources, fetching detailed blog posts for bug fixes, and researching solutions to obscure error messages from GitHub issues and forums.

## Development and Testing

For contributors looking to validate changes, [[integration-testing]] provides end-to-end test coverage for the CLI. Integration tests are executed via `npm run test:e2e` rather than the default `npm run test` command, ensuring comprehensive validation of user workflows. Forked repositories require a `GEMINI_API_KEY` GitHub Repository Secret to run integration tests, which authenticate with the Gemini API to verify full CLI functionality.

## Workflow Patterns

The wiki emphasizes practical workflow patterns for real-world development. [[Mid-turn-refinement]] enables corrections during active processing, reducing the need for costly reversion. The rewind feature's three-mode [[selective-reversion]] system provides precise control, allowing users to undo conversations, files, or both depending on the situation. Session resumption, history management via `/resume` browser and CLI commands, and conversation branching with `/resume save` all contribute to a robust workflow that supports both focused individual work and collaborative development. [[Shell-commands]] can be executed directly from prompts for builds, git operations, and system automation, with [[background-processes]] for long-running tasks and [[sandboxing]] for secure execution.

## Source Material

Documentation is derived from official Gemini CLI tutorials, best practices guides, and community contributions. Each source is catalogued in the [[index]] for reference and cross-linking. Key sources include the extensions tutorial, shell commands guide, session management walkthrough, task planning tutorial, plan mode with model steering guide, web search and fetch documentation, rewind feature documentation, model selection guide, git worktrees documentation, and integration testing documentation.