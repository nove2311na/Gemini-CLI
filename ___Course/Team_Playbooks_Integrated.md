# Tuyển Tập Playbook Đa Phòng Ban (Marketing, Product, Design, Tech)

Tài liệu này gộp toàn bộ các hướng dẫn sử dụng Gemini CLI cho các team khác nhau trong công ty, được trích xuất và cải tiến từ các bản nháp lẻ.

---

## 📢 1. Marketing Team: Sáng Tạo & Tăng Trưởng
### Chiến lược sử dụng:
Marketing team tập trung vào khả năng đọc hiểu tài liệu dài (PDF), tóm tắt và chuyển đổi định dạng nội dung (Content Repurposing).

### Các Use Case chính:
- **Nghiên cứu thị trường:** `gemini "Hãy tìm 5 xu hướng chính trong @market_report.pdf và đề xuất cách áp dụng cho chiến dịch tháng 6."`
- **Sáng tạo nội dung:** `gemini "Từ file @blog_post.md, hãy viết 5 tiêu đề SEO, 3 post Facebook và 1 kịch bản video ngắn."`
- **Phân tích đối thủ:** `gemini "Đọc @competitor_pricing.csv và so sánh giá của họ với mình, chỉ ra điểm mình có lợi thế nhất."`

---

## 📦 2. Product Team: Requirement & User Flow
### Chiến lược sử dụng:
Product team sử dụng CLI để chuẩn hóa tài liệu, tìm lỗi logic trong yêu cầu và quản lý backlog.

### Các Use Case chính:
- **Viết PRD:** `gemini "Chuyển ghi chú từ cuộc họp @meeting_notes.txt thành bản PRD hoàn chỉnh với các mục: Mục tiêu, User Story, Acceptance Criteria."`
- **Phân tích User Flow:** `gemini "Kiểm tra file @logic_registration.pdf và liệt kê tất cả các bước mà user có thể gặp lỗi (edge cases)."`
- **Gom nhóm Feedback:** `gemini "Đọc 100 dòng feedback trong @user_reviews.csv và phân loại chúng theo các chủ đề: Tính năng, Hiệu năng, Giao diện."`

---

## 🎨 3. Design Team: UX Research & Content
### Chiến lược sử dụng:
Design team tận dụng khả năng phân tích hình ảnh (Vision) và UX Writing của Gemini.

### Các Use Case chính:
- **UX Audit:** `gemini "Phân tích các ảnh chụp màn hình trong folder @Screenshots/ và chỉ ra những điểm chưa tuân thủ Design System về khoảng cách (spacing)."`
- **UX Writing:** `gemini "Viết lại toàn bộ các câu thông báo lỗi trong file @errors.json sao cho thân thiện, giảm bớt sự lo lắng của người dùng."`
- **Benchmark:** `gemini "So sánh cấu trúc điều hướng (navigation) của mình trong @app_map.pdf với đối thủ hàng đầu X."`

---

## 💻 4. Tech Team: Code & Documentation
### Chiến lược sử dụng:
Tech team dùng CLI làm "cặp đôi lập trình" (Pair Programming) và tự động hóa các tác vụ bảo trì code.

### Các Use Case chính:
- **Giải thích Code:** `gemini "Hàm `processPayment` trong file @payment.js xử lý các trường hợp thất bại như thế nào?"`
- **Tự động viết Docs:** `gemini "Tạo tài liệu README.md chi tiết cho thư mục @src/ hiện tại, bao gồm cách cài đặt và cấu trúc các thư mục con."`
- **Bug Fix với Plan Mode:** `/plan "Tìm và sửa lỗi race condition trong module @database_connector.py, sau đó chạy lại test."`

---
*Tài liệu này là Source of Truth cho các ví dụ thực tế theo team.*
