# Module 5: Tùy Biến, Cá Nhân Hóa & Bảo Mật Doanh Nghiệp (Giáo Trình)

## 1. Giới thiệu về hệ thống cấu hình
Gemini CLI cho phép bạn tùy biến gần như mọi thứ để phù hợp với văn hóa và quy trình của công ty. Có 3 tầng cấu hình chính:
1. **Global Settings:** Áp dụng cho mọi dự án trên máy tính của bạn.
2. **Project Settings:** Chỉ áp dụng cho một thư mục dự án cụ thể (file `GEMINI.md`).
3. **Security Policy:** Các quy định về quyền hạn và bảo mật (file `policy.toml`).

## 2. Custom Commands: Lệnh riêng của bạn
Thay vì gõ những prompt dài lặp đi lặp lại hàng ngày, bạn có thể tạo ra các "phím tắt".
*Ví dụ:* Bạn có thể định nghĩa lệnh `!review` để AI tự động đọc file hiện tại và kiểm tra lỗi chính tả/văn phong theo chuẩn công ty.

## 3. Themes: Cá nhân hóa giao diện
Dành cho những người yêu cái đẹp (Design team). Bạn có thể thay đổi:
- Màu sắc của text, link, code.
- Cách hiển thị các block thông tin.
- Tạo giao diện "Dark mode" hoặc "High contrast" để làm việc ban đêm không mỏi mắt.

## 4. Bảo mật dữ liệu trong Doanh nghiệp
Đây là phần quan trọng nhất để thuyết phục sếp cho phép sử dụng công cụ.

### 4.1. .geminiignore (Rào chắn dữ liệu)
Hãy coi đây là một "bức tường lửa". Bất kỳ file nào bạn không muốn AI "nhìn" thấy (API keys, file lương, thông tin khách hàng nhạy cảm), hãy cho vào đây. 

### 4.2. Sandboxing (Môi trường cách ly)
Khi AI thực hiện các lệnh shell (như tạo file, cài đặt phần mềm), nó có thể chạy trong một môi trường Sandbox. Điều này đảm bảo AI không vô tình xóa sạch ổ cứng của bạn nếu nó hiểu nhầm lệnh.

### 4.3. Trusted Folders (Thư mục tin cậy)
Bạn có thể thiết lập chỉ cho phép AI thực thi lệnh trong một số thư mục nhất định, tránh việc nó can thiệp vào các folder hệ thống của Windows/Mac.

---
*Nguồn: Clippings IV.1, IV.5, IV.6, IV.8, III.18.*
