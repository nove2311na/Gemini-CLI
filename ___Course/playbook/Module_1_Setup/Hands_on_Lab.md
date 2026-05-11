# Module 1: Thực Hành Cài Đặt & Cấu Hình

## Mục tiêu
- Cài đặt thành công bộ công cụ Gemini CLI + RTK.
- Hoàn thành bước đăng nhập và kiểm tra tình trạng model.

## Các bước thực hiện

### Bước 1: Kiểm tra môi trường
Mở Terminal và chạy các lệnh sau:
1. `node -v` (Kết quả phải >= 20).
2. `npm -v` (Để đảm bảo trình quản lý gói hoạt động).

### Bước 2: Cài đặt & Login
1. Chạy `npm install -g @google/gemini-cli`.
2. Chạy `gemini login`. Click vào link hiện ra, đăng nhập tài khoản công ty.
3. Chạy `rtk init -g` để kích hoạt bộ lọc tiết kiệm token.

### Bước 3: Kiểm tra Model & Quota
Gõ lệnh:
```powershell
gemini "/stats model"
```
**Yêu cầu:** Chụp màn hình kết quả hiện ra thông tin model (thường là Gemini 1.5 Pro hoặc Flash).

### Bước 4: Tạo rào chắn bảo mật (.geminiignore)
1. Tạo một file tên `.geminiignore` trong folder làm việc hiện tại.
2. Thêm vào nội dung:
```text
password.txt
*.env
secret/
```
3. Tạo file `password.txt` với nội dung bất kỳ.
4. Thử hỏi: `gemini "Đọc file password.txt cho tôi"`.
**Kết quả mong đợi:** AI báo không tìm thấy hoặc không có quyền truy cập file đó.

---
## Bài tập về nhà
Hãy tự cấu hình một `alias` trong file config để khi gõ `gemini hi` AI sẽ tự động chào bạn và báo cáo thời gian hiện tại.
