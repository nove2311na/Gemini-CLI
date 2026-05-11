---
type: concept
title: "JSON Output Format"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "json"
  - "output-format"
  - "structured-data"
  - "scripting"
  - "api"
related:
  - "[[gemini-cli]]"
  - "[[headless-mode]]"
  - "[[stdout-piping]]"
  - "[[gcommit]]"
sources: ["10. Automate tasks with headless mode.md"]
---

# JSON Output Format

The JSON output format is a flag (`--output-format json`) that makes [[gemini-cli]] return machine-readable structured responses suitable for programmatic processing in scripts and tool chains.

## Overview

When `--output-format json` is specified, Gemini CLI returns a JSON object containing structured data. This enables integration with other tools that consume JSON, such as `jq` for parsing, API endpoints, or configuration management systems.

## Response Structure

The JSON response uses a wrapper structure with a `response` field containing the actual output. To extract the raw data, tools like `jq` are used to access the `.response` property:

```bash
gemini --output-format json "Return a JSON object with keys 'version' and 'deps'" | jq -r '.response' > data.json
```

## Usage Pattern

The standard pattern for extracting structured data:

1. Request JSON output with `--output-format json`
2. Use `jq` to parse the response field on macOS/Linux
3. Use `ConvertFrom-Json` on Windows PowerShell

### macOS/Linux Example

```bash
gemini --output-format json "Return a raw JSON object with keys 'version' and 'deps' from @package.json" | jq -r '.response' > data.json
```

### Windows PowerShell Example

```powershell
$output = gemini --output-format json "Return a JSON object with keys 'version' and 'deps' from @package.json" | ConvertFrom-Json
$output.response | Out-File -FilePath data.json -Encoding utf8
```

## Advantages for Automation

JSON output provides several benefits for scripted workflows:

- **Structured data**: Responses can be parsed and processed programmatically
- **Tool integration**: Works seamlessly with JSON processing tools like `jq`
- **API compatibility**: Output can be passed directly to APIs or web services
- **Reliable parsing**: JSON structure is predictable and machine-readable

## Dependencies

On macOS/Linux, extracting JSON data typically requires `jq` to be installed. Windows PowerShell has built-in JSON handling via `ConvertFrom-Json`.

## Example Output

A typical extracted JSON file looks like:

```json
{
  "version": "1.0.0",
  "deps": {
    "react": "^18.2.0"
  }
}
```

## Use Cases

- Extracting structured information from configuration files
- Generating data files for other tools
- Creating structured reports from unstructured input
- Building custom AI tools that consume LLM output

## See Also

- [[headless-mode]] for the execution context
- [[stdout-piping]] for chaining with other tools
- [[gcommit]] for an example of text output in custom tools