# Module 2: Core Workflows & Command Mastery - Hands-on Lab

## Goal
Thành thạo thao tác file, thực thi shell và quản lý context.

## Steps

### 1. File Exploration & Modification
- Tìm file: `"Find README.md in this project."`
- Đọc và tóm tắt: `@README.md Summarize this project.`
- Tạo file mới: `"Create @hello.py that prints 'Hello Gemini'."`
- Sửa file: `"Update @hello.py to print the current date."` (Confirm diff với `y`).

### 2. Shell Execution
- Chạy lệnh trực tiếp: `!rtk ls`
- Chạy lệnh qua prompt: `"Run the hello.py script and show output."`
- Check git: `!rtk git status`

### 3. Project Context
- Tạo file `GEMINI.md` tại root:
```markdown
# Instructions
- Always use Python 3.
- Be extremely brief.
```
- Reload context: `/memory reload`
- Kiểm tra: `"What are the project rules?"`

### 4. Memory
- Lưu fact: `"Remember that this is a Mastery Project."`
- Kiểm tra fact: `/memory show`

## Validation
- [ ] File `hello.py` tồn tại và chạy đúng.
- [ ] `/memory show` hiển thị các rule trong `GEMINI.md`.

---
Sources:
- [File management with Gemini CLI](../../../Clippings/II.%20Use%20Gemini%20CLI/1.%20File%20management%20with%20Gemini%20CLI.md)
- [Execute shell commands](../../../Clippings/II.%20Use%20Gemini%20CLI/4.%20Execute%20shell%20commands.md)
- [Manage context and memory](../../../Clippings/II.%20Use%20Gemini%20CLI/3.%20Manage%20context%20and%20memory.md)
