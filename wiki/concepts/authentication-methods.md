---
type: concept
title: "Authentication Methods"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "authentication"
  - "security"
  - "setup"
related:
  - "[[gemini-cli]]"
  - "[[google-ai-studio]]"
  - "[[google-cloud-project]]"
  - "[[vertex-ai]]"
sources: ["4-gemini-cli-authentication-setup.md"]
---

# Authentication Methods

Gemini CLI supports several authentication pathways tailored to different user types, account configurations, and use cases. Choosing the correct method ensures appropriate access to models and quota.

## 1. Sign in with Google (Recommended)
The simplest and most common method for individual users.
- **Process:** Start `gemini`, select "Sign in with Google", and follow the browser-based OAuth flow.
- **Account Types:** Individual Google accounts (free and paid subscriptions like Google AI Pro/Ultra).
- **Caching:** Credentials are cached locally for future sessions.

## 2. Gemini API Key
Ideal for users who prefer not to use browser-based login or are working in [[headless-mode]].
- **Process:** Obtain a key from [[Google AI Studio]] and set the `GEMINI_API_KEY` environment variable.
- **Environment Variable:** `export GEMINI_API_KEY="your-key"`
- **Account Types:** Any user with access to Google AI Studio.

## 3. Vertex AI
Designed for enterprise users and those integrated with Google Cloud Platform.
- **Process:** Use `gcloud` Application Default Credentials (ADC), a service account JSON key, or a Google Cloud API key.
- **Environment Variables:** `GOOGLE_CLOUD_PROJECT`, `GOOGLE_CLOUD_LOCATION`.
- **Options:**
    - **ADC:** `gcloud auth application-default login`
    - **Service Account:** Set `GOOGLE_APPLICATION_CREDENTIALS` to the JSON key path.
    - **API Key:** Set `GOOGLE_API_KEY`.

## 4. Automatic Authentication
Gemini CLI identifies and uses existing credentials in specific environments:
- **Cloud Shell:** Authenticates automatically using active Cloud Shell credentials.
- **Compute Engine:** Uses Application Default Credentials (ADC) from the metadata server.

## Summary Table

| Method | Best For | GCP Project Required |
| --- | --- | --- |
| **Sign in with Google** | Local interactive use | No (usually) |
| **Gemini API Key** | Headless / AI Studio users | No |
| **Vertex AI** | Enterprise / GCP users | Yes |

## Persisting Credentials

To avoid re-authentication, variables can be added to shell configuration files (e.g., `~/.zshrc`) or stored in a `.gemini/.env` file. Gemini CLI searches for `.env` files in the current directory and then in the home directory (`~/.gemini/.env`).

## See Also

- [[google-ai-studio]] — Provider of Gemini API keys
- [[google-cloud-project]] — Required for organization and Vertex AI users
- [[vertex-ai]] — Enterprise-grade model platform
