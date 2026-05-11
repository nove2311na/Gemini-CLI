---
type: concept
title: "Telemetry Logs"
created: 2026-05-05
updated: 2026-05-05
tags:
  - "telemetry"
  - "logs"
  - "observability"
  - "gemini-cli"
related:
  - "[[telemetry]]"
  - "[[telemetry-metrics]]"
  - "[[telemetry-traces]]"
  - "[[session]]"
  - "[[extensions]]"
  - "[[run-shell-command-tool]]"
  - "[[plan-mode]]"
  - "[[confirmation-prompts]]"
sources: ["III. 20. Observability with OpenTelemetry.md"]
---

# Telemetry Logs

Telemetry logs provide timestamped records of specific events throughout Gemini CLI operations. Logs capture granular event data across multiple categories including sessions, tools, API interactions, and system events.

## Log Event Categories

### Sessions

#### `gemini_cli.config`
Emitted at startup with CLI configuration.

**Attributes:**
- `model`, `embedding_model`, `sandbox_enabled`, `core_tools_enabled`
- `approval_mode`, `api_key_enabled`, `vertex_ai_enabled`
- `mcp_servers`, `mcp_servers_count`, `mcp_tools`, `mcp_tools_count`
- `output_format`, `extensions`, `extension_ids`, `extensions_count`
- `auth_type`, `worktree_active`
- GitHub integration: `github_workflow_name`, `github_repository_hash`, `github_event_name`, `github_pr_number`, `github_issue_number`, `github_custom_tracking_id`

#### `gemini_cli.user_prompt`
Emitted when submitting a prompt.

**Attributes:**
- `prompt_length`, `prompt_id`, `prompt` (excluded if `telemetry.logPrompts: false`), `auth_type`

### Approval Mode

#### `approval_mode_switch`
Logs approval mode changes.

**Attributes:** `from_mode`, `to_mode`

#### `approval_mode_duration`
Records time spent in each approval mode.

**Attributes:** `mode`, `duration_ms`

#### `plan_execution`
Logs plan execution transition.

**Attributes:** `approval_mode`

### Tools

#### `gemini_cli.tool_call`
Emitted for each tool (function) call — one of the most important logs for debugging.

**Attributes:**
- `function_name`, `function_args`, `duration_ms`, `success`
- `decision`: "accept", "reject", "auto_accept", or "modify"
- `error`, `error_type`, `prompt_id`, `tool_type`: "native" or "mcp"
- `mcp_server_name`, `extension_name`, `extension_id`
- `content_length`, `start_time`, `end_time`
- `metadata`: model and user line changes, ask_user data

#### `gemini_cli.tool_output_truncated`
Logs when tool output exceeds truncation thresholds.

**Attributes:** `tool_name`, `original_content_length`, `truncated_content_length`, `threshold`, `lines`, `prompt_id`

#### `gemini_cli.edit_strategy`
Records chosen edit strategy.

**Attributes:** `strategy`

#### `gen_ai.client.inference.operation.details`
Detailed GenAI operation data aligned with OpenTelemetry conventions.

**Attributes:**
- `gen_ai.request.model`, `gen_ai.provider.name`, `gen_ai.operation.name`
- `gen_ai.input.messages`, `gen_ai.output.messages`
- `gen_ai.response.finish_reasons`
- Token counts: `gen_ai.usage.input_tokens`, `gen_ai.usage.output_tokens`
- Request parameters: `gen_ai.request.temperature`, `top_p`, `top_k`, `max_tokens`
- `gen_ai.system_instructions`, `server.address`, `server.port`

### Files

#### `gemini_cli.file_operation`
Emitted for each file operation.

**Attributes:**
- `tool_name`, `operation`: "create", "read", or "update"
- `lines`, `mimetype`, `extension`, `programming_language`

### API

#### `gemini_cli.api_request`
Request sent to Gemini API.

**Attributes:** `model`, `prompt_id`, `role`: "user", "model", or "system", `request_text`

#### `gemini_cli.api_response`
Response received from Gemini API.

**Attributes:**
- `model`, `status_code`, `duration_ms`
- Token counts: `input_token_count`, `output_token_count`, `cached_content_token_count`, `thoughts_token_count`, `tool_token_count`, `total_token_count`
- `prompt_id`, `auth_type`, `finish_reasons`, `response_text`

#### `gemini_cli.api_error`
Logs failed API requests.

**Attributes:** `error.message`, `model_name`, `duration`, `prompt_id`, `auth_type`, `error_type`, `status_code`, `role`

### Model Routing

#### `gemini_cli.slash_command`
Logs slash command execution.

**Attributes:** `command`, `subcommand`, `status`

#### `gemini_cli.slash_command.model`
Logs model selection via slash command.

**Attributes:** `model_name`

#### `gemini_cli.model_routing`
Records model router decisions and reasoning.

**Attributes:**
- `decision_model`, `decision_source`, `routing_latency_ms`, `reasoning`
- `failed`, `error_message`, `approval_mode`

### Chat and Streaming

#### `gemini_cli.chat_compression`
Logs chat context compression events.

**Attributes:** `tokens_before`, `tokens_after`

#### `gemini_cli.conversation_finished`
Logs when a conversation session ends.

**Attributes:** `approval_mode`, `turn_count`

### Resilience

#### `gemini_cli.flash_fallback`
Logs switch to flash model fallback.

**Attributes:** `auth_type`

#### `gemini_cli.agent.recovery_attempt`
Logs agent error recovery attempts.

**Attributes:** `agent_name`, `attempt_number`, `success`, `error_type`

### Extensions

#### `gemini_cli.extension_install`, `gemini_cli.extension_uninstall`, `gemini_cli.extension_enable`, `gemini_cli.extension_disable`
Lifecycle events for [[extensions]].

**Attributes:** `extension_name`, `extension_version`, `extension_source`, `status`, `setting_scope`

### IDE

#### `gemini_cli.ide_connection`
Logs IDE companion connections.

**Attributes:** `connection_type`

### Security

#### `gemini_cli.conseca.verdict`
Logs security verdicts from [[ConSeca]].

**Attributes:** `verdict`, `decision`: "accept", "reject", or "modify", `reason`, `tool_name`

## Cross-References

Logs connect to many existing wiki concepts:

- [[session]] — `session.id` appears on all telemetry data
- [[run-shell-command-tool]] — Tool call logging for shell executions
- [[confirmation-prompts]] — Approval mode decision logging
- [[plan-mode]] — Plan execution tracking
- [[model-command]] — Model routing telemetry
- [[extensions]] — Extension lifecycle events