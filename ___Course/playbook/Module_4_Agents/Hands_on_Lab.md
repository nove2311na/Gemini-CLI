# Module 4: Thực Hành Điều Phối Subagents & Kích Hoạt Skills

## Mục tiêu
- Sử dụng đúng Subagent cho từng loại nhiệm vụ.
- Kích hoạt và làm theo hướng dẫn của một Agent Skill cụ thể.

## Các bước thực hiện

### Bước 1: Thử thách với @codebase_investigator (Dành cho mọi team)
**Yêu cầu:** Hãy yêu cầu "Thám tử" tìm hiểu xem trong toàn bộ folder khóa học này, có những module nào đang nói về "Security" (Bảo mật).
**Prompt:** `@codebase_investigator "Tìm tất cả các bài học có đề cập đến bảo mật hoặc .geminiignore và liệt kê đường dẫn file."`

### Bước 2: Kích hoạt Skill viết lách
**Yêu cầu:** Dùng skill chuyên gia để viết một đoạn giới thiệu ngắn về sản phẩm.
**Thao tác:**
1. Gõ: `activate_skill technical-article-writer`
2. Đợi AI phản hồi các hướng dẫn đặc thù của skill đó.
3. Cung cấp chủ đề: "Hãy viết một đoạn giới thiệu về ứng dụng Gemini CLI cho người mới bắt đầu."

### Bước 3: So sánh phản hồi
1. Hỏi `@generalist`: "Làm thế nào để bảo mật file trong Gemini CLI?"
2. Hỏi `@help`: "Làm thế nào để bảo mật file trong Gemini CLI?"
**Quan sát:** Xem sự khác biệt trong cách trả lời. `@help` sẽ thiên về kỹ thuật/lệnh, trong khi `@generalist` sẽ trả lời theo kiểu tư vấn.

### Bước 4: Tạo "Persona" tạm thời
**Yêu cầu:** Biến AI thành một chuyên gia pháp lý để kiểm tra hợp đồng.
**Prompt:** `gemini "Hãy đóng vai là @LegalExpert. Đọc file @contract_draft.docx và chỉ ra 3 điều khoản có rủi ro cao cho công ty."`

---
## Bài tập về nhà
Hãy tự tìm hiểu xem có skill nào liên quan đến `Unit Test` hoặc `Refactoring` không (dùng `@help`) và thử kích hoạt nó để kiểm tra một file code cũ của bạn.
