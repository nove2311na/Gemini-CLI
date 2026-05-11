---
type: entity
title: "Google AI Studio"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "google"
  - "api"
  - "development"
related:
  - "[[gemini-cli]]"
  - "[[authentication-methods]]"
sources: ["4-gemini-cli-authentication-setup.md"]
---

# Google AI Studio

Google AI Studio is a web-based prototyping tool for building with Gemini models. It provides a fast way to get API keys and experiment with prompt engineering.

## Role in Gemini CLI

For [[gemini-cli]] users, Google AI Studio serves as the primary source for **Gemini API keys**. This is a key component of the [[authentication-methods]] for:
- Users who want to avoid browser-based OAuth logins.
- Automated workflows and CI/CD pipelines.
- Running Gemini CLI in [[headless-mode]].

## Getting Started

1. Visit [aistudio.google.com](https://aistudio.google.com/).
2. Navigate to the **Get API key** section.
3. Create a new API key in a new or existing Google Cloud project.
4. Copy the key and use it to set the `GEMINI_API_KEY` environment variable.

## Quotas and Pricing

API keys from Google AI Studio are subject to specific quotas. Free tier usage is available, often with high limits for experimentation, while paid tiers offer higher capacity and enterprise features.

## See Also

- [[authentication-methods]] — How to use AI Studio keys with Gemini CLI
- [Official Google AI Studio](https://aistudio.google.com/)
