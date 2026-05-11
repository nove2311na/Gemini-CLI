---
type: index
title: "Wiki Index"
created: 2026-01-15
updated: 2026-05-05
tags: []
related: []
sources: []
---

# Wiki Index

## Entities

- [[gemini-cli]] — Google's command-line AI assistant
- [[npm]] — Primary package manager and installation method for Gemini CLI
- [[npx]] — Package runner for instant CLI execution
- [[google-ai-studio]] — Prototyping tool and source for Gemini API keys
- [[google-cloud-project]] — Foundational organizer for enterprise and Vertex AI services
- [[notebooklm-mcp]] — MCP server for accessing Google NotebookLM notebooks
- [[gemini-cli-extensions]] — Packaging system for extending CLI capabilities
- [[gemini-cli-extension-gallery]] — Central browsing and discovery platform for extensions
- [[gemini-extensions-list]] — Interactive command for listing installed extensions
- [[gemini-extensions-command]] — Terminal-based extension management command group
- [[plan-mode]] — Structured environment for research, propose, and draft workflow
- [[model-steering]] — Real-time feedback mechanism for mid-turn corrections
- [[write-todos-tool]] — Internal tool that generates structured task plans
- [[google-web-search]] — Tool for accessing live internet search from prompts
- [[web-fetch-tool]] — Tool for retrieving raw content from specific URLs
- [[rewind-feature]] — Session undo with optional file reversion
- [[shells-command]] — Dashboard command for viewing and managing background processes
- [[model-command]] — Built-in command for configuring AI model selection
- [[model-tiers]] — Model categories (Pro, Flash, Flash-Lite) with different capability trade-offs
- [[stats-command]] — Built-in command for viewing token usage and cached token savings
- [[review-sh]] — Automated PR review script for detecting anti-patterns and testing issues
- [[assign-command]] — Self-service command for assigning issues with label and limit requirements
- [[unassign-command]] — Self-service command for releasing claim on issues

## Concepts

- [[quickstart]] — Foundational guide for installing and using the CLI
- [[system-requirements]] — Software and hardware specifications for optimal performance
- [[release-channels]] — Stable, Preview, and Nightly versioning system
- [[authentication-methods]] — Pathways for secure access via Google Account, API Key, or Vertex AI
- [[extensions]] — Packaging format for prompts, MCP servers, commands, themes, hooks, sub-agents, and agent skills
- [[session]] — Conversation context with history and memory
- [[session-management]] — Managing workspace sessions in Gemini CLI
- [[rewind-feature]] — Ctrl+Z-style undo for workflow state
- [[selective-reversion]] — Three-mode system for granular rewind control (conversation only, code only, both)
- [[forking-conversations]] — Branching conversation history
- [[checkpointing]] — Underlying safety mechanism for save and rewind
- [[task-planning]] — Creating structured todo lists before executing complex tasks
- [[todo-list]] — Real-time CLI checklist showing task progress and status
- [[combined-workflows]] — Integration pattern for multiple Gemini CLI features
- [[mid-turn-refinement]] — Technique for updating agent behavior during active processing
- [[grounding]] — Ensuring agent responses reflect current, accurate reality
- [[web-research-workflow]] — Research-to-implementation pipeline using web tools
- [[shell-commands]] — Execute builds, git operations, and system automation directly
- [[shell-mode]] — Toggle mode for continuous shell interaction
- [[sandboxing]] — Docker-based isolation for secure shell command execution
- [[confirmation-prompts]] — Safety mechanism requiring user approval for shell commands
- [[background-processes]] — Long-running tasks detached from the main session
- [[run-shell-command-tool]] — Internal tool enabling AI-driven shell execution
- [[model-selection]] — Choosing which AI model powers CLI interactions for speed vs quality control
- [[auto-mode]] — Automatic model selection based on task complexity
- [[manual-mode]] — Explicit model selection by the user
- [[agent-awareness]] — AI memory of conversation context and implications for rewind operations
- [[token-caching]] — Automatic cost optimization through token reuse across API requests
- [[git-worktrees]] — Experimental feature for filesystem-level session isolation using Git worktrees
- [[integration-testing]] — End-to-level testing of Gemini CLI functionality via npm run test:e2e
- [[automated-review-tool]] — Script-based system for detecting anti-patterns and testing issues in PRs
- [[issue-command-protocol]] — Slash command system for self-service issue management with guardrails
- [[human-ai-partnership-model]] — Strategic framework using humans for judgment and agents for execution
- [[agent-orchestrator]] — Professional shift from task execution to agent portfolio management
- [[low-precision-tasks]] — High-frequency, low-risk tasks ideal for initial agent automation
- [[graduated-autonomy]] — Incremental trust-building through observation, approval gates, and independent action
- [[vibe-based-agent-building]] — Conversational workflow configuration trend for 2026

## Sources

- [[1-gemini-cli-documentation]] — Master table of contents for Gemini CLI docs
- [[2-gemini-cli-get-started]] — Foundational onboarding guide
- [[3-gemini-cli-installation-execution-and-releases]] — System requirements and release channel details
- [[4-gemini-cli-authentication-setup]] — Comprehensive authentication pathway guide
- [[5-gemini-cli-cheatsheet]] — Quick reference for commands and options
- [[6-gemini-3-pro-and-gemini-3-flash-on-gemini-cli]] — Gemini 3 support and routing strategies
- [[III. 21. Token caching and cost optimization.md]] — Official documentation on token caching and the /stats command
- [[1. Gemini CLI extensions]] — Documentation on the extension system for packaging and sharing capabilities
- [[4-execute-shell-commands]] — Tutorial on executing shell commands, managing background processes, and safety features
- [[5-manage-sessions-and-history]] — Tutorial on session resumption, deletion, rewind, and forking
- [[6. Plan tasks with todos]] — Tutorial on using Gemini CLI's built-in task planning and todo list
- [[7-use-plan-mode-with-model-steering-for-complex-tasks]] — Tutorial on combining Plan Mode with model steering for complex tasks
- [[8-web-search-and-fetch]] — Tutorial on web search and fetch tools for live internet access
- [[III. 17. Rewind.md]] — Official documentation on the rewind feature with detailed workflow and selective reversion modes
- [[III. 11. Gemini CLI model selection (`model` command)]] — Official documentation on the `/model` command and model selection best practices
- [[III. 6. Git Worktrees (experimental).md]] — Official documentation on the experimental git worktrees feature for session isolation
- [[2. Integration testing.md]] — Documentation on running end-to-end integration tests with npm run test:e2e
- [[3. Issue and PR automation.md]] — Documentation on automated PR review and issue self-assignment commands
- [[hubspot-2026-ai-agents-playbook]] — Guide on AI agent strategy and implementation by Mindstream/Futurepedia


## Queries
- [[queries/checkpointing-vs-chat-compression-terminology-2026-05-05|Checkpointing vs Chat Compression Terminology]]

## Comparisons

- [[forking-conversations-vs-git-worktrees]] — Side-by-side analysis of conversation forking and git worktrees for parallel work scenarios

## Synthesis