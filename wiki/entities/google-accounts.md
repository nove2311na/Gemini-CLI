---
type: entity
title: "Google Accounts"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "authentication"
  - "google"
  - "identity"
related:
  - "[[gemini-cli]]"
  - "[[authentication]]"
  - "[[google-workspace-accounts]]"
sources: ["4. Gemini CLI authentication setup.md"]
---

# Google Accounts

Google Accounts is the identity layer for Google's services, providing authentication and authorization across the Google ecosystem. For [[gemini-cli]] users, the type of Google Account determines which authentication methods are available and whether additional infrastructure (like Google Cloud projects) is required.

## Account Types

### Individual Google Accounts

Individual accounts include:

- **Free tier accounts** with basic Gemini access
- **Google AI Pro** paid subscriptions
- **Google AI Ultra** paid subscriptions
- Any personal Gmail-based account used with Gemini services

**Authentication for Individual Accounts:**
- Most individual accounts do **not require** a Google Cloud project for authentication
- Sign in with Google via web browser is the recommended method
- Credentials are cached locally for future sessions

### Organization Accounts

Organization accounts are associated with:

- **Google Workspace** deployments (company, school)
- Paid licenses through an organization
- **Google AI Ultra for Business** subscriptions
- **Gemini Code Assist** licenses from the Developer Program

**Authentication for Organization Accounts:**
- **Always require** a Google Cloud project configuration
- Must have the Gemini for Cloud API enabled
- Requires appropriate IAM access permissions

## Authentication Flow

For both account types, the interactive sign-in flow works as follows:

1. Start the CLI: `gemini`
2. Select **Sign in with Google**
3. Browser opens with Google sign-in prompt
4. Complete authentication in browser
5. Credentials cached locally for future sessions

## Key Differences

| Aspect | Individual Account | Organization Account |
|--------|-------------------|----------------------|
| GCP Project Required | No (with exceptions) | Yes |
| API Key Available | Yes (from AI Studio) | Yes (from AI Studio) |
| Vertex AI Access | Via personal account | Via organization project |
| Team Features | No | Yes |

## Related Entities

- [[google-workspace-accounts]] — Organizational account type
- [[google-ai-studio]] — Source for API keys
- [[vertex-ai]] — Google Cloud platform option
- [[google-cloud-projects]] — Required resource for organizational accounts