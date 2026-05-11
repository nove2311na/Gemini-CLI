# Module 1: Introduction & Environment Setup

## 1. Learning Objectives
By the end of this module, students will be able to:
- **[Remember]** Identify the core capabilities and system requirements of Gemini CLI.
- **[Understand]** Distinguish between different authentication methods (Google Sign-in, API Key, Vertex AI) and release channels.
- **[Apply]** Install, authenticate, and configure Gemini CLI for a local development environment.
- **[Analyze]** Select the appropriate model routing (Auto vs. Pro) based on task complexity.

---

## 2. What is Gemini CLI?
Gemini CLI is a terminal-based interface that integrates Google's Gemini models directly into the developer's local environment. Unlike web-based chat interfaces, Gemini CLI has direct access to the local file system and shell, allowing it to:
- **Analyze Codebases:** Read multiple files to understand context and dependencies.
- **Automate Workflows:** Execute shell commands, run tests, and refactor code.
- **Maintain Context:** Use project-specific instructions (`GEMINI.md`) and persistent memory.

### Technical Architecture
Gemini CLI operates as a stateful session manager. It handles:
- **Context Injection:** Gathering file contents and shell outputs into the model's context window.
- **Tool Orchestration:** Managing permissions for file writes, shell execution, and web fetching.
- **Token Optimization:** Using techniques like token caching and context compression to manage long-running sessions efficiently.

---

## 3. Installation and Releases

### System Requirements
- **OS:** macOS 15+, Windows 11 24H2+, Ubuntu 20.04+.
- **Runtime:** Node.js 20.0.0+.
- **Hardware:** 4GB RAM (Casual), 16GB+ RAM (Power usage).

### Installation Methods
The recommended method is global installation via `npm`:
```bash
rtk npm install -g @google/gemini-cli
```
Alternatively, use `npx` for one-time execution without installation:
```bash
rtk npx @google/gemini-cli
```

### Release Channels
1. **Stable (latest):** Default. Updated weekly. High reliability.
2. **Preview:** Includes new features like Gemini 3 Pro support.
3. **Nightly:** Bleeding edge, potential instability.

---

## 4. Authentication Methods

| Method | Best For | Requirements |
| :--- | :--- | :--- |
| **Google Sign-in** | Individual Users | Web browser for OAuth. |
| **Gemini API Key** | AI Studio Users / Headless | `GEMINI_API_KEY` env var. |
| **Vertex AI** | Enterprise / GCP Users | `gcloud` ADC or Service Account JSON. |

### Persisting Credentials
To avoid re-authenticating, use a `.env` file at `~/.gemini/.env`:
```bash
# Example ~/.gemini/.env
GEMINI_API_KEY="your_api_key_here"
GOOGLE_CLOUD_PROJECT="your-project-id"
```

---

## 5. Model Selection: Pro vs. Flash

Gemini CLI allows switching between models using the `/model` command.

### Routing Types
- **Auto Routing (Default):** The CLI analyzes the prompt. Simple tasks (listing files) go to **Flash**. Complex tasks (refactoring) go to **Pro**.
- **Pro Routing:** Forces the use of the most capable model (e.g., Gemini 3 Pro) for all turns.

### Using Gemini 3
To enable Gemini 3 Pro (Preview):
1. Install latest: `rtk npm install -g @google/gemini-cli@latest`
2. Set `/settings` -> `Preview Features` to `true`.
3. Select `Auto (Gemini 3)` in `/model`.

---

## 6. Case Study: The Enterprise Setup
**Scenario:** A developer at a large company needs to use Gemini CLI with Vertex AI and a specific GCP project.
**Solution:**
1. Authenticate via `gcloud auth application-default login`.
2. Set environment variables:
   ```bash
   export GOOGLE_CLOUD_PROJECT="enterprise-ai-project"
   export GOOGLE_CLOUD_LOCATION="us-central1"
   ```
3. Launch `rtk gemini` and select **Vertex AI** as the auth provider.

---

## 7. Comparison: Installation Tools
| Feature | npm install -g | npx | Homebrew |
| :--- | :--- | :--- | :--- |
| Persistence | Permanent | Temporary | Permanent |
| Updates | Manual (`npm install`) | Automatic (fetches latest) | Manual (`brew upgrade`) |
| Isolation | Shared global space | Isolated | System-level |

---

## Citations
- Source: [Gemini CLI documentation](Clippings/I. Get started/1. Gemini CLI documentation.md)
- Source: [Installation Guide](Clippings/I. Get started/3. Gemini CLI installation, execution, and releases.md)
- Source: [Authentication Setup](Clippings/I. Get started/4. Gemini CLI authentication setup.md)
- Source: [Gemini 3 Guide](Clippings/I. Get started/6. Gemini 3 Pro and Gemini 3 Flash on Gemini CLI.md)
