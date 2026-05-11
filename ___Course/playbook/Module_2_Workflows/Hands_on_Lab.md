# Module 2: Thực Hành Thao Tác Dữ Liệu Đa Nguồn

## Mục tiêu
- Sử dụng thành thạo cú pháp `@` để đính kèm nhiều loại file.
- Kết hợp dữ liệu từ các phòng ban khác nhau để giải quyết một bài toán chung.

## Các bước thực hiện

### Bước 1: Chuẩn bị dữ liệu mẫu
Tạo các file sau trong folder thực hành:
1. `marketing_plan.txt`: Nội dung kế hoạch marketing sơ sài.
2. `product_features.csv`: Danh sách tính năng và trạng thái (Đã xong/Đang làm).
3. `design_feedback.png` (Hoặc một file ảnh bất kỳ): Screenshot lỗi UI.

### Bước 2: Truy vấn đa file (Cross-functional Query)
Chạy lệnh:
```powershell
gemini "Dựa trên các tính năng trong @product_features.csv, hãy viết lại @marketing_plan.txt sao cho tập trung vào những thứ đã hoàn thành."
```
**Yêu cầu:** AI phải liệt kê đúng các tính năng có trạng thái "Đã xong" vào bản kế hoạch mới.

### Bước 3: Phân tích hình ảnh (Dành cho Design/Product)
Chạy lệnh:
```powershell
gemini "Phân tích file @design_feedback.png và mô tả các vấn đề về trải nghiệm người dùng bạn thấy được."
```

### Bước 4: Chạy lệnh hệ thống lồng ghép
Trong khi đang chat, hãy thử gõ:
```text
!rtk ls -R
```
Để AI liệt kê lại toàn bộ cây thư mục cho bạn xem.

---
## Bài tập về nhà
Hãy thử tóm tắt một file ghi âm cuộc họp (nếu có) hoặc một file PDF dài trên 20 trang bằng model `Flash` và so sánh tốc độ với model `Pro`.
