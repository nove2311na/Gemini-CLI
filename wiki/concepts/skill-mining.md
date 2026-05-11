---
type: concept
title: "Skill Mining"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "skill-extraction"
  - "pattern-recognition"
  - "knowledge-management"
  - "session-analysis"
related:
  - "[[auto-memory]]"
  - "[[confucius-subagent]]"
  - "[[inbox-model]]"
  - "[[session]]"
  - "[[extensions]]"
sources: ["III. 3. Auto Memory.md"]
---

# Skill Mining

Skill mining is the process of automatically extracting reusable procedural patterns from session transcripts and converting them into formal Agent Skills. This technique transforms implicit knowledge—workflows that users repeatedly explain to the agent—into explicit, reusable assets.

## Concept Overview

In daily use, users often walk the Gemini CLI agent through the same procedures repeatedly: setting up specific project configurations, running particular build sequences, handling project-specific edge cases, or following team conventions. Skill mining captures these recurring patterns so future sessions can apply them without manual explanation.

## How Skill Mining Works

Auto Memory implements skill mining through a background extraction pipeline:

1. **Session indexing** — Recent sessions are scanned for eligibility based on idle time and message count
2. **Pattern detection** — The extraction agent identifies procedural sequences that repeat across sessions
3. **Skill drafting** — Detected patterns are formatted as SKILL.md files with appropriate metadata
4. **Quality filtering** — A conservative threshold prevents trivial or one-off incidents from becoming skills
5. **User review** — Draft skills await user approval before becoming active

## Quality Assurance

Skill mining uses a conservative approach to ensure quality. The extraction agent defaults to creating zero skills unless evidence strongly supports a recurring pattern. This prevents inbox clutter from spurious extractions and ensures that only genuinely useful skills reach the promotion stage.

## Privacy Considerations

Skill mining processes only local session files. The extraction agent communicates with the Gemini API through normal calls but never uploads raw session content. Secrets and credentials encountered during analysis are redacted, and large tool outputs are never copied verbatim.

## Relationship to Manual Skill Authoring

Skill mining complements manual skill authoring rather than replacing it. Users can still create skills by hand for intentional, designed workflows. Skill mining captures implicit knowledge that emerges organically from repeated interactions, filling gaps that manual authoring might miss.