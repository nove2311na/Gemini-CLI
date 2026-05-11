# Hands-on Lab: Module 1

## Overview
- **Type:** Installation & Setup
- **Target Audience:** New Users
- **Time Estimate:** 15 Minutes

---

## Level 1: Basic - Installation & Verification
**Objective:** Get Gemini CLI running on your system.

1. Install Gemini CLI globally:
   ```bash
   rtk npm install -g @google/gemini-cli
   ```
2. Verify the version:
   ```bash
   rtk gemini --version
   ```
3. Run the interactive mode:
   ```bash
   rtk gemini
   ```

---

## Level 2: Intermediate - Authentication & Model Check
**Objective:** Authenticate and inspect the active model.

1. Inside the CLI, use the `/model` command to see available models.
2. Check your current authentication status and model statistics:
   ```bash
   /stats model
   ```
3. (Optional) If using an API Key, exit and run:
   ```bash
   export GEMINI_API_KEY="your_key"
   rtk gemini
   ```
   Select **Use Gemini API Key** when prompted.

---

## Level 3: Challenge - Persistent Configuration
**Objective:** Setup a project-specific environment.

1. Create a new directory `gemini-test` and enter it.
2. Create a `.gemini` folder and an `.env` file:
   ```bash
   mkdir .gemini
   echo 'GEMINI_API_KEY="your_key"' > .gemini/.env
   ```
3. Launch `rtk gemini` and verify that it doesn't ask for login if the key is valid.
4. Try switching to **Pro** routing using `/model`.

---

## Troubleshooting
- **Command not found:** Ensure your npm global bin directory is in your PATH.
- **Authentication fails:** Check your internet connection and verify that your Google account has access to Gemini services.
- **Docker Errors (if using sandbox):** Ensure Docker Desktop is running and you have necessary permissions.

---

## Citations
- Source: [Installation Guide](Clippings/I. Get started/3. Gemini CLI installation, execution, and releases.md)
- Source: [Authentication Setup](Clippings/I. Get started/4. Gemini CLI authentication setup.md)
