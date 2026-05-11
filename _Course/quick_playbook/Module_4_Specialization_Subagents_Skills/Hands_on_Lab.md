# Module 4: Specialization with Subagents & Skills - Hands-on Lab

## Goal
Sử dụng subagent có sẵn và tự tạo subagent/skill mới.

## Steps

### 1. Built-in Delegation
Yêu cầu phân tích kiến trúc project:
```bash
@codebase_investigator Explain the project structure and main entry point.
```
Quan sát subagent chạy nhiều turn nghiên cứu độc lập.

### 2. Create a Custom Subagent
Tạo file `.gemini/agents/git-expert.md`:
```markdown
---
name: git-expert
description: Expert in git operations and history.
tools: [run_shell_command]
---
You are a Git expert. Help the user with complex git commands.
Always explain the command before running.
```
Chạy CLI và thử: `@git-expert Show me the commit history of the last 3 days.`

### 3. Create a Skill
Tạo folder `.gemini/skills/todo-master/`.
Tạo file `SKILL.md`:
```markdown
---
name: todo-master
description: Helps managing project todos. Use when user mentions "todo" or "task".
---
# Todo Master
Help user organize their work. Suggest using /todo command.
```
Chạy `/skills reload`.
Thử prompt: `"I need to finish the documentation. Can you help me with my todos?"`
Xác nhận skill `todo-master` được kích hoạt.

## Validation
- [ ] `@git-expert` phản hồi đúng vai trò.
- [ ] `/skills list` hiển thị `todo-master`.

---
Sources:
- [Subagents](../../../Clippings/III.%20Features/III.%2015.%20Subagents.md)
- [Get started with Agent Skills](../../../Clippings/II.%20Use%20Gemini%20CLI/2.%20Get%20started%20with%20Agent%20Skills.md)
