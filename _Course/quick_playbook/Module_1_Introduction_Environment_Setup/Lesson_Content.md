# Module 1: Introduction & Environment Setup - Lesson Content

## Learning Objectives
- **[Remember]** State primary functions of Gemini CLI.
- **[Understand]** Describe auth process and account requirements.
- **[Apply]** Install and authenticate Gemini CLI.

## 1. What is Gemini CLI?
Gemini CLI mang AI vào terminal. Dùng để:
- Hiểu code.
- Tự động hóa task.
- Build workflow với local context.

## 2. Installation & Releases
Cài đặt global qua npm:
```bash
rtk npm install -g @google/gemini-cli
```
Channels:
- `stable`: Mặc định, ổn định nhất.
- `preview`: Tính năng mới.
- `nightly`: Build hàng ngày từ main branch.

Check version:
```bash
rtk gemini --version
```

## 3. Authentication
3 phương pháp chính:
- **Google Account**: Dễ nhất cho cá nhân. Chạy `gemini` rồi chọn "Sign in with Google".
- **Gemini API Key**: Dùng cho AI Studio. Set `GEMINI_API_KEY`.
- **Vertex AI**: Cho doanh nghiệp/GCP user. Set `GOOGLE_CLOUD_PROJECT`.

Persist env:
Lưu vào `~/.gemini/.env`:
```bash
rtk mkdir -p ~/.gemini
rtk echo 'GEMINI_API_KEY="YOUR_KEY"' >> ~/.gemini/.env
```

## 4. Model Selection
- **Auto (Gemini 3)**: Tự chọn model theo độ khó của prompt.
- **Pro**: Luôn dùng model mạnh nhất (Gemini 3 Pro).
- **Flash**: Nhanh, rẻ cho task đơn giản.

Chuyển model:
```bash
/model
```

---
Sources:
- [Gemini CLI documentation](../../../Clippings/I.%20Get%20started/1.%20Gemini%20CLI%20documentation.md)
- [Gemini CLI installation, execution, and releases](../../../Clippings/I.%20Get%20started/3.%20Gemini%20CLI%20installation,%20execution,%20and%20releases.md)
- [Gemini CLI authentication setup](../../../Clippings/I.%20Get%20started/4.%20Gemini%20CLI%20authentication%20setup.md)
- [Gemini 3 Pro and Gemini 3 Flash on Gemini CLI](../../../Clippings/I.%20Get%20started/6.%20Gemini%203%20Pro%20and%20Gemini%203%20Flash%20on%20Gemini%203%20CLI.md)
