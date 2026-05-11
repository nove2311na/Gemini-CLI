---
type: entity
title: "Google Workspace Accounts"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "authentication"
  - "google"
  - "enterprise"
  - "organization"
related:
  - "[[gemini-cli]]"
  - "[[google-accounts]]"
  - "[[google-cloud-projects]]"
  - "[[authentication]]"
sources: ["4. Gemini CLI authentication setup.md"]
---

# Google Workspace Accounts

Google Workspace Accounts is an organizational identity type provided through Google's enterprise productivity suite. Unlike individual Google accounts, Workspace accounts are managed by an organization (company, school, or other entity) and carry additional requirements for service access.

## Overview

Workspace accounts are assigned to users within an organization and are controlled by administrators. This management includes:

- Identity and access policies
- License assignments
- Security controls
- API access restrictions

## Authentication Requirements in Gemini CLI

Unlike individual accounts, Workspace accounts **always require** Google Cloud project configuration for use with Gemini CLI. This is a fundamental difference from personal accounts.

### Required Setup Steps

1. **Google Cloud Project**: A GCP project must exist and be configured
2. **API Enablement**: The Gemini for Cloud API must be enabled
3. **IAM Permissions**: User must have appropriate access roles assigned

## Use Cases

### Company Deployment

Organizations may deploy Gemini CLI to employees with:

- Company-managed API access
- Quota controls at the organization level
- Audit logging capabilities
- Compliance with corporate policies

### Educational Institutions

Schools and universities using Workspace for Education may provide:

- Student access to AI tools under institutional licensing
- Faculty research capabilities
- Curriculum-integrated AI assistance

## Comparison with Individual Accounts

| Feature | Individual Account | Workspace Account |
|---------|------------------|-------------------|
| GCP Project Required | Optional | Required |
| Admin Management | No | Yes |
| Team Licensing | No | Yes |
| Organization Quotas | No | Yes |
| Sign-in Method | Browser-based | Browser-based |

## Related Configuration

- [[google-cloud-projects]] — The required GCP resource
- [[google-accounts]] — Parent identity concept
- [[authentication]] — The overall authentication framework
- [[google-cloud-project-setup]] — Detailed setup procedures