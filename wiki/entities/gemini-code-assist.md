---
type: entity
title: "Gemini Code Assist"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "enterprise"
  - "gemini-cli"
  - "google-cloud"
  - "gemini-3"
related:
  - "[[gemini-cli]]"
  - "[[gemini-3-pro]]"
  - "[[google-cloud-settings-admin]]"
sources:
  - "6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md"
---

# Gemini Code Assist

Gemini Code Assist is Google's enterprise AI coding assistant, available in both Standard and Enterprise tiers. It integrates with local development environments through a specialized version of [[gemini-cli]] configured for organizational use.

## Gemini 3 Pro Enablement

Accessing [[gemini-3-pro]] within Gemini Code Assist requires a two-step administrative process distinct from consumer CLI setup:

### Administrator Requirements

A user with the **Google Cloud Settings Admin** role must perform the following:

1. Navigate to the Google Cloud Project associated with the Code Assist instance
2. Open **Admin for Gemini** > **Settings**
3. Under **Release channels for Gemini Code Assist in local IDEs**, select **Preview**
4. Click **Save changes**

### Individual User Requirements

After administrator enablement, each user must:

1. Wait 2-3 minutes for the configuration to propagate
2. Open [[gemini-cli]]
3. Run `/settings` command
4. Set **Preview Features** to `true`
5. Restart the CLI application

Upon completion, Gemini 3 Pro becomes available in the model selection menu.

## Release Channels

The "Preview" release channel represents an administrative mechanism for enabling beta features in enterprise environments. This differs from consumer setup where Gemini 3 activates automatically with version 0.21.1+.

## Standard vs Enterprise

The documentation mentions both tiers, though specifics on capability differences are not covered. Both tiers share the same two-step enablement process for preview features.