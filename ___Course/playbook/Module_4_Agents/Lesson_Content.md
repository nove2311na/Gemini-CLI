# Module 4: Đội Quân Subagents & Agent Skills (Giáo Trình)

## 1. Khái niệm Subagent: Thuê đúng chuyên gia
Thay vì dùng một mô hình duy nhất cho mọi việc, Gemini CLI chia nhỏ thành các **Subagents** (Điệp viên phụ). Mỗi Subagent được huấn luyện và trang bị bộ công cụ riêng biệt để tối ưu hóa hiệu suất và tiết kiệm token.

### 1.1. @codebase_investigator (Thám tử mã nguồn)
Đây là chuyên gia về cấu trúc dự án.
- **Thế mạnh:** Đọc hàng ngàn file code, tìm kiếm sự liên kết giữa các module, phát hiện lỗ hổng bảo mật hoặc bug logic quy mô lớn.
- **Khi nào dùng:** Khi bạn cần hiểu một dự án mới hoàn toàn hoặc tìm kiếm một vấn đề nằm rải rác ở nhiều file.

### 1.2. @generalist (Chuyên gia đa năng)
Đây là trợ lý mặc định.
- **Thế mạnh:** Viết lách, tóm tắt, giải quyết các task văn phòng, brainstorm ý tưởng.
- **Khi nào dùng:** Hầu hết các công việc hàng ngày của Marketing, Product, Design.

### 1.3. @help (Hướng dẫn viên)
Chuyên gia về chính Gemini CLI.
- **Khi nào dùng:** Khi bạn quên cú pháp lệnh, muốn tìm hiểu về một tính năng mới hoặc cách cấu hình hệ thống.

## 2. Agent Skills: Nâng cấp kỹ năng cho Agent
Skills là những bộ hướng dẫn chuyên biệt (thường là file Markdown) giúp AI thực hiện một nhiệm vụ cụ thể theo tiêu chuẩn cao nhất.

**Ví dụ về các Skills có sẵn:**
- `technical-article-writer`: Viết bài blog chuẩn kỹ thuật.
- `ux-audit`: Đánh giá trải nghiệm người dùng theo chuẩn WCAG.
- `pr-shepherd`: Theo dõi và quản lý Pull Request (Dành cho Tech).

## 3. Cách kích hoạt và sử dụng
- **Gọi Subagent:** Gõ `@` cộng tên agent ở đầu câu hỏi. 
  *Ví dụ:* `@codebase_investigator "Giải thích cấu trúc folder này."`
- **Kích hoạt Skill:** Dùng lệnh `activate_skill <tên_skill>`.
  *Ví dụ:* `activate_skill technical-article-writer`

## 4. Ứng dụng thực tế

### 📢 Marketing & Content
Sử dụng `activate_skill technical-article-writer` để chuyển đổi các ghi chú kỹ thuật khô khan của Tech team thành bài viết hấp dẫn trên website.

### 🎨 Design
Sử dụng các skill về `visual-review` hoặc `accessibility-audit` để tự động hóa việc kiểm tra tính khả dụng của bản thiết kế.

### 📦 Product
Dùng `@generalist` phối hợp với các skill về `PRD-writing` để đảm bảo tài liệu luôn đúng chuẩn công ty.

---
*Nguồn: Clippings III.15, II.2.*
