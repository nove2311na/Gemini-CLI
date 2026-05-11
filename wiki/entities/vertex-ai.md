---
type: entity
title: "Vertex AI"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google"
  - "cloud"
  - "platform"
  - "enterprise"
  - "authentication"
related:
  - "[[gemini-cli]]"
  - "[[google-cloud-projects]]"
  - "[[application-default-credentials]]"
  - "[[service-accounts]]"
  - "[[authentication]]"
sources: ["4. Gemini CLI authentication setup.md"]
---

# Vertex AI

Vertex AI is Google Cloud's enterprise machine learning platform that provides Gemini model access with additional scalability, security, and organizational features. It serves as an alternative authentication pathway for [[gemini-cli]] users who need enterprise-grade capabilities.

## Overview

Vertex AI integration allows Gemini CLI to leverage Google Cloud infrastructure for AI interactions. Unlike personal API key authentication, Vertex AI requires:

- A Google Cloud project
- Vertex AI API enabled
- Appropriate IAM permissions
- Regional configuration

## Authentication Methods

Vertex AI supports three distinct authentication mechanisms:

### A. Application Default Credentials (ADC)

The recommended method for developers with `gcloud` CLI installed. Simplifies authentication by automatically finding and using credentials.

```bash
gcloud auth application-default login
```

**Prerequisites:**
- `gcloud` CLI installed and configured
- Active Google Cloud authentication
- No conflicting API key environment variables

### B. Service Account JSON Key

Designed for non-interactive and automated environments. Requires:

- Service account creation in Google Cloud
- JSON key file download
- `GOOGLE_APPLICATION_CREDENTIALS` environment variable set to key path
- "Vertex AI User" role assigned to service account

### C. Google Cloud API Key

Direct API access method requiring:

- Google Cloud API key from GCP console
- `GOOGLE_API_KEY` environment variable set
- Potential organizational restrictions on API key usage

## Environment Configuration

All Vertex AI authentication methods require these environment variables:

```bash
export GOOGLE_CLOUD_PROJECT="YOUR_PROJECT_ID"
export GOOGLE_CLOUD_LOCATION="YOUR_PROJECT_LOCATION"
```

Location examples: `us-central1`, `europe-west4`, etc.

## Key Differences from AI Studio

| Aspect | Vertex AI | Google AI Studio |
|--------|-----------|------------------|
| Target Users | Enterprise, organizations | Individual developers |
| GCP Project Required | Yes | No |
| Scalability | High | Standard |
| Admin Features | Yes | No |
| Audit Logging | Yes | Limited |
| Pricing Model | Cloud billing | Direct API billing |

## Use Cases

- **Large organizations** requiring centralized AI access management
- **CI/CD pipelines** needing automated, non-interactive authentication
- **Compliance environments** with audit and logging requirements
- **Multi-project architectures** with cross-project AI interactions

## Related Concepts

- [[application-default-credentials]] — Google's standard auth mechanism
- [[service-accounts]] — Non-interactive identity type
- [[google-cloud-projects]] — Required project resource
- [[gcloud-cli]] — CLI tool for ADC setup