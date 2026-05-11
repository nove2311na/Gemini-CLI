# Module 1: Introduction & Environment Setup - Hands-on Lab

## Goal
Cài đặt, cấu hình và xác minh Gemini CLI.

## Steps

### 1. Install
Chạy lệnh:
```bash
rtk npm install -g @google/gemini-cli
```

### 2. Authenticate
Chạy CLI:
```bash
rtk gemini
```
Chọn **Sign in with Google**. Follow trình duyệt.

### 3. Verify
Kiểm tra version:
```bash
rtk gemini --version
```
Kiểm tra model:
Gõ lệnh slash trong CLI:
```bash
/stats model
```

### 4. Configure Persistency (Optional)
Tạo file `.env` để lưu Project ID:
```bash
rtk mkdir -p ~/.gemini
rtk echo 'GOOGLE_CLOUD_PROJECT="your-project-id"' >> ~/.gemini/.env
```

## Validation
- [ ] `gemini --version` trả về version >= 0.21.1.
- [ ] `/stats model` hiển thị thông tin model đang dùng.

---
Sources:
- [Gemini CLI documentation](../../../Clippings/I.%20Get%20started/1.%20Gemini%20CLI%20documentation.md)
- [Gemini CLI installation, execution, and releases](../../../Clippings/I.%20Get%20started/3.%20Gemini%20CLI%20installation,%20execution,%20and%20releases.md)
- [Gemini CLI authentication setup](../../../Clippings/I.%20Get%20started/4.%20Gemini%20CLI%20authentication%20setup.md)
