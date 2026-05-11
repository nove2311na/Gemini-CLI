# CLI Troubleshooter

## Description
An expert debugging skill that analyzes Gemini CLI error logs, stack traces, and configuration issues, cross-referencing them against official documentation to provide precise solutions. Use this skill when the user asks for help debugging an issue, fixing a configuration, or understanding an error log related to Gemini CLI.

## Instructions
1. **Isolate the Error**: Carefully read the provided error log, terminal output, or behavioral description. Identify the failing component (e.g., MCP server, Hook, Auto Mode, context limit).
2. **Cross-Reference Documentation**: Search the `Clippings/` and `wiki/` directories for known limitations, troubleshooting steps, and exact configuration schemas.
3. **Identify the Root Cause**: Explain *why* the error is happening based on how the CLI is designed to operate.
4. **Provide Actionable Fixes**: Give exact, step-by-step instructions to resolve the issue (e.g., "Update your `settings.json` to include X", "Modify your `GEMINI.md` to format the instruction like Y").
5. **Propose Workarounds**: If a direct fix isn't available due to current CLI limitations, provide the most efficient alternative workflow.
