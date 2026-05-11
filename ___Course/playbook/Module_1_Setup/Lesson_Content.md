# Module 1: Cài Đặt, Cấu Hình & Thiết Lập Bản Sắc (Giáo Trình)

## 1. Giới thiệu về Gemini CLI
Gemini CLI không đơn thuần là một công cụ chat. Nó là một **AI Agent chạy cục bộ**, có khả năng tương tác trực tiếp với hệ thống file, dòng lệnh và các tài liệu của bạn mà không cần phải rời khỏi terminal. Điều này tạo ra một lợi thế khổng lồ về bảo mật và tốc độ so với việc sử dụng Web UI.

## 2. Quy trình cài đặt chuẩn Doanh nghiệp
Để bắt đầu, bạn cần đảm bảo môi trường máy tính đã sẵn sàng.

### 2.1. Cài đặt Node.js
Gemini CLI được xây dựng trên Node.js. Bạn cần phiên bản **v20** trở lên.
- Kiểm tra bằng lệnh: `node -v`

### 2.2. Cài đặt công cụ
Mở Powershell (Windows) hoặc Terminal (Mac) và gõ:
```powershell
npm install -g @google/gemini-cli
```

### 2.3. Xác thực (Authentication)
Dùng lệnh: `gemini login`. Một cửa sổ trình duyệt sẽ hiện ra, hãy đăng nhập bằng tài khoản Google One của công ty để có hạn mức cao nhất.

### 2.4. Công cụ tối ưu Token: RTK (Rust Token Killer)
Đây là công cụ "bí mật" để tiết kiệm chi phí. RTK sẽ lọc bớt các dữ liệu thừa trước khi gửi cho AI.
```powershell
rtk init -g
```

## 3. Lựa chọn Model: Pro hay Flash?
- **Gemini Pro:** Dùng cho các tác vụ cần suy luận sâu, viết code phức tạp, lập kế hoạch chiến lược.
- **Gemini Flash:** Dùng cho các tác vụ tóm tắt file cực dài, dịch thuật nhanh, hoặc xử lý hàng loạt file với chi phí rẻ hơn 10 lần.

## 4. Tầm quan trọng của .geminiignore
Trong môi trường công ty, bạn luôn có những file nhạy cảm. Hãy tạo file `.geminiignore` ở thư mục gốc để bảo vệ dữ liệu. AI sẽ hoàn toàn mù tịt về những file bạn đã liệt kê trong đây.

---
*Nguồn: Clippings I.1, I.3, I.4, I.6.*
