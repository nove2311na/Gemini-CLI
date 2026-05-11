# Module 6: Automation & The Ecosystem - Lesson Content

## Learning Objectives
- **[Understand]** Explain MCP and external tool integration.
- **[Apply]** Configure MCP servers for data access.
- **[Apply]** Execute automated workflows using Headless Mode.

## 1. MCP Server Integration
**Model Context Protocol (MCP)**: Kết nối Gemini với tool/data bên ngoài (Slack, GitHub, DB).
Cấu hình trong `settings.json`:
```json
"mcpServers": {
  "github": {
    "command": "docker",
    "args": ["run", "-i", "--rm", "ghcr.io/github/github-mcp-server:latest"]
  }
}
```
Lệnh:
- `/mcp list`: Xem trạng thái kết nối.
- `/mcp reload`: Tải lại danh sách tool.

## 2. Headless Mode
Chạy Gemini 1 lần rồi thoát, dùng cho script/CI-CD.
Cú pháp: `gemini -p "Prompt"`
- **Piping**: `rtk cat logs.txt | gemini -p "Analyze errors"`
- **JSON Output**: `gemini --output-format json "Extract data" | rtk jq .response`

Tự động hóa: Viết file `.sh` gọi `gemini -p` trong vòng lặp.

## 3. Observability (OpenTelemetry)
Giám sát hành vi agent qua logs, metrics, traces.
Cấu hình:
- `target`: `gcp` hoặc `local`.
- `outfile`: `.gemini/telemetry.log`.

Lợi ích: Debug lỗi tool, theo dõi token usage, tối ưu performance.

---
Sources:
- [Set up an MCP server](../../../Clippings/II.%20Use%20Gemini%20CLI/9.%20Set%20up%20an%20MCP%20server.md)
- [Automate tasks with headless mode](../../../Clippings/II.%20Use%20Gemini%20CLI/10.%20Automate%20tasks%20with%20headless%20mode.md)
- [Observability with OpenTelemetry](../../../Clippings/III.%20Features/III.%2020.%20Observability%20with%20OpenTelemetry.md)
