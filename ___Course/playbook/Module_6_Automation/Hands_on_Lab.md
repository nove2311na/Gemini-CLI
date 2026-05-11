# Module 6: Thực Hành Tự Động Hóa Với Headless Mode & MCP

## Mục tiêu
- Thực thi lệnh Gemini mà không cần vào cửa sổ chat.
- Hiểu cách cấu hình một MCP Server cơ bản.
- Giám sát lượng token tiêu thụ.

## Các bước thực hiện

### Bước 1: Thử nghiệm Headless Mode (-p)
Mở Terminal (Powershell) và chạy lệnh sau:
```powershell
gemini -p "Tạo một danh sách 5 ý tưởng bài viết về trí tuệ nhân tạo trong năm 2026, lưu kết quả vào file ideas.md"
```
**Kiểm tra:** Xem trong folder có file `ideas.md` mới được tạo ra không.

### Bước 2: Kết nối MCP (Tìm kiếm thông tin)
*Lưu ý: Yêu cầu máy bạn đã cài đặt sẵn một số MCP server mẫu (như Brave Search).*
Chạy lệnh:
```powershell
gemini "Giá vàng hôm nay tại Việt Nam là bao nhiêu?"
```
**Quan sát:** Xem AI có gọi đến công cụ `google_search` hoặc `brave_search` để lấy thông tin mới nhất không (Thay vì dùng kiến thức cũ).

### Bước 3: Phân tích chi phí (Token Tracking)
Chạy một lệnh phức tạp, ví dụ:
```powershell
gemini "Tóm tắt toàn bộ thư mục @___Course/ và chỉ ra các bài học còn thiếu."
```
Sau đó, chạy lệnh:
```powershell
/stats token
```
(Hoặc xem kết quả hiển thị ở cuối phản hồi nếu bạn đã bật tính năng tracking). 
**Yêu cầu:** Ghi lại số lượng token Input và Output.

### Bước 4: Tạo Script tự động hóa đơn giản
1. Tạo file `daily_report.ps1` (Windows) hoặc `daily_report.sh` (Mac/Linux).
2. Viết lệnh `gemini -p "Tóm tắt các sự kiện nổi bật hôm nay..."` vào file.
3. Chạy thử file script này.

---
## Bài tập về nhà
Hãy tìm danh sách các MCP Server có sẵn trên trang chủ `modelcontextprotocol.io` và chọn ra 1 server mà bạn thấy hữu ích nhất cho công việc của mình (ví dụ: Postgres, Slack, Drive).
