---
name: context-aggregator
description: Aggregate multiple Markdown documentation files (clippings, wiki pages) into a single master document optimized for NotebookLM ingestion or large-context sharing. Use when preparing data for NotebookLM Audio Overviews or creating a unified project knowledge base.
---

# Context Aggregator

This skill provides a validated procedure for bundling distributed documentation into a single, structured Markdown file.

## Core Workflow: Documentation Bundling

To create a "Master Docs" file for NotebookLM or other LLMs:

1. **Identify Source**: Usually `Clippings/` or `wiki/`.
2. **Execute Aggregation**: Use a command that preserves headers and adds distinct separators between files.
3. **PowerShell (Windows Recommended)**:
   ```powershell
   Get-ChildItem -Path "Clippings" -Filter "*.md" -Recurse | ForEach-Object { 
     "`n`n# FILE: " + $_.FullName + "`n"; 
     Get-Content $_.FullName; 
     "`n`n---`n`n" 
   } | Set-Content "output/Gemini_CLI_Master_Docs.md"
   ```
4. **Bash (Alternative)**:
   ```bash
   find Clippings -name "*.md" -exec sh -c 'echo "\n\n# FILE: {}"; cat {}; echo "\n\n---\n\n"' \; > output/Master_Docs.md
   ```

## Best Practices
- **Separators**: Use `---` and `# FILE: path/to/file.md` to help the LLM distinguish between source documents.
- **Output Path**: Always store the result in the `output/` directory as specified in the project structure.
- **Verification**: Check the file size or line count of the resulting master document to ensure it's not empty.
  ```bash
  rtk ls -l output/Gemini_CLI_Master_Docs.md
  ```

## NotebookLM Specifics
- Once the file is created, instruct the user to upload it to [NotebookLM](https://notebooklm.google.com/).
- Recommend using the **Audio Overview** feature for multi-modal learning.
- Provide a "Context Focus" prompt (e.g., "Focus on technical architecture and configuration") for the user to paste into NotebookLM's custom instructions.
