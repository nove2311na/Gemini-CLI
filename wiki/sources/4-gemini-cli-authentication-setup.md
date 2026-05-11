---
type: source
title: "Gemini CLI Authentication Setup"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "authentication"
  - "setup"
  - "configuration"
related:
  - "[[gemini-cli]]"
  - "[[authentication]]"
  - "[[vertex-ai]]"
  - "[[google-cloud-project-setup]]"
  - "[[environment-variables]]"
sources: ["4. Gemini CLI authentication setup.md"]
---

# Gemini CLI Authentication Setup

This source document provides comprehensive documentation on authenticating with Google services when using [[gemini-cli]]. It covers multiple authentication pathways tailored to different user types, account configurations, and use cases.

## Core Authentication Methods

The documentation outlines a decision matrix for choosing the appropriate authentication method:

| User Type | Method | GCP Project Required |
|-----------|--------|---------------------|
| Individual Google accounts | Sign in with Google | No (with exceptions) |
| Workspace/Organizational accounts | Sign in with Google | Yes |
| AI Studio users | Gemini API Key | No |
| Vertex AI users | Vertex AI | Yes |
| Headless environments | API Key or Vertex AI | Conditional |

## Key Authentication Pathways

### 1. Sign in with Google

The simplest method for local machine usage. Requires a web browser for credential entry. Credentials are cached locally for future sessions.

### 2. Gemini API Key

Obtained from [[google-ai-studio]], set via the `GEMINI_API_KEY` environment variable. Suitable for personal use without organizational dependencies.

### 3. Vertex AI

Three sub-options for Google Cloud platform usage:

- **Application Default Credentials (ADC)**: Via `gcloud` CLI login
- **Service Account JSON Key**: For CI/CD and non-interactive environments
- **Google Cloud API Key**: Direct API access with organizational restrictions

## Environment Configuration

Key environment variables used throughout the authentication process:

- `GEMINI_API_KEY`: Gemini API key from AI Studio
- `GOOGLE_API_KEY`: Google Cloud API key
- `GOOGLE_CLOUD_PROJECT`: Primary project identifier (checked first)
- `GOOGLE_CLOUD_PROJECT_ID`: Fallback project identifier
- `GOOGLE_CLOUD_LOCATION`: Vertex AI region
- `GOOGLE_APPLICATION_CREDENTIALS`: Path to service account JSON key

## Persistence Mechanisms

The document describes two methods for making authentication settings persistent:

1. **Shell configuration files**: Appending export commands to `~/.bashrc`, `~/.zshrc`, etc.
2. **`.gemini/.env` file**: Automatic loading from project directory or home directory

## Special Environment Handling

- **Google Cloud Shell**: Automatic authentication using cached credentials
- **Compute Engine**: Automatic ADC from metadata server
- **Headless Mode**: Requires pre-configured environment variables

## Key Concepts Covered

- [[authentication-methods]]: Multiple pathways based on user type and use case
- [[application-default-credentials]]: Google's standard auth mechanism
- [[environment-persistence]]: Making configuration permanent across sessions
- [[auto-authentication]]: Automatic credential detection in GCP environments

## Important Notes

1. When using Vertex ADC, API keys (`GOOGLE_API_KEY`, `GEMINI_API_KEY`) must be unset
2. Workspace/organizational accounts always require Google Cloud project configuration
3. Authentication method affects quotas, pricing, and Terms of Service

## External References

- [Google AI Studio API Keys](https://aistudio.google.com/app/apikey)
- [Create Service Account Keys](https://cloud.google.com/iam/docs/keys-create-delete)
- [Get Vertex AI API Key](https://cloud.google.com/vertex-ai/generative-ai/docs/start/api-keys)