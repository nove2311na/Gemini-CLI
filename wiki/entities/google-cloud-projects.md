---
type: entity
title: "Google Cloud Projects"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google"
  - "cloud"
  - "resource"
  - "organization"
related:
  - "[[vertex-ai]]"
  - "[[google-workspace-accounts]]"
  - "[[google-cloud-project-setup]]"
  - "[[authentication]]"
sources: ["4. Gemini CLI authentication setup.md"]
---

# Google Cloud Projects

Google Cloud Projects is the fundamental resource container in Google Cloud Platform. It organizes resources, enables billing, and provides access control boundaries for Google Cloud services including Vertex AI integration with [[gemini-cli]].

## Role in Gemini CLI Authentication

Google Cloud projects are **required** for certain authentication scenarios:

### When GCP Project is Required

- Organization accounts (Workspace, company, school)
- Gemini Code Assist licenses from Developer Program
- Any Gemini Code Assist subscription
- Vertex AI authentication method

### When GCP Project is NOT Required

- Individual Google accounts (free and paid)
- API key authentication via Google AI Studio
- Basic personal Gemini CLI usage

## Configuration Requirements

When a GCP project is needed, the following steps are required:

### 1. Project Identification

Find your project ID from the Google Cloud Console or using:
- [Google Cloud Console](https://console.cloud.google.com)
- `gcloud projects list` command

### 2. API Enablement

Enable the Gemini for Cloud API:
```bash
gcloud services enable <service-name>
```

### 3. IAM Permissions

Configure appropriate access roles for users or service accounts.

## Environment Variables

Gemini CLI uses these environment variables for project identification:

| Variable | Precedence | Description |
|----------|------------|-------------|
| `GOOGLE_CLOUD_PROJECT` | Primary | Main project identifier |
| `GOOGLE_CLOUD_PROJECT_ID` | Fallback | Alternative project identifier |

Gemini CLI checks `GOOGLE_CLOUD_PROJECT` first, then falls back to `GOOGLE_CLOUD_PROJECT_ID`.

## Project Configuration Example

```bash
export GOOGLE_CLOUD_PROJECT="my-gemini-project-123"
export GOOGLE_CLOUD_LOCATION="us-central1"
```

## Related Entities

- [[vertex-ai]] — Platform requiring project configuration
- [[google-workspace-accounts]] — Account type that always requires projects
- [[google-cloud-project-setup]] — Detailed setup procedures
- [[authentication]] — Authentication framework context