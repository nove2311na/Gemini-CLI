# Module 3: Plan Mode - Lập Kế Hoạch & Điều Khiển Dự Án (Giáo Trình)

## 1. Plan Mode là gì?
Khi bạn đối mặt với một nhiệm vụ phức tạp (ví dụ: "Thiết kế toàn bộ hệ thống đăng nhập mới" hoặc "Lập kế hoạch ra mắt sản phẩm trong 3 tháng"), một câu lệnh đơn lẻ sẽ không đủ. 

**Plan Mode** là chế độ mà Gemini CLI đóng vai trò là một **Kiến trúc sư**:
- Nó không nhảy vào làm ngay.
- Nó sẽ nghiên cứu (Research), đưa ra chiến lược (Strategy), và chỉ thực hiện (Execution) khi bạn đồng ý.

## 2. Chu trình Research-Strategy-Execution

### 2.1. Research (Nghiên cứu)
AI sẽ quét qua các file liên quan để hiểu bối cảnh. 
*Ví dụ:* Nếu bạn yêu cầu sửa lỗi code, nó sẽ đọc file lỗi, đọc các file liên quan và cả tài liệu hướng dẫn.

### 2.2. Strategy (Chiến lược)
Sau khi nghiên cứu, AI sẽ đề xuất một danh sách các bước cần làm. 
**Đây là điểm mấu chốt:** Bạn có quyền duyệt từng bước, từ chối hoặc yêu cầu sửa đổi.

### 2.3. Execution (Thực thi)
Khi bạn gõ "Yes" hoặc đồng ý, AI sẽ tự động:
- Sửa file.
- Tạo file mới.
- Chạy các lệnh shell để kiểm tra kết quả.

## 3. Kỹ thuật Steering (Lái mô hình)
Trong lúc AI đang lập kế hoạch, bạn có thể dùng **User Hints** để điều chỉnh hướng đi.
- **Bổ sung thông tin:** "Sử dụng thư viện X thay vì Y nhé."
- **Giới hạn phạm vi:** "Chỉ sửa các file trong folder /marketing thôi."
- **Sửa sai:** "Bước 3 bạn hiểu nhầm ý mình rồi, hãy làm lại như sau..."

## 4. Ứng dụng cho Quản lý & Lead

### 📢 Marketing Lead
Dùng `/plan` để lập kế hoạch truyền thông tích hợp: AI sẽ tự nghiên cứu tài liệu sản phẩm, tìm kiếm xu hướng thị trường (qua MCP Search) và đề xuất bộ khung content cho từng kênh.

### 📦 Product Manager
Dùng `/plan` để xây dựng lộ trình sản phẩm (Roadmap): AI phân tích backlog hiện tại, đối chiếu với nguồn lực và đề xuất các giai đoạn phát triển hợp lý.

### 💻 Tech Lead
Dùng `/plan` cho các tác vụ Refactor (tái cấu trúc) code quy mô lớn: AI sẽ tự tìm tất cả các điểm cần sửa, thực hiện thay đổi và chạy bộ test để đảm bảo không có lỗi phát sinh.

---
*Nguồn: Clippings III.14, II.7.*
