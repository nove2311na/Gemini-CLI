---
---
type: entity
title: "Cloud Workstations"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google-cloud"
  - "cloud-platform"
  - "pre-installed"
  - "managed-workstation"
related:
  - "[[gemini-cli]]"
  - "[[cloud-shell]]"
  - "[[gemini-cli-setup]]"
sources: ["3. Gemini CLI installation, execution, and releases.md"]
---

# Cloud Workstations

Cloud Workstations is a managed cloud-based workstation service from Google Cloud that provides persistent, fully-configured development environments with pre-installed developer tools.

## Overview

Like [[Cloud Shell]], Cloud Workstations comes pre-installed with [[gemini-cli]], offering an alternative for users who need more robust development environment capabilities while maintaining the convenience of zero local installation.

## Key Characteristics

- **Pre-installed Gemini CLI** — Available immediately upon workspace creation
- **Managed infrastructure** — Google maintains the underlying compute resources
- **Configurable resources** — Choose appropriate CPU, memory, and storage configurations
- **IDE integration** — Supports popular development environments and editors
- **Persistent workspaces** — Development environment persists across sessions

## Use Cases

Cloud Workstations is particularly suited for:

- Teams requiring consistent development environments across members
- Enterprise scenarios with specific compliance or security requirements
- Projects requiring persistent, resource-intensive workloads
- Organizations already invested in Google Cloud infrastructure

## Relationship to Gemini CLI

As a pre-installed environment, Cloud Workstations eliminates the need for local [[gemini-cli-setup]], allowing teams to begin using Gemini CLI immediately after provisioning a workstation. This complements [[Cloud Shell]] as an option for zero-installation scenarios.

## See Also

- [[cloud-shell]] — Browser-based pre-installed option
- [[gemini-cli-setup]] — Installation and setup procedures
- [[gemini-cli]] — Primary documentation for the CLI tool