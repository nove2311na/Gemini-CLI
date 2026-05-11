# Module 7: Thực Hành Xây Dựng Workflow Phê Duyệt (Approval Gates)

## Mục tiêu
- Thiết kế một quy trình làm việc khép kín giữa Người và Agent.
- Thực hành phân chia vai trò (Roles) trong một dự án giả định.

## Các bước thực hiện

### Bước 1: Khởi tạo dự án "Hội đồng AI"
Bạn sẽ đóng vai là Trưởng phòng. Bạn cần 2 Agent:
1. **Agent Sáng tạo (@Creative):** Soạn thảo kịch bản.
2. **Agent Phản biện (@Critic):** Tìm lỗi và góp ý.

### Bước 2: Chạy quy trình cộng tác
Chạy lệnh:
```text
/plan "Tôi muốn soạn kịch bản cho buổi Workshop Gemini CLI. Đầu tiên, hãy để @Creative viết bản thảo. Sau đó, @Critic hãy chỉ ra 3 điểm yếu của bản thảo đó."
```

### Bước 3: Thiết lập Cổng Phê Duyệt (Approval Gate)
Khi AI đưa ra kết quả, đừng vội kết thúc. Hãy gõ:
```text
"Bản thảo đã tốt hơn. Bây giờ hãy lưu vào file workshop_draft.md. Nếu tôi gõ 'DONE' trong file đó, hãy tự động tạo ra một file Slide thuyết trình tóm tắt từ nội dung này."
```

### Bước 4: Kiểm soát Autonomy (Quyền tự quyết)
Thử nghiệm: Hãy yêu cầu AI tự động tìm và xóa các file "rác" trong folder.
**Quan sát:** Xem AI có hỏi lại bạn trước khi xóa không. Nếu bạn chưa cấp quyền "Trusted", nó sẽ không được phép xóa mà không có sự đồng ý của bạn.

### Bước 5: Audit kết quả
Cuối cùng, hãy yêu cầu AI báo cáo lại: "Bạn đã tiêu tốn bao nhiêu thời gian và token cho toàn bộ quy trình phối hợp này?"

---
## Bài tập kết thúc khóa học
Hãy tự thiết kế một "Portfolio Agent" gồm ít nhất 2 agent cho công việc thực tế của bạn tại công ty. Mô tả workflow phối hợp giữa bạn và chúng trong một file `My_AI_Team.md`.
