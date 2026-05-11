---
type: source
title: "Get started with Gemini CLI"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "getting-started"
  - "tutorial"
  - "installation"
  - "authentication"
  - "quickstart"
related:
  - "[[gemini-cli]]"
  - "[[permission-system]]"
  - "[[multi-step-workflows]]"
  - "[[token-usage-tracking]]"
  - "[[google-cloud-project]]"
sources: ["2. Get started with Gemini CLI.md"]
---

# Get started with Gemini CLI

This guide provides the foundational introduction to [[gemini-cli]], covering installation, authentication, configuration, and practical use cases. It serves as the primary onboarding resource for users new to the tool.

## Quickstart Overview

The guide establishes that [[gemini-cli]] brings advanced language model capabilities directly to the command line interface, positioning it as an AI-powered assistant for development tasks.

### Installation

Standard installation via npm:

```bash
npm install -g @google/gemini-cli
```

After installation, run with the `gemini` command.

### Authentication

Most users authenticate via existing Google accounts. The guide notes that certain account types may require [[google-cloud-project]] configuration as an alternative authentication method.

### Configuration

Configuration options include environment variables, command-line arguments, and settings files.

## Practical Use Cases

The guide demonstrates four key capabilities through concrete examples:

### Visual File Analysis

Gemini CLI can analyze image content and perform file operations based on visual understanding. The example shows renaming photos based on their actual subject matter (`yellow_flowers.png`, `antique_dresser.png`, `green_android_robot.png`).

### Multi-Step Workflows

The chalk repository example demonstrates [[multi-step-workflows]] by chaining git clone, file reading, and code analysis into a cohesive research pipeline.

### Data Processing

The guide shows spreadsheet combination capabilities—merging CSV files with different years into columns within a single output file.

### Code Generation

Unit test generation demonstrates Gemini CLI's ability to create boilerplate code from existing implementations.

## Permission System

Before file-modifying operations, Gemini CLI requests user confirmation through the [[permission-system]]. Users choose between "Allow once" (single operation) or "Allow always" (persistent permission).

## Usage Tracking

Token usage and quota information is available via the `/stats model` command, supporting the [[token-usage-tracking]] concept.

## Source Details

- **Published**: 2026-04-18
- **URL**: https://geminicli.com/docs/get-started/
- **Authors**: Google Gemini CLI Documentation Team

## Related Documentation

- [Installation Guide](https://geminicli.com/docs/get-started/installation)
- [Authentication Setup](https://geminicli.com/docs/get-started/authentication)
- [Configuration Reference](https://geminicli.com/docs/reference/configuration)
- [Command Reference](https://geminicli.com/docs/reference/commands#stats)