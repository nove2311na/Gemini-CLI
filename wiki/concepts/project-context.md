---
type: concept
title: "Project Context"
created: 2026-05-05
updated: 2026-05-05
tags: ["gemini-cli", "configuration", "workflow", "teamwork"]
related: ["gemini-md", "hierarchical-context", "session-management", "task-planning"]
sources: ["5. Project context (GEMINI.md).md"]
---

# Project Context

Project context in Gemini CLI refers to the persistent, project-specific information that guides the AI agent's behavior within a given codebase. It encompasses all the knowledge needed for the agent to operate effectively as a team member: coding standards, architectural decisions, preferred libraries, build processes, and workflow patterns. Unlike one-off instructions, project context remains available across all sessions working within that project.

## Purpose and Benefits

The primary purpose of project context is to align the AI agent with team conventions and project requirements. Without explicit context, an AI agent might suggest generic solutions that conflict with established patterns or use libraries the team has intentionally avoided. Project context ensures the agent understands not just what to build, but how the team wants things built.

Benefits include consistency across team members, reduced friction when onboarding new contributors, enforcement of architectural decisions, and persistent institutional knowledge that survives personnel changes. Teams can encode their collective expertise in a shared format that all contributors automatically inherit.

## Implementation Mechanism

Project context is implemented through [[GEMINI.md]] files placed within the project directory structure. These text files contain natural language instructions describing project conventions and requirements. The files are designed to be committed to version control, making them shared assets accessible to the entire team rather than personal notes.

The [[hierarchical-context]] system allows different levels of context specificity. Repository-wide standards live at the root level, while component-specific guidance exists in subdirectories. This hierarchical approach acknowledges that different parts of a project may have different requirements or conventions.

## Relationship to Sessions

Project context loads automatically at the start of each [[session]], combining with conversation history to form the complete context for agent awareness. Unlike manual context injection during conversations, this automatic loading happens silently, meaning users may not always be aware that project context is influencing agent responses.

When combined with [[task-planning]], project context provides the foundational knowledge that enables effective task decomposition. The agent understands both the general task and the project-specific way that tasks should be approached.

## Dynamic Updates with Memory v2

The experimental [[memory-v2]] feature enables the agent to update project context files dynamically. As the agent learns new conventions through interaction, it can write this knowledge back to GEMINI.md files for persistence in future sessions. This creates a feedback loop where the agent becomes progressively more aligned with team practices over time.