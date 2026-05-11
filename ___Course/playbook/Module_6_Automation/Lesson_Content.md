# Module 6: Hệ Sinh Thái MCP & Tự Động Hóa (Giáo Trình)

## 1. MCP (Model Context Protocol) là gì?
AI không thể biết tất cả mọi thứ. Nó cần những "giác quan" để kết nối với thế giới bên ngoài. MCP chính là giao thức giúp Gemini CLI kết nối với:
- **Dữ liệu trên Cloud:** Google Drive, Dropbox, Github.
- **Công cụ giao tiếp:** Slack, Gmail.
- **Dữ liệu thời gian thực:** Google Search, Tỷ giá ngoại tệ, Thời tiết.
- **Cơ sở dữ liệu:** SQL, NoSQL.

## 2. Cách thức hoạt động của MCP
Bạn cài đặt một "MCP Server" (một chương trình nhỏ chạy trên máy bạn). Gemini CLI sẽ kết nối với server này và sử dụng các công cụ mà nó cung cấp.
*Ví dụ:* Khi bạn hỏi "Có file nào mới trên Drive của tôi không?", Gemini sẽ gửi yêu cầu qua MCP Google Drive Server để lấy kết quả.

## 3. Tự động hóa với Headless Mode
"Headless" có nghĩa là chạy AI mà không cần giao diện chat. Điều này cực kỳ hữu ích cho việc tự động hóa (Automation).

### 3.1. Chế độ Prompt (-p)
Bạn có thể ra lệnh cho Gemini ngay từ dòng lệnh mà không cần vào môi trường chat.
`gemini -p "Tóm tắt file @log.txt và lưu vào @summary.md"`

### 3.2. Chạy theo định kỳ (Cron jobs)
Kết hợp lệnh trên với các công cụ của Windows/Mac để AI tự động làm việc vào mỗi sáng thứ 2. 
*Ví dụ:* Tự động quét email rác, tự động tổng hợp tin tức ngành hàng ngày.

## 4. Observability: Giám sát hoạt động của AI
Khi triển khai AI trong công ty, bạn cần biết nó đang tiêu tốn bao nhiêu tiền và có đang hoạt động hiệu quả không.
- **OpenTelemetry:** Gemini CLI hỗ trợ xuất dữ liệu log sang các công cụ như Honeycomb hoặc Jaeger.
- **Token Tracking:** Giám sát xem lệnh nào ngốn nhiều token nhất để tối ưu hóa prompt.

## 5. Ứng dụng thực tế

### 📢 Marketing
Kết nối với MCP Google Search để tự động cập nhật bảng giá của 10 đối thủ cạnh tranh vào mỗi sáng và gửi báo cáo tóm tắt qua Slack.

### 💻 Tech
Kết nối với MCP Github để tự động kiểm tra xem có Pull Request nào đang chờ xử lý quá 24h không và "nhắc nhở" các dev liên quan.

---
*Nguồn: Clippings II.9, II.10, III.9, III.20.*
