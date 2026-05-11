# Module 6: Automation & The Ecosystem - Hands-on Lab

## Goal
Tích hợp server MCP và tự động hóa tác vụ bằng script.

## Steps

### 1. Connect to GitHub MCP (Simulated)
Thêm vào `settings.json`:
```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "ghcr.io/github/github-mcp-server:latest"]
    }
  }
}
```
Mở CLI, check kết nối: `/mcp list`.

### 2. Run Headless Command
Dùng pipe để phân tích file:
```bash
rtk echo "print('error')" > bug.py
rtk cat bug.py | gemini -p "Find the bug in this code."
```

### 3. Build a Simple Script
Tạo file `summarizer.sh`:
```bash
#!/bin/bash
for file in *.md; do
  echo "Summarizing $file..."
  gemini -p "Summarize @$file in 1 sentence." > "${file%.md}_summary.txt"
done
```
Chạy script: `rtk chmod +x summarizer.sh && ./summarizer.sh`.

### 4. Enable Telemetry
Bật log local trong `settings.json`:
```json
{
  "telemetry": {
    "enabled": true,
    "target": "local",
    "outfile": ".gemini/telemetry.log"
  }
}
```
Chạy vài câu lệnh, sau đó kiểm tra file: `rtk cat .gemini/telemetry.log`.

## Validation
- [ ] `/mcp list` hiển thị server `github`.
- [ ] Script `summarizer.sh` tạo ra các file `_summary.txt`.
- [ ] Log telemetry ghi lại các event.

---
Sources:
- [Set up an MCP server](../../../Clippings/II.%20Use%20Gemini%20CLI/9.%20Set%20up%20an%20MCP%20server.md)
- [Automate tasks with headless mode](../../../Clippings/II.%20Use%20Gemini%20CLI/10.%20Automate%20tasks%20with%20headless%20mode.md)
- [Observability with OpenTelemetry](../../../Clippings/III.%20Features/III.%2020.%20Observability%20with%20OpenTelemetry.md)
