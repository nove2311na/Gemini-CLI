# Module 2: Quản Lý Dữ Liệu & Workflow Đa Phòng Ban (Giáo Trình)

## 1. Bản chất của Context trong Gemini CLI
Trong AI, "Context" (Ngữ cảnh) là tất cả những gì AI biết về yêu cầu của bạn. Gemini CLI cho phép bạn đính kèm ngữ cảnh cực kỳ linh hoạt thông qua cú pháp `@`.

## 2. Kỹ thuật đính kèm dữ liệu (The `@` Syntax)
Thay vì copy-paste nội dung file vào cửa sổ chat, bạn chỉ cần gọi tên file.

### 2.1. Đính kèm file lẻ
`gemini "Tóm tắt nội dung file này" @report.pdf`
AI sẽ tự động đọc nội dung PDF, trích xuất text và xử lý.

### 2.2. Đính kèm toàn bộ thư mục
`gemini "Tìm các lỗi logic trong folder này" @src/`
CLI sẽ quét qua toàn bộ cấu trúc file trong folder `src` để đưa ra nhận xét tổng thể.

### 2.3. Xử lý đa định dạng
Gemini CLI hỗ trợ:
- **Văn bản:** .txt, .md, .pdf, .docx, .json, .csv.
- **Hình ảnh:** .jpg, .png (Dùng cho Design team để audit UI).
- **Âm thanh:** .mp3, .wav (Dùng để tóm tắt các cuộc họp ghi âm).

## 3. Lệnh hệ thống (The `!` Prefix)
Bạn có thể ra lệnh cho terminal ngay trong khi đang chat với Gemini.
Ví dụ: `!rtk ls` để xem danh sách file hiện có trước khi quyết định đính kèm file nào.

## 4. Ứng dụng thực tế theo Team (Case Studies)

### 📢 Marketing: Tổng hợp nghiên cứu
Marketing thường có hàng chục file báo cáo rời rạc. Gemini CLI giúp gom chúng lại:
`gemini "Từ @khao_sat_1.pdf và @khao_sat_2.docx, hãy lập bảng so sánh tâm lý khách hàng ở 2 miền."`

### 📦 Product: Kiểm tra tính nhất quán
`gemini "Bản vẽ logic trong @flow.pdf có điểm nào mâu thuẫn với tài liệu PRD @prd_final.md không?"`

### 🎨 Design: Audit Design System
Design team ném các ảnh chụp màn hình vào folder và yêu cầu:
`gemini "Kiểm tra @Screenshots/ xem có nút bấm nào sai màu quy chuẩn không."`

### 💻 Tech: Giải thích mã nguồn
`gemini "Giải thích luồng dữ liệu của hàm đăng ký trong @auth.js."`

---
*Nguồn: Clippings II.1, II.4.*
