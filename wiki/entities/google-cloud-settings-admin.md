---
type: entity
title: "Google Cloud Settings Admin"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google-cloud"
  - "gemini-code-assist"
  - "administrator"
  - "role"
related:
  - "[[gemini-code-assist]]"
  - "[[gemini-3-pro]]"
sources:
  - "6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md"
---

# Google Cloud Settings Admin

Google Cloud Settings Admin is an administrative role in Google Cloud that grants permissions to configure Gemini Code Assist settings, including release channels for preview features.

## Role Purpose

This role is required for enabling the Preview release channel in enterprise environments. Without this permission, administrators cannot activate preview features that provide access to [[gemini-3-pro]] in [[gemini-code-assist]].

## Configuration Requirements

A user with Settings Admin permissions must:

1. Navigate to the Google Cloud Project linked to the Code Assist instance
2. Access **Admin for Gemini** > **Settings**
3. Locate **Release channels for Gemini Code Assist in local IDEs**
4. Select **Preview** as the active channel
5. Save the configuration

This administrative action propagates to all organization users after a short delay, though individual users must still enable Preview Features in their local settings.

## Relationship to Other Roles

The Settings Admin role focuses specifically on release channel management. Other administrative roles may handle user provisioning, quota management, or audit logging within the Google Cloud console.