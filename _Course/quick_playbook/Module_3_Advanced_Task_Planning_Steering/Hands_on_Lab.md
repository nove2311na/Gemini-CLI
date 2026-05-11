# Module 3: Advanced Task Planning & Steering - Hands-on Lab

## Goal
Sử dụng Plan Mode để thiết kế tính năng và điều hướng model bằng steering.

## Steps

### 1. Start a Plan
Vào chế độ lập kế hoạch:
```bash
/plan Implement a basic logger class in Python.
```

### 2. Steer Research
Khi Gemini đang tìm kiếm, gõ:
`"Use the 'logging' standard library, don't create custom logic."`
Xác nhận Gemini nhận hint (nó sẽ sửa hướng nghiên cứu).

### 3. Review & Edit Plan
Gemini tạo file plan `.md`.
- Mở file plan bằng `Ctrl+X`.
- Thêm bước: `## Step 4: Add unit tests for the logger.`
- Lưu và đóng editor. Gemini sẽ nhận diện thay đổi.

### 4. Approve & Execute
Gõ `"Looks good. Implement now."`
Gemini thoát Plan Mode và bắt đầu code.

### 5. Project Rules
Cập nhật `GEMINI.md` để ép luật:
```markdown
- All logs must be in JSON format.
```
Chạy `/memory reload` và yêu cầu Gemini sửa lại code logger theo luật mới.

## Validation
- [ ] File plan `.md` được tạo trong thư mục tạm.
- [ ] Code implementation tuân thủ đúng hint và `GEMINI.md`.

---
Sources:
- [Plan Mode](../../../Clippings/III.%20Features/III.%2014.%20Plan%20Mode.md)
- [Use Plan Mode with model steering for complex tasks](../../../Clippings/II.%20Use%20Gemini%20CLI/7.%20Use%20Plan%20Mode%20with%20model%20steering%20for%20complex%20tasks.md)
