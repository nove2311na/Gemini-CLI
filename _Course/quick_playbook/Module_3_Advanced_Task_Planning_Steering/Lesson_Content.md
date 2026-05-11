# Module 3: Advanced Task Planning & Steering - Lesson Content

## Learning Objectives
- **[Understand]** Explain Research-Strategy-Execution lifecycle.
- **[Apply]** Use Plan Mode for multi-step tasks.
- **[Analyze]** Apply steering/hints to guide the agent.

## 1. Plan Mode Architecture
Chế độ read-only để thiết kế giải pháp an toàn.
Quy trình:
1. **Research**: Gemini đọc codebase (chỉ đọc).
2. **Strategy**: Đề xuất cách làm.
3. **Execution Plan**: Tạo file `.md` mô tả từng bước implementation.

Vào Plan Mode:
- Lệnh: `/plan [goal]`
- Phím: `Shift+Tab`
- Flag: `gemini --approval-mode=plan`

## 2. Model Steering & Hints
Điều khiển Gemini ngay khi nó đang suy nghĩ/chạy tool.
- **Hints**: Gõ thêm thông tin khi spinner đang quay.
  Ví dụ: `"Check folder /utils/ for existing config."`
- **Steering**: Thay đổi thiết kế giữa chừng.
  Ví dụ: `"Use Pub/Sub pattern instead of queues."`

Lợi ích: Tránh Gemini đi sai hướng, tiết kiệm token/thời gian.

## 3. GEMINI.md
Nguồn context "team-shared".
- Tự động load khi mở session.
- Phân cấp: Global -> Root -> Subdir.
- Lưu trữ: Coding standards, tech stack, build commands.

---
Sources:
- [Plan Mode](../../../Clippings/III.%20Features/III.%2014.%20Plan%20Mode.md)
- [Use Plan Mode with model steering for complex tasks](../../../Clippings/II.%20Use%20Gemini%20CLI/7.%20Use%20Plan%20Mode%20with%20model%20steering%20for%20complex%20tasks.md)
- [Project Context (GEMINI.md)](../../../Clippings/IV.%20Configuration/5.%20Project%20context%20(GEMINI.md).md)
