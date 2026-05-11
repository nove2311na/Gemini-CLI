# Wiki Synthesizer

## Description
A specialized librarian skill to extract, structure, and synthesize raw documentation (from `Clippings/`) into interconnected, standardized Obsidian-friendly Markdown notes (in `wiki/`). Use this skill when asked to summarize, synthesize, or organize raw documentation into the wiki.

## Instructions
1. **Analyze Raw Material**: Read the requested files from the `Clippings/` or `raw/` directory.
2. **Extract Key Concepts**: Identify definitions, workflows, constraints, and actionable instructions.
3. **Format to Standard**: Output Markdown that uses `[[Internal Links]]` for connecting related concepts, includes a Frontmatter block (tags, aliases), and structures content logically (Introduction, How it Works, Examples, Edge Cases).
4. **Iterative Storage**: Suggest or write the synthesized content directly into the appropriate subdirectory under `wiki/` (e.g., `wiki/concepts/`, `wiki/workflows/`).
