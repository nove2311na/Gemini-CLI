---
type: entity
title: "Cloud Shell"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google-cloud"
  - "cloud-platform"
  - "pre-installed"
related:
  - "[[gemini-cli]]"
  - "[[cloud-workstations]]"
  - "[[gemini-cli-setup]]"
sources: ["3. Gemini CLI installation, execution, and releases.md"]
---

# Cloud Shell

Cloud Shell is Google's browser-based shell environment that provides command-line access to a virtual machine hosted on Google Cloud infrastructure.

## Overview

Cloud Shell comes pre-installed with [[gemini-cli]], making it an ideal zero-configuration option for users who want to try Gemini CLI without setting up a local development environment. This option is particularly useful for:

- Quick experimentation with Gemini CLI
- Environments where local installation is restricted
- Collaborative scenarios requiring consistent tooling
- Users who prefer browser-based workflows

## Features

- **Pre-installed Gemini CLI** — No installation required
- **Browser-based access** — Works from any modern web browser
- **5GB persistent home directory** — Files persist across sessions
- **Authenticating with Google Cloud** — Automatically authenticated to Google services
- **Linux foundation** — Full Linux shell environment

## Usage

Users can access Cloud Shell directly from the Google Cloud Console or via the `gcloud` command-line tool. Once connected, Gemini CLI is immediately available via the `gemini` command.

## Relationship to Gemini CLI

Cloud Shell serves as one of two pre-installed options for [[gemini-cli]] (alongside [[Cloud Workstations]]). This provides a no-friction entry point for new users to explore Gemini CLI capabilities before committing to a local installation.

## See Also

- [[gemini-cli-setup]] — Installation alternatives and setup procedures
- [[cloud-workstations]] — Alternative pre-installed option
- [[gemini-cli]] — Primary documentation for the CLI tool