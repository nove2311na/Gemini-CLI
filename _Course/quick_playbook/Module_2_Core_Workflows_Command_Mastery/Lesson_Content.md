# Module 2: Core Workflows & Command Mastery - Lesson Content

## Learning Objectives
- **[Understand]** Explain safe interaction with file system and shell.
- **[Apply]** Execute commands for file manipulation and context management.
- **[Analyze]** Optimize prompting for complex file-based tasks.

## 1. File Management
Dùng `@` để nạp file/thư mục vào prompt:
- 1 file: `@path/to/file.ext Explain this code.`
- Nhiều file: `@file1.js @file2.js Find dependencies.`
- Thư mục: `@src/ Check for bugs.`

Tìm file (khi không biết path):
`"Find the file defining UserProfile component."` -> Gemini dùng `rtk find` hoặc `glob`.

Sửa/Tạo file:
- Sửa: `"Update @file.js to add logging."` -> Dùng `replace`.
- Tạo: `"Create @new_file.js with boilerplate."` -> Dùng `write_file`.

## 2. Shell Command Execution
Dùng `!` để chạy lệnh trực tiếp:
```bash
!rtk ls -la
!rtk git status
```
Shell Mode: Gõ `!` rồi Enter để vào chế độ gõ lệnh liên tục.

An toàn:
- Mọi lệnh đều cần user confirm (y/N).
- "Allow always": Tin tưởng lệnh này trong session.
- Sandboxing: Chạy trong Docker với `gemini --sandbox`.

## 3. Context & Memory
**GEMINI.md**: File cấu hình luật lệ cho project.
- Global: `~/.gemini/GEMINI.md`
- Project: `./GEMINI.md`

**Memory**: Lưu dữ liệu lâu dài.
- Lưu: `"Remember that my DB port is 5432."`
- Xem: `/memory show`
- Reload: `/memory reload`

**.geminiignore**: Chặn Gemini đọc file nhạy cảm/nặng (như `.env`, `node_modules`).

---
Sources:
- [File management with Gemini CLI](../../../Clippings/II.%20Use%20Gemini%20CLI/1.%20File%20management%20with%20Gemini%20CLI.md)
- [Execute shell commands](../../../Clippings/II.%20Use%20Gemini%20CLI/4.%20Execute%20shell%20commands.md)
- [Manage context and memory](../../../Clippings/II.%20Use%20Gemini%20CLI/3.%20Manage%20context%20and%20memory.md)
