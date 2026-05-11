# Module 5: Customization & Security Guardrails - Lesson Content

## Learning Objectives
- **[Understand]** Describe configuration hierarchy (Settings vs. Project vs. Policy).
- **[Apply]** Create custom commands and personalize themes.
- **[Evaluate]** Configure sandboxing and policies for safe execution.

## 1. Custom Commands
Shortcut cho các prompt hay dùng. Lưu tại:
- Global: `~/.gemini/commands/*.toml`
- Project: `./.gemini/commands/*.toml` (Local override Global).

Cấu trúc file `.toml`:
```toml
description = "Summarize staged changes."
prompt = "Explain these changes: !{rtk git diff --staged}"
```
Sử dụng: `/tên_file` (ví dụ: `/commit`).
Nạp tham số: Dùng `{{args}}` trong prompt.

## 2. Settings Hierarchy
`settings.json` lưu cấu hình:
- **User**: `~/.gemini/settings.json` (Áp dụng mọi nơi).
- **Workspace**: `./.gemini/settings.json` (Ghi đè User, share team).

Lệnh: `/settings` (mở UI chỉnh sửa).

## 3. Sandboxing & Policy Engine
**Sandboxing**: Cô lập lệnh shell nguy hiểm.
- Docker: `gemini --sandbox` (Khuyên dùng).
- macOS Seatbelt: `sandbox-exec`.
- Windows Native: `icacls`.

**Policy Engine**: Kiểm soát tool qua file `.toml`.
- Lưu tại `~/.gemini/policies/`.
- Quyết định `allow` hoặc `deny` dựa trên `toolName`, `commandPrefix`.

## 4. Themes
Chỉnh màu sắc terminal.
- Chọn theme: `/theme`.
- Custom: Thêm `customThemes` vào `settings.json`.

---
Sources:
- [Custom commands](../../../Clippings/IV.%20Configuration/1.%20Custom%20commands.md)
- [Gemini CLI settings](../../../Clippings/IV.%20Configuration/6.%20Settings.md)
- [Sandboxing in Gemini CLI](../../../Clippings/III.%20Features/III.%2018.%20Sandboxing%20in%20Gemini%20CLI.md)
- [Themes](../../../Clippings/IV.%20Configuration/8.%20Themes.md)
- [Policy Engine](../../../wiki/concepts/policy-engine.md)
