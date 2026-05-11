---
type: concept
title: "Multi-Step Workflows"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "workflow"
  - "automation"
  - "chaining"
  - "context"
related:
  - "[[gemini-cli]]"
  - "[[combined-workflows]]"
  - "[[task-planning]]"
  - "[[session]]"
sources: ["2. Get started with Gemini CLI.md"]
---

# Multi-Step Workflows

Multi-step workflows are sequences of related operations that Gemini CLI executes to accomplish complex tasks. Each step builds on previous results, maintaining context throughout the process.

## Definition

A multi-step workflow chains together individual operations (git clone, file read, code analysis, file write) into a cohesive pipeline. The [[session]] context allows Gemini CLI to track progress across steps and use intermediate results to inform subsequent actions.

## Example: Repository Analysis

The chalk repository example from the getting started guide demonstrates a complete multi-step workflow:

1. **Git clone** — Download the remote repository
2. **File discovery** — Identify key source files worth examining
3. **File reading** — Access and parse the source code
4. **Analysis** — Process the code to understand structure and logic
5. **Explanation** — Generate a human-readable summary

## Characteristics

| Characteristic | Description |
|----------------|-------------|
| **Contextual continuity** | Each step has access to results from previous steps |
| **Permission-aware** | Each file operation may require user approval |
| **Error handling** | Subsequent steps can adapt based on earlier failures |
| **Flexible sequencing** | Steps execute in logical order determined by the task |

## Contrast with Single Operations

Single operations (asking a single question, generating one snippet) execute immediately without state. Multi-step workflows maintain state across operations, making them suitable for complex tasks that require data from multiple sources.

## Relationship to Combined Workflows

[[Combined-workflows]] extends multi-step workflows by integrating multiple Gemini CLI features (Plan Mode, model steering, web research) into a single task. Multi-step workflows are a foundational pattern that combined workflows build upon.

## Relationship to Task Planning

[[Task-planning]] can be used to structure multi-step workflows in advance. When facing complex tasks, users can request a task breakdown using [[write-todos-tool]], which creates a structured plan that guides the workflow execution.

## Best Practices

1. **Define the end goal clearly** — Provide Gemini CLI with a clear objective
2. **Allow appropriate permission scope** — Consider using "Allow always" for trusted multi-step operations
3. **Monitor intermediate results** — Review outputs at key checkpoints
4. **Use Plan Mode for complex sequences** — Consider [[plan-mode]] for workflows requiring careful architecture decisions