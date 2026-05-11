---
title: "brian-tech_stack"
source: "https://chatgpt.com/g/g-p-6901f79281e48191a7e4872fe3fddebf-brian-tech-stack/c/69fd883b-364c-83ec-b651-5a7c3cc5628c"
author:
published:
created: 2026-05-08
description: "ChatGPT is your AI chatbot for everyday use. Chat with the most advanced AI to explore ideas, solve problems, and learn faster."
tags:
  - "clippings"
---
```markdown
from pathlib import Path
import json, zipfile, textwrap, os, shutil

base = Path("/mnt/data/roadmap_agent_skill_pack")
if base.exists():
    shutil.rmtree(base)

# Directory structure
dirs = [
    base / ".claude" / "agents",
    base / ".claude" / "skills" / "roadmap-formatting" / "templates",
    base / ".claude" / "skills" / "roadmap-formatting" / "checklists",
    base / ".claude" / "skills" / "roadmap-formatting" / "rubrics",
    base / ".claude" / "skills" / "roadmap-formatting" / "examples",
    base / ".claude" / "commands" / "ckm",
    base / ".claude" / "workflows",
    base / ".claude" / "schemas",
    base / "docs",
]
for d in dirs:
    d.mkdir(parents=True, exist_ok=True)

files = {}

files["README.md"] = """# Roadmap Agent & Skill Pack

Bộ file này dùng để tạo, chuẩn hoá, format lại và review chất lượng roadmap theo format internal.

## Dùng cho nghiệp vụ nào?

- Format lại roadmap từ raw notes / bullet points.
- Tạo roadmap implementation / research / training / pilot.
- Chuẩn hoá phase, task, deliverable, milestone, dependency, risk và metrics.
- Review roadmap trước khi publish nội bộ.
- Rework roadmap nhiều vòng theo rubric.

## Cấu trúc file

\`\`\`text
.claude/
  agents/
    roadmap-implementation-architect.md
  skills/
    roadmap-formatting/
      SKILL.md
      templates/
        roadmap-template.md
        phase-template.md
        task-table-template.md
      checklists/
        roadmap-format-checklist.md
      rubrics/
        roadmap-quality-rubric.md
      examples/
        marketing-automation-roadmap.sample.md
  commands/
    ckm/
      format-roadmap.md
      review-roadmap.md
  workflows/
    roadmap-formatting.workflow.md
  schemas/
    roadmap.schema.json
docs/
  roadmap-agent-usage.md
```

## Cách dùng nhanh

### 1\. Format roadmap từ raw input

```markdown
Use roadmap-implementation-architect to format this raw roadmap into the standard internal roadmap structure.
```

### 2\. Review roadmap

```markdown
Use roadmap-formatting skill to review this roadmap against the roadmap-quality-rubric and suggest improvements.
```

### 3\. Rework đến bản publish-ready

```markdown
Rewrite this roadmap until it reaches publish-ready quality. Keep the same facts, improve structure, clarity, deliverables, milestones, risks and success metrics.
```

## Nguyên tắc chính

- Không làm mất thông tin gốc.
- Không tự bịa status, owner, timeline hoặc link nếu input chưa có.
- Nếu thiếu thông tin, ghi rõ `TBD` hoặc `Needs input`.
- Roadmap phải review được bởi Manager / Team Lead.
- Mỗi phase phải có mục tiêu, input, output, task, milestone và gate rõ.  
	"""

## files\[".claude/agents/roadmap-implementation-architect.md"\] = """--- name: roadmap-implementation-architect description: Use this agent when the user needs to create, rewrite, normalize, format, review, or publish an implementation, research, training, automation, AI, agentic, or product roadmap. This agent is optimized for turning raw notes into a structured internal roadmap with phases, tasks, deliverables, milestones, risks, success metrics, and progress tracking. tools: Read, Write, Edit, MultiEdit, Glob, Grep

## Roadmap Implementation Architect

## Role

You are a roadmap architect for internal business, product, technical, AI, automation, and agentic initiatives.

Your job is to convert messy notes, raw bullets, meeting notes, partially written documents, or loosely defined plans into a clear, reviewable, publish-ready roadmap.

You should produce roadmaps that are useful for:

- Manager review.
- Team Lead execution.
- Technical owner implementation.
- Cross-functional stakeholder alignment.
- Progress tracking.
- Future handover.

## Primary responsibilities

1. Extract the real initiative goal from raw input.
2. Identify the problem being solved.
3. Normalize scope and out-of-scope.
4. Break the work into phases.
5. Convert loose tasks into structured task tables.
6. Define deliverables and success gates.
7. Add milestones, timeline, dependencies, risks, and success metrics.
8. Add current-state tracking.
9. Preserve all original facts, links, timelines, owners, and statuses.
10. Make the document easy to publish internally.

## When to use this agent

Use this agent when the user asks for any of the following:

- "format lại roadmap"
- "viết roadmap"
- "chuẩn hoá roadmap"
- "tạo roadmap implementation"
- "tạo roadmap research"
- "tạo roadmap training"
- "review roadmap"
- "rework roadmap"
- "làm roadmap publish-ready"
- "biến notes này thành roadmap"
- "viết agent / skill để format roadmap"

## Required behavior

### Preserve source facts

Always preserve:

- Phase names.
- Existing timeline.
- Current status.
- Owner.
- Existing output links.
- Existing technical choices.
- Explicit assumptions.
- Explicit constraints.
- Existing dependencies.
- Existing risks.

Do not invent missing facts. Use `TBD`, `Needs input`, or `Pending validation`.

### Improve structure

Convert raw notes into this standard structure:

1. Tổng quan nhiệm vụ
2. Cấu trúc roadmap
3. Danh sách task chi tiết
4. Deliverables / Output của từng phase
5. Milestones & Timeline tổng
6. Dependencies & Risk
7. Success Metrics
8. Trạng thái hiện tại & Map Task
9. Timeline tổng quan theo effort / pace
10. Bảng so sánh nhanh
11. Ghi chú triển khai, if needed

### Clarify gates

Each phase should have a pass condition or gate.

Examples:

- `Discovery Pass`: pain points confirmed with stakeholder.
- `Foundation Pass`: folder structure and docs created.
- `Pilot Build Pass`: at least one workflow runs end-to-end.
- `Handover Pass`: internal docs and next-step plan completed.

### Make it operational

The output should not only look clean. It must help people execute.

For each phase, include:

- Goal.
- Expected timeline.
- Owner.
- Status.
- Input.
- Output.
- Task table.
- Main checkpoint / gate.

## Standard output style

Use Markdown.

Use Vietnamese by default if the user's input is Vietnamese.

Use clear headings.

Use tables when comparing or tracking.

Use status symbols consistently:

- `✅ Done`
- `🟡 In progress`
- `⬜ Pending`
- `⬜ Not started`
- `⚠️ Blocked`
- `TBD`

Use task IDs:

- `MA-01`, `MA-02` for Marketing Automation.
- `RA-01`, `RA-02` for Research Automation / Research Agentic.
- `WA-01`, `WA-02` for Workflow Automation.
- If no domain exists, use `RM-01`, `RM-02`.

## Quality standard

A roadmap is publish-ready only if:

- A manager can understand the current state in under 3 minutes.
- A team member can know what to do next.
- Each phase has a clear output.
- Each task has a clear deliverable.
- Blockers and TBD areas are visible.
- Risks and mitigation are specific.
- Success metrics are measurable enough for review.

## Output modes

### Mode 1 — Full roadmap

Use this when the user asks to format or create a roadmap.

Return a full Markdown document with YAML frontmatter.

### Mode 2 — Review only

Use this when the user asks to review or score a roadmap.

Return:

- Score by rubric.
- Strengths.
- Gaps.
- Suggested rework.
- Priority fixes.

### Mode 3 — Rework loop

Use this when the user asks to rework until best version.

Process:

1. Review current version.
2. Score by rubric.
3. Identify highest-impact gaps.
4. Rewrite.
5. Score again.
6. Provide final version once it is publish-ready.

Do not claim perfection if important input is missing. Say which parts are still `TBD`.

## Constraints

- Do not remove important original details just to make the document shorter.
- Do not over-engineer roadmap with unnecessary methodology.
- Do not make vague deliverables like "improved system" unless paired with concrete output.
- Do not change business decision unless explicitly asked.
- Do not rewrite external links unless necessary.
- Do not fabricate metrics from nowhere.  
	"""

## files\[".claude/skills/roadmap-formatting/SKILL.md"\] = """--- name: roadmap-formatting description: Create, normalize, format, review, and improve internal roadmaps for implementation, research, training, automation, AI, agentic systems, product initiatives, and technical pilots.

## Roadmap Formatting Skill

## Purpose

This skill turns raw roadmap content into a structured internal roadmap that can be reviewed, tracked, and published.

It is especially useful for roadmaps involving:

- Automation.
- AI workflows.
- Agentic systems.
- Research programs.
- Training programs.
- Product initiatives.
- Technical pilots.
- Internal operation improvements.

## Input

The user may provide:

- Raw notes.
- Markdown roadmap.
- Meeting notes.
- A list of phases.
- A list of tasks.
- A target format.
- A previous roadmap sample.
- A partially completed internal doc.

## Output

The default output is a complete Markdown roadmap with this structure:

```markdown
---
title:
tags:
status:
last_updated:
aliases:
---

# ROADMAP ...

> [!important] Mục đích tài liệu này
> ...

## 1. Tổng quan nhiệm vụ
## 2. Cấu trúc roadmap
## 3. Danh sách task chi tiết
## 4. Deliverables / Output của từng phase
## 5. Milestones & Timeline tổng
## 6. Dependencies & Risk
## 7. Success Metrics
## 8. Trạng thái hiện tại & Map Task
## 9. Timeline tổng quan theo effort / pace
## 10. Bảng so sánh nhanh
## 11. Ghi chú triển khai
```

## Procedure

### Step 1 — Parse source content

Extract:

- Initiative name.
- Goal.
- Problem.
- Scope.
- Out of scope.
- Success metrics.
- Phases.
- Tasks.
- Owners.
- Timelines.
- Status.
- Input / output.
- Links.
- Dependencies.
- Risks.
- Current blockers.

### Step 2 — Normalize initiative type

Classify the roadmap as one of:

- `training`
- `research`
- `implementation`
- `pilot`
- `product`
- `technical-foundation`
- `automation`
- `agentic-system`
- `hybrid`

This classification affects the title and phase language.

Examples:

- Training roadmap → `ROADMAP TRAINING — ...`
- Research roadmap → `ROADMAP RESEARCH — ...`
- Pilot roadmap → `ROADMAP IMPLEMENTATION — ...`
- Product roadmap → `ROADMAP PRODUCT — ...`

### Step 3 — Build metadata

Create YAML frontmatter:

```markdown
---
title: "Roadmap Implementation — [Initiative Name]"
tags:
  - roadmap
  - [domain-tag]
status: in-progress
last_updated: YYYY-MM-DD
aliases:
  - [short-alias]
---
```

Rules:

- If status is given, preserve it.
- If status is not given, use `draft`.
- If date is not given, use today's date.
- Tags should be short and lowercase.

### Step 4 — Write overview

Include:

- Problem being solved.
- Goal.
- Role of the roadmap.
- Scope.
- Out of scope.

The overview should explain why the roadmap exists and how people should use it.

### Step 5 — Create phase breakdown

For each phase, create a row with:

- Phase ID.
- Phase name.
- Focus.
- Timeline.
- Status.
- Owner.

The table must allow a manager to understand the whole roadmap quickly.

### Step 6 — Convert tasks into structured task tables

For each phase, include:

```markdown
| Mã Task | Tên Task | Description | Deliverable | Priority | Timeline | Status |
|---|---|---|---|---|---|---|
```

Rules:

- Every task needs a deliverable.
- Every task needs a timeline, even if `TBD`.
- Every task needs a status.
- Use consistent task IDs.
- Preserve original links.

### Step 7 — Define deliverables by phase

Create a summary table:

```markdown
| Phase | Deliverable cụ thể | Format | Vị trí lưu trữ / Link |
```

If storage location is unknown, use `Internal docs / TBD`.

### Step 8 — Define milestones

Create a milestone table:

```markdown
| Milestone | Chặng đường | Deadline dự kiến | Kết quả cần đạt | Status |
```

Each milestone must map to a real phase or checkpoint.

### Step 9 — Add dependencies and risks

Dependencies should be concrete.

Examples:

- Tool access.
- Data access.
- Sample input/output.
- Stakeholder review.
- Integration readiness.
- Technical owner.
- Documentation owner.

Risks must include mitigation.

Avoid vague risks like `technical risk`. Write what can actually go wrong.

### Step 10 — Add success metrics

Separate into:

- Management metrics.
- Quality / execution metrics.
- Business value metrics, if relevant.

### Step 11 — Add progress tracker

Create current-state tracking tables.

Track:

- Completed setup / research items.
- Tasks by phase.
- Blockers.
- Pending input.

### Step 12 — Add timeline visualization

Use a text block:

```markdown
Ngày 1–3      │ Phase 1 ...       │ Task IDs       │ Status
...
────────────────────────────────────────────────────────────
Tổng effort:
Effort đã hoàn thành:
Effort còn lại:
Điểm block hiện tại:
```

### Step 13 — Add quick comparison table

Use this for:

- Tool comparison.
- Pace comparison.
- Before/after state.
- Current status summary.

### Step 14 — Final quality pass

Before returning the roadmap, check:

- Does every phase have a goal?
- Does every phase have output?
- Does every task have deliverable?
- Are all TBDs visible?
- Are risks specific?
- Is current status clear?
- Can someone execute the next step?

## Style guide

Use Vietnamese if source content is Vietnamese.

Use English technical terms when they are clearer:

- workflow
- automation
- agentic system
- pilot
- handover
- stakeholder
- dependency
- integration
- stack
- trigger
- output

Use bold for important statuses and decisions.

Use callouts:

```markdown
> [!important]
> ...

> [!note]
> ...

> [!warning]
> ...
```

## Do not

- Do not remove links.
- Do not invent missing links.
- Do not invent exact dates if only effort is provided.
- Do not claim production readiness if roadmap only covers pilot.
- Do not hide blockers.
- Do not make every task "High priority"; preserve nuance.
- Do not turn a roadmap into a generic essay.  
	"""

files\[".claude/skills/roadmap-formatting/templates/roadmap-template.md"\] = """---  
title: "Roadmap \[Type\] — \[Initiative Name\]"  
tags:

- roadmap
- \[domain\]  
	status: \[draft | in-progress | done\]  
	last\_updated: \[YYYY-MM-DD\]  
	aliases:
- \[alias\]

---

## ROADMAP \[TYPE\] — \[INITIATIVE NAME\]

> \[!important\] Mục đích tài liệu này  
> \[Explain who this roadmap is for and what it defines.\]

---

## 1\. Tổng quan nhiệm vụ

### 1.1 Bài toán đang giải quyết

\[Describe the problem.\]

Những vấn đề hiện tại:

- \[Problem 1\]
- \[Problem 2\]
- \[Problem 3\]

**Giải pháp:**  
\[Describe the high-level roadmap approach.\]

### 1.2 Mục tiêu initiative

- \[Goal 1\]
- \[Goal 2\]
- \[Goal 3\]

### 1.3 Vai trò của roadmap này

Roadmap này là tài liệu quản trị triển khai cho initiative **\[Initiative Name\]**.

Tài liệu này giúp:

- \[Audience / usage 1\]
- \[Audience / usage 2\]
- \[Audience / usage 3\]

### 1.4 Phạm vi triển khai

Roadmap bao gồm:

- \[Scope item 1\]
- \[Scope item 2\]
- \[Scope item 3\]

### 1.5 Phạm vi ngoài lề

Roadmap này **chưa bao gồm**:

- \[Out-of-scope item 1\]
- \[Out-of-scope item 2\]
- \[Out-of-scope item 3\]

---

## 2\. Cấu trúc roadmap

Initiative được chia thành **\[N\] phase chính**, tổng effort hiện tại là **\[X ngày / tuần + TBD\]**.

| Giai đoạn | Tên Phase | Nội dung trọng tâm | Thời gian dự kiến | Trạng thái | Owner |
| --- | --- | --- | --- | --- | --- |
| **Phase 1** | **\[Phase Name\]** | \[Focus\] | \[Timeline\] | \[Status\] | \[Owner\] |

> \[!note\] Trạng thái hiện tại  
> \[Current status summary.\]

---

## 3\. Danh sách task chi tiết

### 3.1 Phase 1 — \[Phase Name\]

**Mục tiêu:**  
\[Phase goal.\]

**Thời gian dự kiến:** \[Timeline\]  
**Owner:** \[Owner\]  
**Status:** \[Status\]

| Mã Task | Tên Task | Description | Deliverable | Priority | Timeline | Status |
| --- | --- | --- | --- | --- | --- | --- |
| **\[ID-01\]** | \[Task name\] | \[Description\] | \[Deliverable\] | \[Priority\] | \[Timeline\] | \[Status\] |

**Output chính của Phase 1:**

- \[Output 1\]
- \[Output 2\]

---

## 4\. Deliverables / Output của từng phase

| Phase | Deliverable cụ thể | Format | Vị trí lưu trữ / Link |
| --- | --- | --- | --- |
| **Phase 1: \[Name\]** | \[Deliverable\] | \[Format\] | \[Location\] |

---

## 5\. Milestones & Timeline tổng

| Milestone | Chặng đường | Deadline dự kiến | Kết quả cần đạt | Status |
| --- | --- | --- | --- | --- |
| **M0** | Kickoff | \[Date / Day\] | \[Gate\] | \[Status\] |

---

## 6\. Dependencies & Risk

### 6.1 Dependencies

- **\[Dependency\]:** \[Why it matters.\]

### 6.2 Risks & Mitigation

| Risk | Hướng xử lý |
| --- | --- |
| **\[Risk\]** | \[Mitigation\] |

---

## 7\. Success Metrics

### 7.1 Metrics quản trị

- **\[Metric\]:** \[Definition\]

### 7.2 Metrics chất lượng

- **\[Metric\]:** \[Definition\]

---

## 8\. Trạng thái hiện tại & Map Task

> Cập nhật lần cuối: \[YYYY-MM-DD\]

### 8.1 Setup / Research đã hoàn thành

| Hạng mục | Status | Ghi chú |
| --- | --- | --- |
| \[Item\] | \[Status\] | \[Note\] |

### 8.2 Tiến độ task theo phase

**Phase 1 — \[Phase Name\]**

| Mã | Status | Ghi chú |
| --- | --- | --- |
| **\[ID-01\]** | \[Status\] | \[Note\] |

---

## 9\. Timeline tổng quan theo effort

```markdown
[Day/Week Range] │ [Phase] │ [Task IDs] │ [Status]
────────────────────────────────────────────────────
Tổng effort:
Effort đã hoàn thành:
Effort còn lại:
Điểm block hiện tại:
```

---

## 10\. Bảng so sánh nhanh

| Tiêu chí | Option A | Option B |
| --- | --- | --- |
| \[Criterion\] | \[Value\] | \[Value\] |

---

## 11\. Ghi chú triển khai

- \[Note 1\]
- \[Note 2\]  
	"""

files\[".claude/skills/roadmap-formatting/templates/phase-template.md"\] = """### \[Section Number\] Phase \[N\] — \[Phase Name\]

**Mục tiêu:**  
\[Write the outcome this phase must achieve.\]

**Thời gian dự kiến:** \[Timeline\]  
**Owner:** \[Owner\]  
**Status:** \[Status\]

**Input:**

- \[Input 1\]
- \[Input 2\]

**Output:**

- \[Output 1\]
- \[Output 2\]

| Mã Task | Tên Task | Description | Deliverable | Priority | Timeline | Status |
| --- | --- | --- | --- | --- | --- | --- |
| **\[TASK-01\]** | \[Task name\] | \[Description\] | \[Deliverable\] | \[Priority\] | \[Timeline\] | \[Status\] |

**Checkpoint / Gate:**

- \[Pass condition 1\]
- \[Pass condition 2\]  
	"""

files\[".claude/skills/roadmap-formatting/templates/task-table-template.md"\] = """| Mã Task | Tên Task | Description | Deliverable | Priority | Timeline | Status |  
|---|---|---|---|---|---|---|  
| **\[PREFIX-01\]** | \[Task name\] | \[Clear action + context\] | \[Concrete output / link / artifact\] | \[Critical / Very High / High / Medium High / Medium\] | \[Timeline / TBD\] | \[✅ Done / 🟡 In progress / ⬜ Pending / ⬜ Not started / ⚠️ Blocked\] |  
"""

files\[".claude/skills/roadmap-formatting/checklists/roadmap-format-checklist.md"\] = """# Roadmap Format Checklist

Use this checklist before publishing a roadmap.

## 1\. Metadata

- Has YAML frontmatter.
- Has clear title.
- Has relevant tags.
- Has status.
- Has last\_updated.
- Has alias.

## 2\. Overview

- Problem is clear.
- Goal is clear.
- Scope is clear.
- Out-of-scope is clear.
- The role of the roadmap is explained.

## 3\. Phase structure

- Roadmap is broken into phases.
- Each phase has a name.
- Each phase has focus.
- Each phase has timeline.
- Each phase has owner.
- Each phase has status.

## 4\. Task quality

- Every task has an ID.
- Every task has a clear name.
- Every task has a description.
- Every task has a concrete deliverable.
- Every task has priority.
- Every task has timeline or `TBD`.
- Every task has status.

## 5\. Deliverables

- Deliverables are summarized by phase.
- Output format is clear.
- Storage location or link is provided.
- Unknown locations are marked as `TBD`.

## 6\. Milestones

- Milestones map to phases.
- Each milestone has a gate.
- Status is visible.
- Blocked milestones are clear.

## 7\. Dependencies and risks

- Dependencies are specific.
- Risks are specific.
- Each risk has mitigation.
- Open assumptions are visible.

## 8\. Metrics

- Management metrics are included.
- Quality metrics are included.
- Business value metrics are included when relevant.
- Metrics are not fake or over-precise.

## 9\. Progress tracking

- Current state is clear.
- Completed items are visible.
- Pending tasks are visible.
- Blocker is explicit.
- Next phase is obvious.

## 10\. Publish readiness

- A manager can understand the roadmap in under 3 minutes.
- A team member knows what to do next.
- No important source facts were removed.
- No unsupported facts were invented.
- The document is clean enough to share internally.  
	"""

files\[".claude/skills/roadmap-formatting/rubrics/roadmap-quality-rubric.md"\] = """# Roadmap Quality Rubric

Score each area from 1 to 5.

## 1\. Strategic clarity

| Score | Description |
| --- | --- |
| 1 | Goal is unclear or missing. |
| 2 | Goal exists but is vague. |
| 3 | Goal and problem are understandable. |
| 4 | Goal, problem, scope, and current state are clear. |
| 5 | Roadmap clearly links problem, goal, phase plan, and success criteria. |

## 2\. Operational executability

| Score | Description |
| --- | --- |
| 1 | No clear phases or tasks. |
| 2 | Phases exist but tasks are vague. |
| 3 | Tasks have owners/timelines but deliverables may be weak. |
| 4 | Tasks, deliverables, owners, statuses, and timelines are clear. |
| 5 | A team can execute directly from the roadmap with minimal clarification. |

## 3\. Deliverable quality

| Score | Description |
| --- | --- |
| 1 | Outputs are missing. |
| 2 | Outputs are generic. |
| 3 | Outputs are listed but not always concrete. |
| 4 | Each phase has concrete deliverables and formats. |
| 5 | Deliverables are concrete, reviewable, linked to gates, and easy to track. |

## 4\. Timeline and milestone quality

| Score | Description |
| --- | --- |
| 1 | Timeline missing. |
| 2 | Timeline exists but does not connect to work. |
| 3 | Phase timeline is present. |
| 4 | Timeline, milestones, and status are aligned. |
| 5 | Timeline shows effort, current state, blockers, and remaining work clearly. |

## 5\. Risk and dependency handling

| Score | Description |
| --- | --- |
| 1 | No risks or dependencies. |
| 2 | Risks are generic. |
| 3 | Some concrete risks and dependencies. |
| 4 | Clear dependencies and practical mitigations. |
| 5 | Risks, dependencies, blockers, and TBDs are explicit and actionable. |

## 6\. Stakeholder readability

| Score | Description |
| --- | --- |
| 1 | Hard to scan. |
| 2 | Long and messy. |
| 3 | Understandable with some effort. |
| 4 | Clean, structured, and easy to scan. |
| 5 | Publish-ready for manager, team lead, and stakeholder review. |

## 7\. Current-state tracking

| Score | Description |
| --- | --- |
| 1 | No current status. |
| 2 | Status exists but incomplete. |
| 3 | Status by phase is visible. |
| 4 | Status by task and phase is clear. |
| 5 | Progress, blocker, next step, and remaining effort are immediately visible. |

## Final scoring

```markdown
Total score = sum of 7 areas / 35

31–35: Publish-ready
26–30: Strong but needs small fixes
20–25: Usable draft
14–19: Needs major rework
7–13: Not ready
```

## Required feedback format

When reviewing a roadmap, return:

```markdown
## Score

| Area | Score | Comment |
|---|---:|---|
| Strategic clarity | /5 | |
| Operational executability | /5 | |
| Deliverable quality | /5 | |
| Timeline and milestone quality | /5 | |
| Risk and dependency handling | /5 | |
| Stakeholder readability | /5 | |
| Current-state tracking | /5 | |

**Total:** /35

## Strengths

- ...

## Gaps

- ...

## Priority fixes

1. ...
2. ...
3. ...

## Publish-readiness verdict

[Publish-ready / Needs small fixes / Needs major rework]
```

"""

files\[".claude/commands/ckm/format-roadmap.md"\] = """# Command: Format Roadmap

## Purpose

Format raw roadmap content into the standard internal roadmap structure.

## Use when

The user provides:

- Raw roadmap notes.
- A messy Markdown roadmap.
- A list of phases/tasks.
- A previous roadmap draft.
- A request like `format lại roadmap này`.

## Prompt

```markdown
Use the roadmap-implementation-architect agent and roadmap-formatting skill.

Task:
Convert the provided raw roadmap into the standard internal roadmap format.

Requirements:
- Preserve all original facts, timelines, owners, statuses, and links.
- Do not invent missing information.
- Mark missing information as TBD or Needs input.
- Use Vietnamese if source content is Vietnamese.
- Add YAML frontmatter.
- Add phase breakdown.
- Add task tables.
- Add deliverables by phase.
- Add milestones and gates.
- Add dependencies, risks, success metrics, progress tracker, effort timeline, and quick comparison table.
- Make it publish-ready for internal review.

Output:
Return a single Markdown roadmap.
```

"""

files\[".claude/commands/ckm/review-roadmap.md"\] = """# Command: Review Roadmap

## Purpose

Review and score a roadmap against the internal roadmap quality rubric.

## Use when

The user asks:

- `review roadmap này`
- `chấm roadmap này`
- `tự chấm theo rubric`
- `rework roadmap`
- `roadmap này publish được chưa`

## Prompt

```markdown
Use the roadmap-formatting skill and roadmap-quality-rubric.

Task:
Review the provided roadmap.

Requirements:
- Score each rubric area from 1 to 5.
- Explain the reason for each score.
- Identify strengths.
- Identify gaps.
- Suggest priority fixes.
- If asked to rework, rewrite the roadmap after scoring.
- Do not invent missing information.
- Mark unresolved areas as TBD or Needs input.

Output:
1. Score table.
2. Strengths.
3. Gaps.
4. Priority fixes.
5. Publish-readiness verdict.
6. Revised roadmap, if requested.
```

"""

files\[".claude/workflows/roadmap-formatting.workflow.md"\] = """# Workflow: Roadmap Formatting

## Objective

Convert messy roadmap input into a structured, reviewable, publish-ready roadmap.

## Trigger

Use this workflow when a user asks to create, format, review, or rework a roadmap.

## Actors

- User: provides raw roadmap content or notes.
- Agent: `roadmap-implementation-architect`
- Skill: `roadmap-formatting`

## Workflow

### Step 1 — Intake

Collect or read the source roadmap content.

Extract:

- Goal.
- Problem.
- Scope.
- Success metrics.
- Phase list.
- Task list.
- Timeline.
- Owner.
- Status.
- Links.
- Current blockers.

### Step 2 — Preserve source facts

Create a source fact map:

```markdown
Initiative:
Goal:
Current status:
Completed phases:
Pending phases:
Total effort:
Remaining effort:
Blocker:
Important links:
```

Do not lose these facts in the rewritten roadmap.

### Step 3 — Normalize structure

Apply the roadmap template:

1. Tổng quan nhiệm vụ
2. Cấu trúc roadmap
3. Danh sách task chi tiết
4. Deliverables / Output của từng phase
5. Milestones & Timeline tổng
6. Dependencies & Risk
7. Success Metrics
8. Trạng thái hiện tại & Map Task
9. Timeline tổng quan theo effort
10. Bảng so sánh nhanh
11. Ghi chú triển khai

### Step 4 — Build phase and task tables

For each phase:

- Add phase goal.
- Add timeline.
- Add owner.
- Add status.
- Add input and output when available.
- Add task table.
- Add checkpoint / gate.

### Step 5 — Add management layer

Add:

- Deliverables by phase.
- Milestones.
- Dependencies.
- Risks and mitigation.
- Success metrics.
- Current-state tracking.
- Effort timeline.
- Quick comparison table.

### Step 6 — Quality review

Use the checklist and rubric.

Check:

- Is the current state visible?
- Is the next step obvious?
- Are TBDs explicit?
- Are deliverables concrete?
- Is the roadmap easy to scan?

### Step 7 — Final output

Return the completed Markdown roadmap.

If the user asks for files, create or update the relevant `.claude` files:

- Agent file.
- Skill file.
- Templates.
- Checklist.
- Rubric.
- Commands.
- Workflow.
- Schema.  
	"""

files\[".claude/schemas/roadmap.schema.json"\] = json.dumps({  
"$schema": " [https://json-schema.org/draft/2020-12/schema](https://json-schema.org/draft/2020-12/schema) ",  
"title": "Internal Roadmap Schema",  
"type": "object",  
"required": \["title", "status", "phases"\],  
"properties": {  
"title": {  
"type": "string",  
"description": "Roadmap title"  
},  
"type": {  
"type": "string",  
"enum": \["training", "research", "implementation", "pilot", "product", "technical-foundation", "automation", "agentic-system", "hybrid"\]  
},  
"status": {  
"type": "string",  
"enum": \["draft", "in-progress", "done", "blocked", "archived"\]  
},  
"last\_updated": {  
"type": "string",  
"description": "YYYY-MM-DD"  
},  
"goal": {  
"type": "string"  
},  
"problem": {  
"type": "string"  
},  
"scope": {  
"type": "array",  
"items": {"type": "string"}  
},  
"out\_of\_scope": {  
"type": "array",  
"items": {"type": "string"}  
},  
"success\_metrics": {  
"type": "array",  
"items": {"type": "string"}  
},  
"phases": {  
"type": "array",  
"items": {  
"type": "object",  
"required": \["id", "name", "goal", "timeline", "status", "tasks"\],  
"properties": {  
"id": {"type": "string"},  
"name": {"type": "string"},  
"goal": {"type": "string"},  
"timeline": {"type": "string"},  
"owner": {"type": "string"},  
"status": {"type": "string"},  
"input": {  
"type": "array",  
"items": {"type": "string"}  
},  
"output": {  
"type": "array",  
"items": {"type": "string"}  
},  
"tasks": {  
"type": "array",  
"items": {  
"type": "object",  
"required": \["id", "name", "description", "deliverable", "priority", "timeline", "status"\],  
"properties": {  
"id": {"type": "string"},  
"name": {"type": "string"},  
"description": {"type": "string"},  
"deliverable": {"type": "string"},  
"priority": {"type": "string"},  
"timeline": {"type": "string"},  
"status": {"type": "string"}  
}  
}  
},  
"gate": {  
"type": "array",  
"items": {"type": "string"}  
}  
}  
}  
},  
"dependencies": {  
"type": "array",  
"items": {"type": "string"}  
},  
"risks": {  
"type": "array",  
"items": {  
"type": "object",  
"required": \["risk", "mitigation"\],  
"properties": {  
"risk": {"type": "string"},  
"mitigation": {"type": "string"}  
}  
}  
}  
}  
}, ensure\_ascii=False, indent=2)

files\[".claude/skills/roadmap-formatting/examples/marketing-automation-roadmap.sample.md"\] = """---  
title: "Roadmap Implementation — Marketing Automation & Agentic System"  
tags:

- marketing-automation
- agentic-system
- n8n
- roadmap
- pilot  
	status: in-progress  
	last\_updated: 2026-05-08  
	aliases:
- marketing-automation-roadmap
- marketing-agentic-roadmap

---

## ROADMAP IMPLEMENTATION — MARKETING AUTOMATION & AGENTIC SYSTEM

> \[!important\] Mục đích tài liệu này  
> Đây là roadmap triển khai nền tảng automation / AI / agentic system phục vụ team Marketing.  
> Tài liệu định nghĩa mục tiêu, phase triển khai, task chi tiết, deliverable, checkpoint, rủi ro và trạng thái hiện tại của initiative.

---

## 1\. Tổng quan nhiệm vụ

### 1.1 Bài toán đang giải quyết

Team Marketing hiện có nhiều nghiệp vụ lặp lại, nhiều điểm có khả năng tự động hoá hoặc AI hoá, nhưng chưa được mapping rõ thành hệ thống có thể triển khai.

### 1.2 Mục tiêu initiative

- Xây dựng nền tảng ban đầu cho hệ thống agentic / automation phục vụ team Marketing.
- Tăng năng lực vận hành của team Marketing thông qua automation / AI.
- Đưa được ít nhất 1 workflow / use case lên n8n ở mức pilot.

---

## 2\. Cấu trúc roadmap

| Giai đoạn | Tên Phase | Nội dung trọng tâm | Thời gian dự kiến | Trạng thái | Owner |
| --- | --- | --- | --- | --- | --- |
| **Phase 1** | **Marketing Operation Mapping** | Tìm hiểu nghiệp vụ Marketing và xác định nhóm việc có thể delegate. | 3 ngày | ✅ Done | Technical Leader |
| **Phase 2** | **Agentic Foundation Setup** | Dựng folder agentic nền tảng. | 2 ngày | ✅ Done | Technical Leader |
| **Phase 3** | **Technology Direction** | So sánh Trigger.dev và n8n. | 2 ngày | ✅ Done | Technical Leader |
| **Phase 4** | **Marketing Discovery & n8n Pilot Build** | Lấy input thực tế, chọn use case, build pilot. | 4 ngày + TBD | ⬜ Pending | Technical Leader + Marketing Team |
| **Phase 5** | **Pilot Optimization & Handover** | Review, tối ưu và handover. | 4 ngày | ⬜ Not started | Technical Leader + Marketing Team |

> \[!note\] Đây là sample rút gọn. Khi dùng thật, hãy expand đủ 10–11 section theo template.  
> """

files\["docs/roadmap-agent-usage.md"\] = """# Roadmap Agent Usage Guide

## 1\. Khi nào dùng agent?

Dùng `roadmap-implementation-architect` khi cần:

- Tạo roadmap mới.
- Format lại roadmap có sẵn.
- Chuyển raw notes thành roadmap.
- Review roadmap.
- Rework roadmap cho publish-ready.
- Chuẩn hoá task, phase, deliverable, milestone và metrics.

## 2\. Prompt mẫu

### Format roadmap

```markdown
Use roadmap-implementation-architect.

Format lại roadmap dưới đây theo chuẩn internal roadmap.
Giữ nguyên facts, link, timeline, status.
Nếu thiếu thông tin thì ghi TBD.
Output bằng Markdown.

[Paste roadmap]
```

### Review roadmap

```markdown
Use roadmap-formatting skill.

Review roadmap dưới đây theo roadmap-quality-rubric.
Chấm điểm /35, nêu gap và priority fixes.

[Paste roadmap]
```

### Rework roadmap

```markdown
Use roadmap-implementation-architect.

Rework roadmap này thành bản publish-ready.
Sau khi rework, tự chấm theo rubric và chỉ ra phần nào còn TBD.

[Paste roadmap]
```

## 3\. Output mong đợi

Một roadmap tốt cần có:

- Tổng quan nhiệm vụ.
- Cấu trúc phase.
- Task chi tiết.
- Deliverables.
- Milestones.
- Dependencies & risks.
- Success metrics.
- Current status tracker.
- Timeline tổng quan.
- Bảng so sánh nhanh.
- Ghi chú triển khai.

## 4\. Quy tắc chống hallucination

Agent không được tự bịa:

- Owner.
- Timeline.
- Status.
- Link.
- Tool decision.
- Metric chính xác.
- Production readiness.

Nếu thiếu thông tin, dùng:

- `TBD`
- `Needs input`
- `Pending validation`
- `Blocked by [dependency]`  
	"""

## Write files

for rel, content in files.items():  
path = base / rel  
path.parent.mkdir(parents=True, exist\_ok=True)  
path.write\_text(content, encoding="utf-8")

## Create zip

zip\_path = Path("/mnt/data/roadmap\_agent\_skill\_pack.zip")  
if zip\_path.exists():  
zip\_path.unlink()

with zipfile.ZipFile(zip\_path, "w", zipfile.ZIP\_DEFLATED) as z:  
for p in base.rglob("\*"):  
if p.is\_file():  
z.write(p, p.relative\_to(base.parent))

print(f"Created: {zip\_path}")  
print(f"Files: {sum(1 for \_ in base.rglob('\*') if \_.is\_file())}")

```
Created: /mnt/data/roadmap_agent_skill_pack.zip
Files: 14
```

<iframe title="internal://deep-research" src="https://connector_openai_deep_research.web-sandbox.oaiusercontent.com/?app=chatgpt&amp;locale=en-US&amp;deviceType=desktop" allow="camera *; clipboard-read *; clipboard-write *; fullscreen *; local-network-access *; microphone *; web-share *" allowfullscreen=""></iframe>