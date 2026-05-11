# Module 5: Customization & Security Guardrails - Hands-on Lab

## Goal
Tùy biến CLI và thiết lập cơ chế bảo mật.

## Steps

### 1. Create a Custom Command
Tạo file `.gemini/commands/explain.toml`:
```toml
description = "Explain a code file with context."
prompt = "Analyze @{{args}} and explain its logic concisely."
```
Chạy `/commands reload`.
Thử: `/explain README.md`.

### 2. Configure Sandbox
Chạy Gemini CLI với Docker sandbox:
```bash
rtk export GEMINI_SANDBOX=docker
rtk gemini
```
Thử chạy lệnh shell: `!rtk touch test_file`.
Xác nhận file được tạo (nó mount workspace nên vẫn thấy ở host).

### 3. Set a Custom Policy
Tạo file `~/.gemini/policies/restrict-git.toml`:
```toml
[[rule]]
toolName = "run_shell_command"
commandPrefix = "git push"
decision = "deny"
priority = 100
```
Thử prompt: `"Push my changes to origin master."`
Xác nhận Gemini báo lỗi bị deny bởi policy.

### 4. Personalize UI
- Đổi theme: `/theme` -> Chọn `Dracula`.
- Chỉnh settings: `/settings` -> Bật `Vim Mode`.

## Validation
- [ ] Lệnh `/explain` chạy đúng.
- [ ] Lệnh `git push` bị chặn bởi policy.
- [ ] UI hiển thị theme mới.

---
Sources:
- [Custom commands](../../../Clippings/IV.%20Configuration/1.%20Custom%20commands.md)
- [Sandboxing in Gemini CLI](../../../Clippings/III.%20Features/III.%2018.%20Sandboxing%20in%20Gemini%20CLI.md)
- [Policy Engine](../../../wiki/concepts/policy-engine.md)
