---
type: source
title: "MCP servers with Gemini CLI"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "gemini-cli"
  - "mcp"
  - "integration"
  - "extensibility"
related:
  - "[[mcp-server-integration]]"
  - "[[mcp-tools]]"
  - "[[mcp-authentication]]"
  - "[[gemini-cli-extensions]]"
sources: ["1. MCP servers with Gemini CLI.md"]
---

# MCP servers with Gemini CLI

This official documentation from geminicli.com (dated 2026-04-17) provides a comprehensive guide to configuring and using Model Context Protocol (MCP) servers with Gemini CLI. It covers the discovery and execution architecture, transport mechanisms, security features, OAuth authentication, and CLI management commands.

## Key Topics

The documentation explains how MCP servers act as bridges between Gemini CLI and external systems, enabling interaction with databases, APIs, custom scripts, and specialized workflows. It details the multi-phase discovery process orchestrated by `discoverMcpTools()`, which iterates through configured servers, establishes connections, fetches tool definitions, sanitizes schemas, and registers tools in the global registry.

Three transport mechanisms are documented: Stdio Transport for local subprocess communication, SSE Transport for Server-Sent Events endpoints, and Streamable HTTP Transport for HTTP streaming. Security features include automatic environment variable redaction of sensitive credentials, explicit trust configuration per server, and per-server tool confirmation controls.

The OAuth 2.0 authentication section covers automatic discovery and browser-based flows for remote MCP servers, including token storage and refresh. For Google Cloud Platform integration, service account impersonation enables authentication with IAP-protected Cloud Run services.

## Configuration and Usage

The guide provides detailed `settings.json` configuration examples for various scenarios including Python servers, Node.js servers, Docker-based servers, HTTP servers with custom headers, and servers with tool filtering. The `/mcp` command displays server status, connection details, and available tools, while the `gemini mcp` command group enables programmatic management of server configurations.

## Important Warnings

The documentation notes that OAuth browser redirect requirements limit use in headless, containerized, or SSH environments without browser support. The `trust: true` option bypasses all confirmations and should be used cautiously. MCP connection errors for background servers are silent by default to minimize startup noise.