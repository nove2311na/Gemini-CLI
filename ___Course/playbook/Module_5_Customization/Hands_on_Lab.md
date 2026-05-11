# Module 5: Thực Hành Tùy Biến & Bảo Mật

## Mục tiêu
- Tạo ra một Custom Command (lệnh tắt) cá nhân.
- Thiết lập hệ thống bảo mật đa tầng cho folder dự án.
- Thay đổi theme để tối ưu trải nghiệm thị giác.

## Các bước thực hiện

### Bước 1: Tạo GEMINI.md cho dự án
1. Tạo file `GEMINI.md` trong folder `___Course`.
2. Thêm nội dung hướng dẫn AI về cách bạn muốn nó trả lời:
```markdown
# Quy tắc trả lời:
- Luôn trả lời bằng tiếng Việt.
- Sử dụng icon 🚀 ở đầu mỗi câu kết luận.
- Luôn kiểm tra lỗi chính tả trước khi phản hồi.
```
3. Chat với Gemini để xem nó có tuân thủ các quy tắc này không.

### Bước 2: Thử nghiệm Custom Commands
1. Mở file cấu hình (Settings) bằng cách hỏi Gemini: `@help "Làm thế nào để mở file settings.json?"`.
2. Thử thêm một alias đơn giản.
3. Chạy thử alias đó trong terminal.

### Bước 3: Cấu hình Bảo mật (Security)
1. Tạo một thư mục `HR_Confidential/`.
2. Thêm thư mục này vào `.geminiignore`.
3. Yêu cầu AI: `!ls -R`.
**Quan sát:** Xem AI có liệt kê folder bị ẩn này trong kết quả không.

### Bước 4: Thay đổi màu sắc (Themes)
1. Thử lệnh: `gemini --theme dark` hoặc `gemini --theme high-contrast`.
2. Tìm hiểu cách tạo một file theme JSON riêng để thay đổi màu của các đoạn code block (Dùng `@help`).

---
## Bài tập về nhà
Hãy tự tạo một bộ quy tắc bảo mật trong `policy.toml` để AI không bao giờ được phép chạy lệnh `rm -rf` (lệnh xóa sạch folder) trên máy tính của bạn.
