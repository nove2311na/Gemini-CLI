# Module 3: Thực Hành Lập Kế Hoạch Với Plan Mode

## Mục tiêu
- Sử dụng lệnh `/plan` để giải quyết một nhiệm vụ đa bước.
- Thực hành kỹ thuật "Lái mô hình" (Model Steering) bằng User Hints.

## Các bước thực hiện

### Bước 1: Khởi động Plan Mode
Trong cửa sổ chat Gemini CLI, gõ:
```text
/plan "Tôi muốn xây dựng một bộ tài liệu Onboarding cho nhân viên mới của phòng Marketing, dựa trên văn hóa công ty hiện tại."
```

### Bước 2: Quan sát giai đoạn Research
Hãy xem AI liệt kê các file nó muốn đọc. 
*Mẹo:* Nếu AI muốn đọc những file không liên quan, hãy gõ: `User hint: Đừng đọc folder /secret, chỉ đọc folder /HR_docs thôi.`

### Bước 3: Phê duyệt Strategy
AI sẽ đưa ra danh sách các bước, ví dụ:
1. Tổng hợp giá trị cốt lõi.
2. Viết quy trình làm việc.
3. Tạo checklist 7 ngày đầu tiên.

Hãy thử can thiệp: `User hint: Thêm một bước về hướng dẫn sử dụng các công cụ AI của công ty vào sau bước 2.`

### Bước 4: Chạy Execution
Gõ `Yes` hoặc `Proceed` để AI bắt đầu tạo các file tài liệu thực tế trong folder của bạn.

### Bước 5: Kiểm tra kết quả
Dùng lệnh `!rtk ls` để kiểm tra xem AI có tạo đúng các file như đã hứa trong Strategy không.

---
## Bài tập về nhà
Thử dùng `/plan` để giải quyết một bug thực tế trong project của bạn (nếu là Tech) hoặc dùng để phân tích và lập kế hoạch roadmap cho một tính năng sản phẩm (nếu là Product).
