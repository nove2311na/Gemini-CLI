---
type: entity
title: "Google Cloud Project"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google"
  - "cloud"
  - "infrastructure"
  - "authentication"
  - "gcp"
related:
  - "[[gemini-cli]]"
  - "[[authentication-methods]]"
  - "[[vertex-ai]]"
sources: ["4-gemini-cli-authentication-setup.md"]
---

# Google Cloud Project

A Google Cloud Project is the foundational organizer for resources and services on Google Cloud Platform (GCP). In the context of [[gemini-cli]], it is a required component for organization-level authentication and advanced model access.

## When is a Project Required?

While most individual Google accounts do not require a project for basic use, you **must** configure a Google Cloud Project if any of the following apply:
- Using a **company, school, or Google Workspace account**.
- Using a **Gemini Code Assist** license from the Google Developer Program or a subscription.
- Authenticating via **Vertex AI**.

## Configuration Steps

To link a project to Gemini CLI:
1. **Find Project ID:** Locate your project ID in the [Google Cloud Console](https://console.cloud.google.com/).
2. **Enable API:** Enable the **Gemini for Cloud API** (or Vertex AI API for Vertex AI users).
3. **IAM Permissions:** Grant necessary roles (e.g., "Vertex AI User").
4. **Environment Variables:** Set the `GOOGLE_CLOUD_PROJECT` variable. Gemini CLI also recognizes `GOOGLE_CLOUD_PROJECT_ID` as a fallback.

```bash
export GOOGLE_CLOUD_PROJECT="your-project-id"
```

## Environment Variables

| Variable | Description |
| --- | --- |
| `GOOGLE_CLOUD_PROJECT` | Primary variable for specifying the project ID. |
| `GOOGLE_CLOUD_PROJECT_ID` | Fallback variable if the primary is not set. |
| `GOOGLE_CLOUD_LOCATION` | Required for Vertex AI to specify the resource region. |

## Relationship to Quotas

Organization-managed projects inherit quotas defined by the organization's subscription tier. Administrators can monitor and manage usage through the Google Cloud Console "Admin for Gemini" dashboard.

## See Also

- [[authentication-methods]] — Overview of how projects fit into sign-in flows
- [[vertex-ai]] — Enterprise platform requiring project configuration
- [Google Cloud Console](https://console.cloud.google.com/)