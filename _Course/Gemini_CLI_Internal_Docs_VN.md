# Tài Liệu Hướng Dẫn & Đánh Giá Gemini CLI (Nội Bộ)

## 1. Tổng Quan về Gemini CLI
Gemini CLI là công cụ dòng lệnh mạnh mẽ cho phép tương tác trực tiếp với mô hình Gemini của Google ngay tại terminal. 

**Tại sao nên dùng?**
- **Chi phí tối ưu:** Tận dụng gói Google One sẵn có của công ty.
- **Tốc độ:** Xử lý file cục bộ cực nhanh, không cần upload thủ công lên web.
- **Tích hợp:** Khả năng chạy lệnh shell và quản lý file trực tiếp giúp tự động hóa các quy trình lặp đi lặp lại.

---

## 2. Hướng Dẫn Cài Đặt (Setup)
Yêu cầu: Đã cài Node.js (phiên bản 20 trở lên).

1. **Cài đặt:**
   ```powershell
   npm install -g @google/gemini-cli
   ```
2. **Đăng nhập:**
   ```powershell
   gemini login
   ```
3. **Tối ưu hóa Token (RTK):**
   ```powershell
   rtk init -g
   ```

---

## 3. Các Lệnh Cơ Bản Cần Nhớ
- `gemini "Câu hỏi của bạn"`: Chat nhanh.
- `gemini "Tóm tắt file này" @path/to/file.pdf`: Phân tích file (hỗ trợ PDF, Text, Audio, Hình ảnh).
- `!rtk ls`: Chạy lệnh shell (dùng prefix `!` bên trong chat hoặc chạy trực tiếp ngoài terminal).
- `/plan`: Chế độ lập kế hoạch cho các task phức tạp nhiều bước.
- `/clear`: Xóa lịch sử chat để tiết kiệm context.

---

## 4. Ứng Dụng Thực Tế Cho Các Team

### 📢 Marketing Team
- **Research & Brainstorm:** `gemini "Tìm 5 concept marketing cho sản phẩm X dựa trên file nghiên cứu thị trường này" @research_market.docx`
- **Viết Content:** `gemini "Chuyển bài blog này thành 3 post Facebook với văn phong hài hước" @blog_post.md`
- **Phân tích xu hướng:** Phối hợp với MCP Google Search để tìm kiếm thông tin mới nhất.

### 📦 Product Team
- **Viết PRD:** `gemini "Từ các ghi chú sơ sưa này, hãy soạn thảo một bản PRD hoàn chỉnh theo template của công ty" @notes.txt`
- **Phân tích User Flow:** `gemini "Liệt kê các bước trong user flow đăng ký dựa trên file mô tả logic này" @auth_logic.pdf`
- **Phân tích Feedback:** Gom nhóm hàng trăm ý kiến khách hàng từ file CSV để tìm ra "pain point" lớn nhất.

### 🎨 Design Team
- **UX Copy:** `gemini "Viết lại các thông báo lỗi này sao cho thân thiện và rõ ràng hơn" @error_list.csv`
- **Benchmark:** `gemini "Phân tích các ưu điểm về UI của đối thủ dựa trên các ảnh chụp màn hình trong thư mục này" @Screenshots/`
- **Accessibility:** Kiểm tra tính tuân thủ WCAG cho các đoạn code giao diện.

### 💻 Tech Team
- **Đọc & Giải thích Code:** `gemini "Giải thích logic xử lý thanh toán trong file này" @payment.js`
- **Viết Documentation:** Tự động tạo README.md hoặc JSDoc từ source code.
- **Sửa lỗi (Bug fix):** Dùng `/plan` để AI tự tìm lỗi, đề xuất cách sửa và chạy thử test.

---

## 5. Ghi Chú Lỗi & Cách Xử Lý
- **Lỗi Quota:** Nếu dùng bản Free, hãy đợi hoặc chuyển sang model Flash để tiết kiệm.
- **Lỗi Context:** Nếu chat quá dài, hãy dùng `/clear` hoặc `.geminiignore` để loại bỏ các file không cần thiết (như `node_modules`).
- **Lỗi Auth:** Chạy lại `gemini login` nếu session hết hạn.

---

## 6. Đánh Giá & Kết Luận

**Nên dùng khi:**
- Cần xử lý, phân tích nhiều tài liệu nội bộ (PDF, Docx, Code).
- Muốn tự động hóa các task nhỏ nhưng tốn thời gian.
- Cần một "trợ lý" luôn túc trực trong terminal để giải thích nhanh các lỗi hệ thống.

**Chưa nên dùng khi:**
- Các task đòi hỏi sự tỉ mỉ tuyệt đối về mặt thẩm mỹ giao diện (Design vẫn cần mắt người).
- Các task đòi hỏi quyền truy cập sâu vào dữ liệu bảo mật chưa được phân quyền.

**Kết luận:** Gemini CLI là công cụ **RẤT NÊN DÙNG** cho toàn bộ công ty để tăng 30-50% hiệu suất làm việc cá nhân, đặc biệt là với chi phí cực kỳ cạnh tranh.

---
*Người soạn: Gemini CLI Agent*
*Nguồn tham khảo: Clippings/ directory*
