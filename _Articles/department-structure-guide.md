# Hướng dẫn Thiết lập Cấu trúc Thư mục Quy mô Phòng ban cho Gemini CLI

Tài liệu này hướng dẫn cách thiết lập một "Siêu dự án" (Master Project) dành cho cả một phòng ban, giúp tối ưu hóa khả năng cộng tác, quản lý kiến thức và tận dụng tối đa sức mạnh của Gemini CLI.

## 1. Triết lý Thiết kế
Để một phòng ban làm việc hiệu quả với AI, cấu trúc thư mục cần đảm bảo 3 yếu tố:
- **Tính Phân cấp (Hierarchy):** Context đi từ quy định chung của công ty đến chi tiết từng dự án nhỏ.
- **Tính Chuyên môn hóa (Specialization):** Sử dụng các Subagents chuyên biệt cho từng vai trò (Dev, QA, BA, PM).
- **Kho tri thức tập trung (Centralized Knowledge):** Tài liệu nghiệp vụ được tổ chức để AI có thể truy xuất nhanh.

---

## 2. Cấu trúc Thư mục Đề xuất (Departmental Master Structure)

```text
DEPARTMENT_WORKSPACE/
├── GEMINI.md               # [QUAN TRỌNG] Quy tắc chung của phòng ban (Code style, workflow)
├── .geminiignore           # Loại bỏ các file rác, file nhạy cảm khỏi context của AI
├── .gemini/                # Cấu hình AI dùng chung cho cả phòng
│   ├── settings.json       # Cấu hình model mặc định, nhiệt độ (temp), token limit
│   └── subagents/          # Các chuyên gia AI chuyên biệt
│       ├── architect.json  # Agent tư vấn kiến trúc hệ thống
│       ├── reviewer.json   # Agent chuyên review code theo tiêu chuẩn phòng
│       └── documenter.json # Agent chuyên viết tài liệu technical
├── Clippings/              # Kho tri thức (Knowledge Base)
│   ├── Standards/          # Tiêu chuẩn coding, bảo mật, UI/UX của phòng
│   ├── Guidelines/         # Hướng dẫn quy trình (Gitflow, CI/CD, Release)
│   └── Templates/          # Mẫu PR, mẫu tài liệu, mẫu task
├── Shared_Resources/       # Tài nguyên dùng chung
│   ├── Scripts/            # Các script automation chung
│   └── Assets/             # Icon, logo, design system
├── PROJECTS/               # Danh sách các dự án con
│   ├── Project_A/
│   │   ├── GEMINI.md       # Context riêng cho Project A (Stack, DB, API)
│   │   ├── src/
│   │   └── tests/
│   └── Project_B/
│       ├── GEMINI.md       # Context riêng cho Project B
│       ├── src/
│       └── tests/
└── ARCHIVE/                # Lưu trữ các dự án hoặc tài liệu cũ
```

---

## 3. Chi tiết các thành phần chính

### A. Tệp GEMINI.md (Trái tim của hệ thống)
Tại thư mục gốc của phòng ban, `GEMINI.md` nên chứa:
- **Văn hóa làm việc:** "Luôn viết unit test cho mọi hàm mới", "Sử dụng tiếng Anh cho biến, tiếng Việt cho comment".
- **Quy trình báo cáo:** Cách đặt tiêu đề Commit, cách tóm tắt công việc cuối ngày.
- **Danh sách liên lạc:** Các đầu mối quan trọng (Lead, DevOps) để AI biết cần hỏi ai khi gặp lỗi hệ thống.

### B. Thư mục Clippings (Bộ não của AI)
Đây là nơi lưu trữ các file Markdown chứa toàn bộ tài liệu của phòng. Khi bạn cần AI thực hiện một tác vụ phức tạp, nó sẽ "đọc" các hướng dẫn trong này để thực hiện chính xác theo quy chuẩn của phòng ban thay vì tự suy diễn.

### C. Subagents (Đội ngũ chuyên gia)
Thay vì dùng một AI chung chung, hãy tạo các file `.json` trong `.gemini/subagents/`.
- **Reviewer Agent:** Được nạp context về "Clean Code" của phòng để bắt lỗi logic và phong cách code.
- **Onboarding Agent:** Giúp nhân viên mới hiểu cấu trúc thư mục và quy trình phòng ban bằng cách truy vấn thư mục `Clippings`.

---

## 4. Quy trình triển khai cho Phòng ban

1. **Khởi tạo:** Manager tạo thư mục gốc và các file `GEMINI.md` tiêu chuẩn.
2. **Số hóa kiến thức:** Chuyển toàn bộ tài liệu PDF/Word hiện có sang Markdown và đưa vào thư mục `Clippings`.
3. **Phân quyền:** Sử dụng Git để quản lý. Nhân viên clone toàn bộ "Workspace" này về máy.
4. **Cập nhật liên tục:** Khi quy trình thay đổi, chỉ cần cập nhật file trong `Clippings` hoặc `GEMINI.md`, toàn bộ AI của mọi nhân viên sẽ lập tức được cập nhật kiến thức mới.

## 5. Lợi ích vượt trội
- **Nhất quán:** Mọi nhân viên (và AI của họ) đều tuân thủ một tiêu chuẩn duy nhất.
- **Tốc độ:** Nhân viên mới chỉ cần hỏi AI: "@onboarding-agent giải thích cấu trúc project A" là có câu trả lời ngay lập tức.
- **Chính xác:** AI không trả lời sai lệch vì nó luôn có "Sách hướng dẫn" (Clippings) bên cạnh.

---
*Tài liệu được soạn thảo cho Gemini CLI Mastery Project.*
