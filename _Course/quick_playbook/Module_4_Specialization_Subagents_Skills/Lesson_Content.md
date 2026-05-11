# Module 4: Specialization with Subagents & Skills - Lesson Content

## Learning Objectives
- **[Understand]** Contrast roles of built-in subagents.
- **[Apply]** Delegate tasks using `@subagent` syntax.
- **[Create]** Define a custom subagent and skill.

## 1. Built-in Subagents
Subagents là "chuyên gia" xử lý task biệt lập, tiết kiệm token cho session chính.
- `@codebase_investigator`: Phân tích sâu code, dependency.
- `@cli_help`: Giải đáp về chính Gemini CLI.
- `@generalist`: Xử lý task nặng, nhiều bước, sửa nhiều file.
- `@browser_agent` (experimental): Tự động hóa trình duyệt.

Sử dụng: Gõ `@tên_subagent [yêu cầu]` ở đầu prompt.

## 2. Agent Skills
Skill là bộ hướng dẫn chuyên biệt (instructions + resources).
- Cấu trúc: Thư mục chứa file `SKILL.md`.
- `SKILL.md`: Chứa YAML frontmatter (name, description) và System Prompt.
- Lệnh:
  - `/skills list`: Xem danh sách.
  - `/skills reload`: Cập nhật khi sửa file.
  - `activate_skill`: Tự động kích hoạt khi prompt khớp description.

## 3. Creating Custom Subagents
Tạo file `.md` trong `.gemini/agents/`.
Cấu trúc YAML:
```yaml
---
name: my-agent
description: Expert in X.
tools: [read_file, grep_search]
model: gemini-3-flash
---
System Prompt ở đây...
```

Phân cấp:
- Project: `.gemini/agents/` (Share team).
- User: `~/.gemini/agents/` (Cá nhân).

---
Sources:
- [Subagents](../../../Clippings/III.%20Features/III.%2015.%20Subagents.md)
- [Get started with Agent Skills](../../../Clippings/II.%20Use%20Gemini%20CLI/2.%20Get%20started%20with%20Agent%20Skills.md)
