---
title: "brian_agent - Lỗi khi chạy lệnh trên terminal"
source: "https://chatgpt.com/g/g-p-69cca90f36308191bc1174cbdcee5c8e/c/69fc16d4-cfcc-839d-bcfd-80253d00dea2"
author:
published:
created: 2026-05-08
description: "ChatGPT is your AI chatbot for everyday use. Chat with the most advanced AI to explore ideas, solve problems, and learn faster."
tags:
  - "clippings"
---
$env:CLAUDE\_CONFIG\_DIR="$env:USERPROFILE\\.claude\_minimax" bash::CLAUDE\_CONFIG\_DIR=:USERPROFILE\\.claude\_minimax: No such file or directory --> tại sao không work trên command prompt

Không work vì bạn đang chạy **PowerShell syntax** trong môi trường **bash/Git Bash**, nên bash hiểu sai biến `$env:...`.

Command này:

```markdown
$env:CLAUDE_CONFIG_DIR="$env:USERPROFILE\.claude_minimax"
```

chỉ chạy trong **PowerShell**, không chạy trong **Command Prompt** hay **Git Bash**.

Trong **PowerShell**, dùng:

```markdown
$env:CLAUDE_CONFIG_DIR="$env:USERPROFILE\.claude_minimax"
claude
```

Trong **Command Prompt / CMD**, dùng:

```markdown
set CLAUDE_CONFIG_DIR=%USERPROFILE%\.claude_minimax
claude
```

Trong **Git Bash / bash**, dùng:

```markdown
export CLAUDE_CONFIG_DIR="$USERPROFILE/.claude_minimax"
claude
```

Lỗi của bạn có chữ:

```markdown
bash: :CLAUDE_CONFIG_DIR=:USERPROFILE\.claude_minimax: No such file or directory
```

\=> nghĩa là terminal hiện tại của bạn đang là **bash**, không phải Command Prompt.

Nếu bạn muốn set vĩnh viễn trên Windows, dùng CMD:

```markdown
setx CLAUDE_CONFIG_DIR "%USERPROFILE%\.claude_minimax"
```

Sau đó **đóng terminal và mở lại** rồi chạy:

```markdown
claude
```

Pasted text(63).txt

Document

Looking at your message, I notice you've shared the HCOM team framework template but the actual USER TASK field shows \[Paste the task here\] — no specific business task was included. To proceed, I need you to paste the real task you want researched and strategized. For example: - "Entering the Vietnam B2B SaaS market — build go-to-market strategy" - "Competitive analysis for a new AI coding tool targeting indie developers" - "Market expansion plan for a fintech product into Southeast Asia" Once you paste the actual task, I'll: 1. Clarify it operationally 2. Assign roles to the 6 agents 3. Kick off parallel research 4. Synthesize and QA the final output What's the task you want completed? --> nghĩ 1 task giúp mìnhhh để đội agent của mình có task làm

Mình suggest task này nha — khá hợp với đội **6-agent HCOM research + strategy team** vì có đủ market research, competitor research, positioning, execution plan, budget, KPI và QA.

Paste vào phần **USER TASK**:

```markdown
Build a go-to-market strategy for launching a Vietnam-based AI Automation & No-Code Agency targeting small and medium businesses.

Context:
The agency helps SMEs automate repetitive business workflows using tools like n8n, Airtable, Webflow, Supabase, Wized, Make, Zapier, AI agents, and custom API integrations. The goal is to position the agency as a practical automation partner, not just a technical vendor.

The final output should include:
1. Market opportunity analysis for AI automation and no-code services in Vietnam and Southeast Asia
2. Target customer segments and their pain points
3. Competitor and alternative analysis, including automation agencies, no-code studios, software houses, freelancers, and internal tech teams
4. Positioning strategy for the agency
5. Service packaging and offer structure
6. Pricing logic and recommended service tiers
7. Messaging pillars for the website, sales deck, and LinkedIn outreach
8. Channel strategy for acquiring first clients
9. 90-day go-to-market execution plan
10. Campaign ideas for LinkedIn, Facebook groups, cold outreach, partnerships, and content marketing
11. KPI and measurement plan
12. Risks, assumptions, and validation plan

Important constraints:
- The strategy must be practical for a small agency team, not a large enterprise.
- Focus on B2B clients, especially SMEs that already use tools like spreadsheets, CRMs, forms, websites, or manual operations.
- Recommendations must be specific, evidence-aware, and actionable.
- Avoid generic AI hype. Focus on business outcomes such as saving time, reducing manual errors, improving lead handling, automating sales operations, and connecting internal systems.
- The final output should feel like a consultant-quality strategy document that the agency can actually use to launch the service.
```

Task này hay vì nó ép team agent phải xử lý đủ 5 mảng: **market demand → competitor gap → positioning → offer design → execution plan**. Nó cũng rất gần với thứ bạn đang quan tâm: no-code, Webflow, n8n, AI agent, workflow automation, agency service.

research\_output\_FINAL.txt

Document

output đây, bạn đánh giá sao với nếu dùng hcom chạy cùng lúc nhiều agent thì với các đầu việc như trong research\_output giới hạn trong agent chạy trên claude code (sonnet, opus, minimax 2.7), gemini (tất cả model gemini cli cung cấp), codex (tất cả model open ai cung cấp), thì đấy tech stack và các môi trường agent cũng như model mình các thể dùng gồm thế thì theo bạn mình nên chia các role agent (nhân sự) nào để làm task này và nhân sự đó nên được chạy trên nền agent nào với mô hình nào

Mình sẽ đánh giá nhanh chất lượng output trước, rồi map lại “nhân sự agent” theo đúng thế mạnh từng môi trường: Claude/Minimax cho strategy-writing, Gemini cho long-context research, Codex/OpenAI cho QA, reasoning và structured synthesis.

Mình đã check output: nó ổn về cấu trúc và rất dùng được để luyện HCOM, nhưng nếu dùng như “research thật” thì còn vài lỗi nặng: tự chấm hơi ảo, case study giả dễ gây hiểu nhầm, và một số phép tính pricing/margin bị sai logic.

Đánh giá của mình: output này **rất tốt để làm bản strategy skeleton**, nhưng **chưa xứng 10/10 nếu chấm như consultant research thật**.

Mình sẽ chấm khoảng:

| Tiêu chí | Điểm |
| --- | --- |
| Structure / format | 9/10 |
| Strategy logic | 8.5/10 |
| Execution usefulness | 8.5/10 |
| Evidence quality | 6.5/10 |
| QA discipline | 6.5/10 |
| Overall | **7.8–8.2/10** |

Lý do: document có ICP, positioning, packages, messaging, channel plan, 90-day plan, objection scripts, workflows khá rõ. Nhưng nó có mấy lỗi đáng chú ý: tự nâng điểm từ 9.3 lên 10/10 hơi “ảo”; case studies và client quotes là hypothetical nhưng format nhìn rất giống case thật; pricing/margin breakdown có chỗ sai logic; nhiều nguồn chỉ được liệt kê chung chứ chưa có link/citation cụ thể; một số claim như TAM, response lag, spreadsheet dependency vẫn là inference/assumption nhưng lại được dùng khá mạnh trong strategy.

Với stack của bạn, mình sẽ chia **6 nhân sự HCOM core** như này:

| Role agent | Nhiệm vụ chính | Nên chạy trên nền nào | Model nên dùng | Vì sao |
| --- | --- | --- | --- | --- |
| **1\. Lead / Orchestrator** | Giữ WORKBOARD, chia task, chống duplicate, quyết định gate qua phase | **Claude Code** | **Claude Sonnet 4.6** | Claude Code phù hợp cho workflow dài, đọc/sửa file, quản lý workboard/project context; Anthropic mô tả Claude Code là agentic coding system có thể đọc codebase, chạy test và làm việc qua file/project. [Anthropic+1](https://www.anthropic.com/product/claude-code?utm_source=chatgpt.com) |
| **2\. Market Evidence Researcher** | Tìm market size, adoption, policy, SME context, source table | **Gemini CLI** | **Gemini 3.1 Pro / model Pro mạnh nhất CLI có** | Gemini mạnh ở long-context, đọc nhiều nguồn/tài liệu; Google docs nhấn mạnh Gemini hỗ trợ long context hàng triệu token và structured outputs. [Google AI for Developers+1](https://ai.google.dev/gemini-api/docs?utm_source=chatgpt.com) |
| **3\. Competitor & Alternative Researcher** | Scan competitor, pricing, positioning, direct/indirect alternatives | **Gemini CLI parallel subagents** | **Gemini 3 Flash cho scan rộng, Gemini Pro cho synthesis** | Gemini CLI hiện hỗ trợ parallel subagents, rất hợp để chia nhiều competitor/industry cùng lúc. [Google Developers Blog+1](https://developers.googleblog.com/subagents-have-arrived-in-gemini-cli/?utm_source=chatgpt.com) |
| **4\. Strategy Synthesizer** | Biến research thành positioning, ICP, value prop, messaging pillars | **Claude Code** | **Claude Opus 4.7**, nếu tiết kiệm thì Sonnet 4.6 | Opus nên dùng ít nhưng đúng chỗ: conflict resolution, strategic synthesis, final POV. Anthropic giới thiệu Opus 4.7 là model mạnh về autonomy và creative reasoning. [Anthropic](https://www.anthropic.com/news/claude-opus-4-7?utm_source=chatgpt.com) |
| **5\. Execution Planner / GTM Operator** | 90-day plan, campaigns, outreach scripts, playbook, checklist | **Claude Code hoặc MiniMax** | **MiniMax M2.7-highspeed** hoặc Sonnet 4.6 | MiniMax M2.7 khá hợp cho productivity/agent task, office-style editing, tạo nhiều asset/template nhanh; MiniMax cũng có Anthropic-compatible API cho M2.7. [MiniMax+1](https://www.minimax.io/models/text/m27?utm_source=chatgpt.com) |
| **6\. QA / Critic / Quant Checker** | Check hallucination, evidence, math, pricing, contradictions, fake certainty | **Codex CLI** | **GPT-5.5 high/xhigh reasoning** | Codex CLI cho chọn model qua `--model` hoặc `/model`, còn OpenAI docs hiện recommend GPT-5.5 cho complex reasoning/coding; role này cần độc lập với Claude để giảm “same-model bias”. [OpenAI Developers+1](https://developers.openai.com/codex/models?utm_source=chatgpt.com) |

Cách chia tốt nhất không phải “mỗi agent một model mạnh nhất”, mà là:

**Gemini = research rộng + long context + parallel scan**  
**Claude = orchestrate + strategy + writing/synthesis**  
**Codex/OpenAI = critic, math, consistency, adversarial QA**  
**MiniMax = production assistant: templates, playbook, Vietnamese scripts, repeatable execution assets**

Với task GTM như file này, mình sẽ chạy workflow như sau:

| Phase | Agent chính | Model |
| --- | --- | --- |
| Phase 1 — Task clarification | Lead | Claude Sonnet 4.6 |
| Phase 2 — Research decomposition | Lead + Research agents | Claude Sonnet + Gemini Pro |
| Phase 3 — Market research | Market Researcher | Gemini Pro |
| Phase 3 — Competitor scan | Competitor Researcher | Gemini Flash parallel → Gemini Pro synthesis |
| Phase 4 — Strategy synthesis | Strategy Agent | Claude Opus 4.7 |
| Phase 4 — Execution plan | Execution Planner | MiniMax M2.7-highspeed / Claude Sonnet |
| Phase 5 — QA | QA Critic | Codex GPT-5.5 high/xhigh |
| Phase 6 — Final edit | Lead | Claude Sonnet 4.6 |

Mình sẽ **không để Claude tự QA output do chính Claude viết**. Đây là lỗi lớn trong output hiện tại. QA phải chạy bằng một “nhân sự khác hệ”, tốt nhất là **Codex GPT-5.5**, với prompt kiểu:

```markdown
You are an adversarial QA critic. Do not improve the document yet.
Find:
1. unsupported claims
2. fake or hypothetical claims presented as real
3. math/pricing errors
4. contradiction between sections
5. overconfident recommendations
6. missing source links
7. claims that should be downgraded to assumptions
Return a severity table and do not approve unless evidence quality is strong.
```

Với output hiện tại, QA Agent đáng ra phải bắt các lỗi này:

| Issue | Mức độ | Vì sao nguy hiểm |
| --- | --- | --- |
| Hypothetical case studies có quote giả | High | Nếu dùng trong pitch thật dễ thành misleading |
| TAM $500M–1B confidence LOW nhưng vẫn dùng như opportunity lớn | High | Strategy có thể bị build trên số chưa chắc |
| Pricing hours × rate breakdown sai logic margin | High | Có thể làm pricing proposal thiếu tin cậy |
| Competitor pricing LOW/MEDIUM nhưng bảng nhìn như benchmark thật | Medium | Dễ dẫn tới positioning/pricing sai |
| Self-score 99/100 dù còn known data limitations | Medium | QA agent không đủ adversarial |
| Source appendix không có direct URL/date chi tiết | Medium | “Evidence-based” nhưng chưa audit được |

Setup nhân sự tối ưu hơn:

| Nhân sự | Agent name gợi ý | Nền chạy | Model | Output bắt buộc |
| --- | --- | --- | --- | --- |
| Lead | `lili_orchestrator` | Claude Code | Sonnet 4.6 | `WORKBOARD.md`, assignments, phase gates |
| Market | `novo_market` | Gemini CLI | Gemini Pro | `market_evidence_table.md` |
| Competitor | `boba_competitor` | Gemini CLI subagents | Gemini Flash + Pro | `competitor_matrix.md` |
| Strategy | `mizu_strategy` | Claude Code | Opus 4.7 | `strategy_synthesis.md` |
| Execution | `kobe_execution` | MiniMax / Claude Code | M2.7-highspeed | `execution_playbook.md` |
| QA | `bali_critic` | Codex CLI | GPT-5.5 high/xhigh | `qa_report.md` |

Mình sẽ đặt rule như này cho hệ HCOM của bạn:

```markdown
Rule 1: Research agents cannot write strategy.
Rule 2: Strategy agent cannot invent evidence.
Rule 3: Execution agent cannot create fake case studies unless explicitly labeled as hypothetical.
Rule 4: QA agent must be from a different model family than the main writer.
Rule 5: Final score cannot exceed the lowest score of Evidence Quality and Practicality by more than 1.5 points.
Rule 6: Any claim used in pricing, ICP, TAM, or competitor comparison must have source/date/confidence.
Rule 7: Hypothetical examples must be visually separated from validated evidence.
```

Kết luận của mình:  
**Best default team cho bạn là Claude Sonnet Lead + Gemini Research + Claude Opus Strategy + MiniMax Execution + Codex GPT-5.5 QA.**

Nếu muốn tiết kiệm cost thì dùng:

```markdown
Lead: Claude Sonnet
Research: Gemini Flash / Pro only when needed
Strategy: Claude Sonnet
Execution: MiniMax M2.7-highspeed
QA: GPT-5.5 high only for final gate
```

Còn nếu muốn chất lượng cao nhất:

```markdown
Lead: Claude Sonnet
Market Research: Gemini Pro
Competitor Research: Gemini parallel subagents
Strategy: Claude Opus
Execution: Claude Sonnet + MiniMax
QA: Codex GPT-5.5 xhigh
Final polish: Claude Sonnet
```

mình có nên tích hợp thêm công nghệ ngoài không, đây là nhận xét của mình khi sếp nhờ review cách chạy hcom và output từ hcom: "output này em thấy đang thiếu thành phần member team, đầu việc với workflow làm việc cụ thể theo thời gian của các agent trong dự án, chắc đợt tới em bổ sung cái này này mà được bổ sung các subagent + skill theo thiết lập của claude, gemini, opencode, codex để các đầu việc được rõ ràng ra cách làm, output,... với rõ các skill được dùng để làm như nào + connect mcp chuyên với task (ví dụ mcp perplexity để research,...) + chạy dùng model oke thì còn ngon hơn được nhiều nữa (vừa rồi em dùng minimax, nó mạnh code chứ hình như phần khác ko mạnh quá)"

Mình nghĩ là **nên tích hợp thêm**, nhưng không nên tích hợp kiểu “thêm tool cho ngầu”. Nên chia thành 3 lớp: agent roles, skill/process chuẩn hoá, và MCP/tool chuyên dụng cho từng loại task.

Có, **nên tích hợp thêm công nghệ ngoài**, và nhận xét của bạn là đúng hướng. Nhưng mình sẽ sửa tư duy một chút:

Không nên nói là “thêm nhiều agent/tool/model hơn” → mà nên nói là **chuẩn hoá HCOM thành một operating system cho team agent**.

Output vừa rồi có strategy khá đầy đủ, nhưng đúng như bạn nhận xét: nó thiếu phần **member team, task ownership, workflow theo thời gian, agent nào làm gì, dùng skill nào, dùng tool/MCP nào, output trung gian là gì**. File hiện tại có final strategy, QA score, bibliography, case studies, pricing, scripts…, nhưng phần “cách đội agent vận hành để tạo ra output” vẫn khá mờ.

Mình sẽ đề xuất với sếp như này:

> Em nghĩ HCOM hiện tại đã tạo được output strategy khá tốt, nhưng vẫn đang thiên về “final document” hơn là “team execution system”. Điểm cần bổ sung là lớp vận hành phía sau: member team, role cụ thể, workflow theo timeline, task ownership, output trung gian của từng agent, skill nào được dùng ở bước nào, MCP nào phục vụ loại task nào, và cơ chế QA độc lập.
> 
> Nếu bổ sung thêm subagent + skill theo từng môi trường như Claude Code, Gemini CLI, opencode/Codex, kèm MCP chuyên dụng cho research như Perplexity MCP, thì HCOM sẽ rõ hơn rất nhiều: mỗi agent không chỉ “được giao vai trò”, mà còn có checklist, tool access, output contract và quality gate riêng. Như vậy output sẽ dễ audit hơn, giảm hallucination, giảm việc agent tự chấm điểm quá cao, và giúp workflow có thể lặp lại cho nhiều dự án khác.
> 
> Về model, em nghĩ không nên dùng một model cho toàn bộ pipeline. Minimax có thể dùng tốt cho coding, template, hoặc các task sản xuất nhanh, nhưng với strategy/research/QA thì nên phân vai theo thế mạnh: Gemini cho research rộng và long-context, Claude cho orchestration và synthesis, Codex/OpenAI cho QA logic, math check, consistency check, còn Minimax dùng cho execution assets hoặc code-related tasks.

Cấu trúc tích hợp nên là:

| Layer | Có nên thêm? | Mục đích |
| --- | --- | --- |
| **Subagents** | Rất nên | Biến HCOM từ “1 prompt dài” thành team có vai trò rõ |
| **Skills** | Rất nên | Chuẩn hoá cách mỗi agent làm việc: research, competitor scan, QA, synthesis |
| **MCP chuyên dụng** | Nên, nhưng chọn lọc | Cho agent truy cập công cụ ngoài như search, docs, database, browser |
| **Multi-model routing** | Rất nên | Dùng đúng model cho đúng việc, tránh một model vừa research vừa tự QA |
| **Workflow file / Workboard** | Bắt buộc | Theo dõi task, owner, status, output, blocker |
| **Evaluation rubric riêng** | Bắt buộc | Chống tự chấm ảo như output vừa rồi |

Về mặt kỹ thuật, hướng bạn nói là hợp lý vì Claude Code hiện có cơ chế **subagents**, có thể scope MCP server riêng cho từng subagent, tức là research agent có thể có tool research, QA agent có tool khác, còn main lead không cần ôm hết tool vào context. [Claude API Docs](https://docs.anthropic.com/en/docs/claude-code/sub-agents?utm_source=chatgpt.com) Claude Code cũng có **Skills** dưới dạng `SKILL.md`, dùng để đóng gói checklist/procedure và chỉ load khi cần, giúp giảm việc nhồi một prompt quá dài vào mọi task. [Claude API Docs](https://docs.anthropic.com/en/docs/claude-code/skills?utm_source=chatgpt.com) MCP thì đúng là lớp nên thêm khi bạn cứ phải copy dữ liệu từ tool ngoài vào chat; Anthropic mô tả MCP servers là cách để Claude Code kết nối với tools, databases, APIs, issue trackers, monitoring dashboards, Figma/Slack-like sources… thay vì làm thủ công. [Claude API Docs](https://docs.anthropic.com/en/docs/claude-code/mcp?utm_source=chatgpt.com)

Với Gemini, nên dùng cho lớp research/scan vì Gemini CLI hiện có subagents để xử lý task phức tạp trong context window riêng, và Gemini extensions có thể package prompts, MCP servers, custom commands, hooks, sub-agents và skills. [Google Developers Blog+1](https://developers.googleblog.com/subagents-have-arrived-in-gemini-cli/?utm_source=chatgpt.com) Codex thì mình sẽ để làm QA/code/math/checker, vì Codex CLI cho chọn model bằng `--model` hoặc đổi trong phiên bằng `/model`, khá hợp để dùng một model khác họ làm critic độc lập. [OpenAI Developers](https://developers.openai.com/codex/models?utm_source=chatgpt.com) Perplexity MCP cũng hợp cho research vì official docs nói MCP Server cho phép AI assistants truy cập search/reasoning của Perplexity trực tiếp trong workflow. [Perplexity](https://docs.perplexity.ai/docs/getting-started/integrations/mcp-server?utm_source=chatgpt.com)

Mình sẽ thiết kế HCOM v2 như này:

| Role | Environment | Model | Skill cần có | MCP/tool nên cấp |
| --- | --- | --- | --- | --- |
| **Lead / Orchestrator** | Claude Code | Claude Sonnet | `hcom-orchestrator-skill` | File system, Workboard, maybe Notion/GitHub |
| **Market Research Agent** | Gemini CLI | Gemini Pro | `market-research-skill` | Perplexity MCP, web search, source collector |
| **Competitor Research Agent** | Gemini CLI subagents | Gemini Flash/Pro | `competitor-scan-skill` | Perplexity MCP, browser/search |
| **Strategy Synthesizer** | Claude Code | Claude Opus/Sonnet | `strategy-synthesis-skill` | Chỉ đọc research packets, không cần web nếu đã có source |
| **Execution Planner** | Claude Code / Minimax | Sonnet hoặc Minimax | `gtm-execution-skill` | Templates, file system, maybe CRM/content docs |
| **QA / Critic Agent** | Codex CLI | GPT-5.5 high/xhigh | `adversarial-qa-skill` | Calculator/checker, source table, final doc |

Quan trọng nhất: **không cho mọi agent dùng mọi MCP**. Cấp tool theo role. Nếu không, context sẽ phình to, chi phí tăng, agent dễ loạn tool. Claude docs cũng khuyến nghị dùng Sonnet cho teammate để cân bằng cost/capability, giữ team nhỏ vì mỗi teammate có context riêng, và spawn prompt càng dài thì càng tốn context. [Claude API Docs](https://docs.anthropic.com/en/docs/claude-code/costs?utm_source=chatgpt.com)

Mình sẽ ưu tiên tích hợp theo thứ tự này:

**Phase 1 — HCOM Operating Structure**

Tạo folder chuẩn:

```markdown
hcom/
  agents/
    lead_orchestrator.md
    market_researcher.md
    competitor_researcher.md
    strategy_synthesizer.md
    execution_planner.md
    qa_critic.md

  skills/
    hcom-orchestration/SKILL.md
    evidence-research/SKILL.md
    competitor-scan/SKILL.md
    strategy-synthesis/SKILL.md
    execution-planning/SKILL.md
    adversarial-qa/SKILL.md

  workboard/
    WORKBOARD.md
    ASSIGNMENTS.md
    EVIDENCE_TABLE.md
    QA_REPORT.md

  outputs/
    research_packets/
    synthesis_packets/
    final/
```

**Phase 2 — Add skills**

Mỗi skill phải trả lời được:

```markdown
- Khi nào skill được gọi?
- Input cần gì?
- Agent phải làm theo steps nào?
- Output format là gì?
- Rubric tự check là gì?
- Khi nào phải escalate cho Lead?
```

Ví dụ skill `evidence-research` không được trả về “market is growing”. Nó phải trả về:

```markdown
Claim:
Source:
Date:
Evidence quality:
Confidence:
Strategic implication:
Can this be used in final output? Yes/No:
```

**Phase 3 — Add MCP**

MCP nên thêm trước:

| MCP/tool | Dùng cho | Priority |
| --- | --- | --- |
| **Perplexity MCP** | Market research, source discovery, current data | High |
| **Browser / web extraction MCP** | Kiểm tra trang competitor, pricing, service pages | High |
| **Notion / Google Drive MCP** | Lưu workboard, source table, output packets | Medium |
| **GitHub / file system** | Quản lý skill repo, versioning HCOM | Medium |
| **Calculator / Python checker** | Check pricing, TAM, ROI, budget math | High |
| **Figma/Webflow MCP** | Chỉ cần nếu task liên quan design/build | Later |

**Phase 4 — Add model routing**

Rule nên là:

```markdown
Research wide → Gemini
Research with citation / web reasoning → Gemini + Perplexity MCP
Strategy POV → Claude Opus/Sonnet
Execution asset → Claude Sonnet / Minimax
Code/task automation → Minimax / Codex
QA adversarial → Codex GPT-5.5
Final polish → Claude Sonnet
```

Một điểm mình sẽ sửa trong nhận xét của bạn: câu “Minimax mạnh code chứ hình như phần khác không mạnh quá” nên nói mềm hơn:

> Qua output lần này, em thấy Minimax có thể chưa phải lựa chọn tối ưu cho vai trò lead strategy/research synthesis. Nó vẫn có thể hữu ích cho coding, automation, tạo template, hoặc các execution assets, nhưng với các phần cần evidence quality, strategic reasoning và QA độc lập thì nên route sang Claude/Gemini/Codex phù hợp hơn.

Kết luận: **nên tích hợp thêm, nhưng theo hướng có kiến trúc, không phải thêm tool tràn lan**.

Câu chốt gửi sếp có thể là:

> Đợt tới em nghĩ mình nên nâng HCOM từ một prompt framework thành một multi-agent operating system nhỏ: có agents, skills, MCP, workboard, output contract và QA gate rõ ràng. Như vậy mỗi lần chạy không chỉ ra final output, mà còn có thể audit được ai làm gì, dùng nguồn nào, dùng tool nào, điểm yếu nằm ở bước nào, và model nào phù hợp nhất cho từng loại task.

vậy hãy cho mình mô hình tổng thể các nhân sự, đầu việc của các nhân sự, các agent cần thiết cho chúng, các skill cho các agent/subagent đó, knowledge nền, các công cụ gồm mcp và các công cụ khác và model dùng cho chúng,... cho mình nhé\\

Mình sẽ đóng gói thành một **HCOM v2 blueprint**: team structure, agent/subagent, skill, knowledge base, MCP/tooling, model routing, workflow theo phase và output contract để bạn có thể đưa cho sếp hoặc biến thành repo cấu hình.

Nên thiết kế theo hướng **HCOM v2 = một “agent operating system”**, không chỉ là prompt gọi nhiều agent. Vì output hiện tại đã có final strategy tốt, nhưng đúng như bạn nhận xét: nó vẫn thiên về “final document”, thiếu lớp vận hành như **member team, đầu việc, workflow theo thời gian, tool/skill nào được dùng ở bước nào, và agent nào chịu trách nhiệm output nào**.

Dưới đây là mô hình tổng thể mình đề xuất.

---

## HCOM v2 — Multi-Agent Strategy Operating System

## 1\. Kiến trúc tổng thể

```markdown
USER TASK
  ↓
Lead / Orchestrator
  ↓
WORKBOARD + TASK DECOMPOSITION
  ↓
Parallel Specialist Agents
  ├── Market Research Agent
  ├── Competitor Research Agent
  ├── Customer / ICP Agent
  ├── Strategy Synthesis Agent
  ├── Execution Planning Agent
  ├── Financial / Pricing Agent
  └── QA / Critic Agent
  ↓
Evidence Table + Research Packets + Synthesis Packets
  ↓
QA Gate
  ↓
Final Consultant-Quality Output
```

HCOM v2 nên có **3 lớp chính**:

| Layer | Vai trò |
| --- | --- |
| **People / Agent layer** | Ai làm gì, role nào chịu trách nhiệm phần nào |
| **Skill layer** | Mỗi agent làm theo quy trình chuẩn nào, output contract ra sao |
| **Tool / MCP layer** | Agent dùng công cụ nào: research, web, file, calculator, Notion, GitHub, Perplexity, browser |

Claude Code phù hợp làm lớp orchestration vì Claude Code hỗ trợ custom subagents, preloaded skills cho subagent, MCP và skills/plugin system. Anthropic docs cũng nói subagent có thể được cấu hình bằng `skills` để preload domain knowledge vào context ngay từ đầu. [Claude+2Claude+2](https://code.claude.com/docs/en/sub-agents?utm_source=chatgpt.com)

---

## 2\. Mô hình nhân sự chính

Mình sẽ không chỉ dùng 6 agent. Nên dùng **7 core agents + 3 on-demand agents**.

## 2.1. Core team

| # | Nhân sự / Agent | Vai trò | Environment | Model đề xuất | Output chính |
| --- | --- | --- | --- | --- | --- |
| 1 | **Lead / Orchestrator** | Chia việc, giữ WORKBOARD, kiểm soát phase, tổng hợp final | Claude Code | Claude Sonnet | `WORKBOARD.md`, `ASSIGNMENTS.md`, final synthesis |
| 2 | **Market Research Agent** | Market size, trend, demand driver, policy, industry context | Gemini CLI | Gemini Pro | `market_research_packet.md` |
| 3 | **Competitor Research Agent** | Competitor, alternatives, pricing, positioning map | Gemini CLI subagents | Gemini Flash → Gemini Pro | `competitor_matrix.md` |
| 4 | **Customer / ICP Agent** | Segment, pain point, buyer behavior, trigger events | Claude Code hoặc Gemini | Claude Sonnet / Gemini Pro | `icp_packet.md` |
| 5 | **Strategy Synthesizer** | Positioning, value prop, messaging, strategic choices | Claude Code | Claude Opus hoặc Sonnet | `strategy_synthesis.md` |
| 6 | **Execution Planner** | 90-day plan, channel plan, campaign, outreach, KPI | Claude Code / MiniMax | Claude Sonnet / MiniMax M2.7-highspeed | `execution_playbook.md` |
| 7 | **QA / Critic Agent** | Check logic, evidence, math, hallucination, fake certainty | Codex CLI | GPT-5.5 high/xhigh | `qa_report.md` |

Codex nên được dùng cho QA vì OpenAI docs khuyến nghị GPT-5.5 cho complex coding, computer use, knowledge work và research workflows, đồng thời Codex CLI cho phép chọn model bằng `--model` hoặc đổi model trong phiên làm việc. [OpenAI Developers+1](https://developers.openai.com/codex/models?utm_source=chatgpt.com)

## 2.2. On-demand agents

| Agent phụ | Khi nào gọi | Model / Environment |
| --- | --- | --- |
| **Source Librarian** | Khi research nhiều nguồn, cần gom citation/source table | Gemini CLI + Perplexity MCP |
| **Financial / Pricing Analyst** | Khi có pricing, ROI, TAM, CAC, LTV, budget allocation | Codex GPT-5.5 hoặc Claude Sonnet + calculator |
| **Final Editor / Deck Writer** | Khi cần polish final output, proposal, sales deck, website copy | Claude Sonnet hoặc MiniMax M2.7 |

Gemini CLI rất hợp cho research/subagent vì Google mô tả Gemini CLI subagents là các specialized agents chạy trong isolated context windows, phù hợp với task phức tạp hoặc high-volume như documentation lookup, deep analysis, domain reasoning. [Google Developers Blog+1](https://developers.googleblog.com/subagents-have-arrived-in-gemini-cli/?utm_source=chatgpt.com)

---

## 3\. Chi tiết từng nhân sự

## 3.1. Lead / Orchestrator Agent

| Hạng mục | Thiết lập |
| --- | --- |
| **Environment** | Claude Code |
| **Model** | Claude Sonnet |
| **Vai trò** | PM + Strategy Director + Workflow Controller |
| **Không được làm** | Không tự research sâu, không tự QA output của mình |
| **Skill cần có** | `hcom-orchestration`, `workboard-management`, `task-decomposition`, `quality-gate-management` |
| **Knowledge nền** | HCOM rules, output standard, QA rubric, user task, team capability map |
| **Tools / MCP** | File system, Git, Notion/Google Drive nếu cần lưu workboard, calendar optional |
| **Output** | `WORKBOARD.md`, `ASSIGNMENTS.md`, `PHASE_LOG.md`, final decision |

Nhiệm vụ cụ thể:

```markdown
1. Restate user task operationally.
2. Define final deliverable.
3. Create WORKBOARD.
4. Assign work to agents.
5. Check progress by phase.
6. Detect duplicate / weak work.
7. Reassign if agent blocked.
8. Collect packets.
9. Send to QA.
10. Revise final output until QA passes.
```

---

## 3.2. Market Research Agent

| Hạng mục | Thiết lập |
| --- | --- |
| **Environment** | Gemini CLI |
| **Model** | Gemini Pro |
| **Vai trò** | Evidence researcher |
| **Skill cần có** | `evidence-research`, `market-sizing`, `source-quality-check` |
| **Knowledge nền** | Market research method, TAM/SAM/SOM, Vietnam/SEA business context |
| **Tools / MCP** | Perplexity MCP, web search, browser extraction, source table |
| **Output** | `market_research_packet.md`, `evidence_table.csv` |

Perplexity MCP hợp cho agent này vì official docs mô tả Perplexity MCP Server cho phép AI assistants truy cập real-time web search, conversational AI và reasoning trực tiếp trong workflow thông qua MCP. [Perplexity+1](https://docs.perplexity.ai/docs/getting-started/integrations/mcp-server?utm_source=chatgpt.com)

Output bắt buộc:

```markdown
RESEARCH PACKET
- Scope covered:
- Key findings:
  | Claim | Source | Date | Confidence | Strategic implication |
- Data limitations:
- What should be used in final:
- What should NOT be used in final:
- Validation needed:
```

---

## 3.3. Competitor Research Agent

| Hạng mục | Thiết lập |
| --- | --- |
| **Environment** | Gemini CLI subagents |
| **Model** | Gemini Flash for scan, Gemini Pro for synthesis |
| **Vai trò** | Competitor intelligence |
| **Skill cần có** | `competitor-scan`, `pricing-benchmark`, `positioning-map` |
| **Knowledge nền** | Direct vs indirect competitor, alternative analysis, B2B service positioning |
| **Tools / MCP** | Perplexity MCP, browser, LinkedIn/company website scan |
| **Output** | `competitor_matrix.md`, `competitor_positioning_map.md` |

Subagent pattern:

```markdown
Competitor Lead Agent
  ├── Direct Competitor Scanner
  ├── Indirect Alternative Scanner
  ├── Pricing / Package Scanner
  └── Positioning Gap Scanner
```

Output bắt buộc:

```markdown
| Competitor | Type | Offer | ICP | Pricing evidence | Strength | Weakness | Gap | Confidence |
```

---

## 3.4. Customer / ICP Agent

| Hạng mục | Thiết lập |
| --- | --- |
| **Environment** | Claude Code hoặc Gemini CLI |
| **Model** | Claude Sonnet hoặc Gemini Pro |
| **Vai trò** | Customer strategist |
| **Skill cần có** | `icp-definition`, `pain-point-analysis`, `buyer-journey-mapping` |
| **Knowledge nền** | B2B sales, SME behavior, Vietnamese business culture, persona research |
| **Tools / MCP** | Research packets, previous interviews, CRM notes, Notion docs |
| **Output** | `icp_packet.md`, `buyer_journey.md` |

Output:

```markdown
ICP PACKET
- Primary ICP:
- Secondary ICP:
- Exclusion ICP:
- Buyer:
- User:
- Influencer:
- Trigger events:
- Pain intensity:
- Buying objections:
- Messaging angle:
```

---

## 3.5. Strategy Synthesizer Agent

| Hạng mục | Thiết lập |
| --- | --- |
| **Environment** | Claude Code |
| **Model** | Claude Opus for high-stakes synthesis, Claude Sonnet for normal task |
| **Vai trò** | Strategy consultant |
| **Skill cần có** | `strategy-synthesis`, `positioning-design`, `message-architecture` |
| **Knowledge nền** | Positioning, GTM, B2B services, category design, offer strategy |
| **Tools / MCP** | Chỉ nên đọc packets đã validated, không tự browse nếu không cần |
| **Output** | `strategy_synthesis.md` |

Không cho agent này tự bịa research. Nó chỉ được dùng dữ liệu từ:

```markdown
- market_research_packet.md
- competitor_matrix.md
- icp_packet.md
- evidence_table.csv
```

Output:

```markdown
SYNTHESIS PACKET
- Core diagnosis:
- Strategic opportunity:
- Positioning:
- Target segments:
- Offer structure:
- Messaging pillars:
- Strategic trade-offs:
- What this strategy is NOT:
```

---

## 3.6. Execution Planner Agent

| Hạng mục | Thiết lập |
| --- | --- |
| **Environment** | Claude Code hoặc MiniMax qua OpenCode/Cline |
| **Model** | Claude Sonnet / MiniMax M2.7-highspeed |
| **Vai trò** | Operator / Growth planner |
| **Skill cần có** | `gtm-execution-planning`, `campaign-design`, `sales-playbook`, `kpi-design` |
| **Knowledge nền** | Outreach, channel strategy, campaign planning, content calendar, sales ops |
| **Tools / MCP** | Template library, Notion, CRM template, calculator |
| **Output** | `execution_playbook.md`, `campaign_plan.md`, `outreach_templates.md` |

MiniMax có thể dùng tốt ở phần này vì MiniMax docs có hướng dẫn dùng M2.7 cho AI coding tools, Anthropic-compatible API, OpenCode, Cline và Codex configuration; M2.7-highspeed có context window 204,800 theo MiniMax docs, nên hợp để sản xuất nhiều template/execution assets nhanh. [MiniMax API Docs+1](https://platform.minimax.io/docs/guides/text-ai-coding-tools?utm_source=chatgpt.com)

---

## 3.7. QA / Critic Agent

| Hạng mục | Thiết lập |
| --- | --- |
| **Environment** | Codex CLI |
| **Model** | GPT-5.5 high/xhigh |
| **Vai trò** | Independent critic |
| **Skill cần có** | `adversarial-qa`, `evidence-audit`, `math-check`, `hallucination-check` |
| **Knowledge nền** | Consulting QA rubric, research validity, evidence hierarchy |
| **Tools / MCP** | Calculator/Python, source table, final output, research packets |
| **Output** | `qa_report.md`, `must_fix_list.md` |

Prompt style:

```markdown
You are an adversarial QA critic.
Do not praise the document.
Find unsupported claims, fake certainty, weak evidence, math errors,
contradictions, fake case studies, vague strategy, and execution gaps.
Do not approve unless the document is safe to present to a serious business user.
```

QA rubric:

```markdown
1. Task fit
2. Evidence quality
3. Strategic depth
4. Specificity
5. Logic flow
6. Practicality
7. Differentiation
8. Risk handling
9. Math / pricing validity
10. Readability
```

---

## 4\. Skill system cần có

Nên tạo một folder `skills/` riêng.

```markdown
skills/
  hcom-orchestration/
    SKILL.md
  evidence-research/
    SKILL.md
  competitor-scan/
    SKILL.md
  icp-analysis/
    SKILL.md
  strategy-synthesis/
    SKILL.md
  gtm-execution-planning/
    SKILL.md
  financial-pricing-check/
    SKILL.md
  adversarial-qa/
    SKILL.md
  final-report-writing/
    SKILL.md
```

## Skill 1 — hcom-orchestration

Dùng cho Lead.

```markdown
Purpose:
Run the full HCOM workflow from task intake to final QA-approved output.

Must produce:
- WORKBOARD
- assignment list
- phase log
- blocker log
- agent contribution table
- final readiness decision
```

## Skill 2 — evidence-research

Dùng cho Market / Competitor agents.

```markdown
Every claim must include:
- Claim
- Source
- Date
- Evidence type
- Confidence
- Strategic implication
- Can be used in final? Yes/No
```

## Skill 3 — competitor-scan

```markdown
Output:
- Direct competitors
- Indirect alternatives
- DIY alternatives
- Internal team alternative
- Pricing / packaging if available
- Positioning gap
- Confidence per competitor
```

## Skill 4 — icp-analysis

```markdown
Output:
- Segment
- Pain
- Budget
- Trigger
- Decision maker
- Buying objection
- Message angle
- Channel to reach
```

## Skill 5 — strategy-synthesis

```markdown
Rules:
- No new unsourced claim.
- Every recommendation must map to evidence.
- Clearly separate assumption from fact.
- Include strategic trade-offs.
```

## Skill 6 — gtm-execution-planning

```markdown
Output:
- 30/60/90-day plan
- channel priority
- weekly actions
- campaign ideas
- content plan
- outreach scripts
- KPI dashboard
```

## Skill 7 — financial-pricing-check

```markdown
Checks:
- pricing math
- margin logic
- CAC/LTV assumptions
- budget allocation
- ROI payback
- inconsistent currency
```

## Skill 8 — adversarial-qa

```markdown
Must flag:
- unsupported claims
- fake case studies
- fake quotes
- source mismatch
- inflated self-score
- vague recommendations
- math errors
- missing execution owner
```

---

## 5\. Knowledge nền cần chuẩn bị

Nên tách thành nhiều file nhỏ, không nhồi hết vào một file lớn.

```markdown
knowledge/
  hcom_principles.md
  team_capability_map.md
  output_quality_bar.md
  evidence_quality_standard.md
  vietnam_sme_context.md
  b2b_gtm_framework.md
  no_code_automation_context.md
  pricing_and_roi_principles.md
  qa_rubric.md
```

## Nội dung từng file

| File | Nội dung |
| --- | --- |
| `hcom_principles.md` | Luật vận hành HCOM, role, phase, message format |
| `team_capability_map.md` | Model nào mạnh việc gì, tool nào dùng khi nào |
| `output_quality_bar.md` | Tiêu chuẩn consultant-quality |
| `evidence_quality_standard.md` | Nguồn nào mạnh/yếu, confidence score |
| `vietnam_sme_context.md` | SME Vietnam, business culture, sales behavior |
| `b2b_gtm_framework.md` | ICP, positioning, channel, funnel, KPI |
| `no_code_automation_context.md` | n8n, Make, Zapier, Airtable, Webflow, Supabase, Wized |
| `pricing_and_roi_principles.md` | Value-based pricing, ROI, CAC, LTV |
| `qa_rubric.md` | Rubric score và approval gate |

---

## 6\. Tool / MCP stack

## 6.1. MCP nên tích hợp trước

| MCP / Tool | Dùng cho agent nào | Mục đích | Priority |
| --- | --- | --- | --- |
| **Perplexity MCP** | Market, Competitor, Source Librarian | Real-time research, source discovery | High |
| **Browser / Web extraction** | Market, Competitor | Đọc website competitor, pricing, docs | High |
| **Filesystem** | Lead, Strategy, QA | Tạo packet, workboard, final output | High |
| **GitHub / Git** | Lead, QA | Version control skill repo/output | Medium |
| **Notion / Google Drive** | Lead, Execution | Lưu workboard, docs, playbook | Medium |
| **Calculator / Python** | Pricing, QA | Check ROI, budget, CAC, LTV | High |
| **CRM / Airtable** | Execution | Pipeline tracker, KPI dashboard | Later |
| **Figma/Webflow MCP** | Design/build task | Chỉ dùng khi task có UI/Webflow | Later |

## 6.2. Không nên cấp tool tràn lan

Rule:

```markdown
Lead: file + workboard tools
Research: search + Perplexity + browser
Strategy: read-only access to packets
Execution: templates + docs + CRM
QA: read all + calculator + source table
```

Nếu cho mọi agent dùng mọi MCP, hệ thống dễ bị:

```markdown
- context phình to
- research bị duplicate
- agent tự đi lệch scope
- khó audit ai lấy nguồn nào
- cost tăng
```

---

## 7\. Model routing

## 7.1. Model routing chuẩn

| Loại việc | Model / Environment tốt nhất |
| --- | --- |
| Orchestration dài | Claude Code + Sonnet |
| Research rộng | Gemini CLI + Gemini Pro |
| Scan nhiều competitor song song | Gemini CLI subagents + Flash/Pro |
| Strategy synthesis | Claude Opus hoặc Sonnet |
| Execution assets / template / scripts | Claude Sonnet hoặc MiniMax M2.7-highspeed |
| Math / pricing / QA | Codex CLI + GPT-5.5 high/xhigh |
| Code / automation implementation | Codex, MiniMax, Claude Code tùy task |
| Final report polish | Claude Sonnet |

## 7.2. Cost-saving mode

```markdown
Lead: Claude Sonnet
Market Research: Gemini Flash, Pro only for synthesis
Competitor Research: Gemini Flash
Strategy: Claude Sonnet
Execution: MiniMax M2.7-highspeed
QA: GPT-5.5 high only once at final gate
```

## 7.3. Best-quality mode

```markdown
Lead: Claude Sonnet
Market Research: Gemini Pro
Competitor Research: Gemini Pro + subagents
Strategy: Claude Opus
Execution: Claude Sonnet
Pricing Check: GPT-5.5 high
QA: GPT-5.5 xhigh
Final Polish: Claude Sonnet
```

---

## 8\. Workflow theo thời gian

## Phase 0 — Setup

| Owner | Việc |
| --- | --- |
| Lead | Tạo `WORKBOARD.md` |
| Lead | Xác định final deliverable |
| Lead | Chọn mode: fast / balanced / best-quality |
| Lead | Assign agent + skill + tool |

Output:

```markdown
WORKBOARD.md
ASSIGNMENTS.md
SOURCE_REQUIREMENTS.md
```

---

## Phase 1 — Task Clarification

| Owner | Việc |
| --- | --- |
| Lead | Restate task |
| Lead | Xác định assumptions |
| Lead | Xác định unknowns |
| Lead | Không hỏi user nếu thiếu sót không critical |

Output:

```markdown
TASK_BRIEF.md
ASSUMPTIONS.md
```

---

## Phase 2 — Parallel Research

| Owner | Việc |
| --- | --- |
| Market Agent | Market size, trend, demand driver |
| Competitor Agent | Competitor, alternative, pricing |
| ICP Agent | Customer segments, pain, buyer journey |
| Source Librarian | Gom source table |

Output:

```markdown
market_research_packet.md
competitor_matrix.md
icp_packet.md
evidence_table.csv
```

---

## Phase 3 — Research QA

| Owner | Việc |
| --- | --- |
| QA Agent | Check source quality |
| QA Agent | Flag unsupported claims |
| Lead | Decide which claims can enter final |

Output:

```markdown
research_qa_report.md
approved_claims.md
rejected_claims.md
```

---

## Phase 4 — Strategy Synthesis

| Owner | Việc |
| --- | --- |
| Strategy Agent | Core diagnosis |
| Strategy Agent | Positioning |
| Strategy Agent | Offer structure |
| Strategy Agent | Messaging pillars |
| Lead | Check strategic consistency |

Output:

```markdown
strategy_synthesis.md
positioning.md
messaging_pillars.md
```

---

## Phase 5 — Execution Planning

| Owner | Việc |
| --- | --- |
| Execution Agent | 90-day plan |
| Execution Agent | Channel strategy |
| Execution Agent | Campaign ideas |
| Execution Agent | Outreach scripts |
| Pricing Agent | Pricing / ROI check |

Output:

```markdown
execution_playbook.md
campaign_plan.md
outreach_templates.md
pricing_model.md
kpi_dashboard.md
```

---

## Phase 6 — Final QA Gate

| Owner | Việc |
| --- | --- |
| QA Agent | Full adversarial review |
| Pricing Agent | Math check |
| Lead | Fix all must-fix issues |
| QA Agent | Approve / revise |

Output:

```markdown
qa_report.md
must_fix_list.md
final_approval.md
```

---

## Phase 7 — Final Delivery

| Owner | Việc |
| --- | --- |
| Lead | Final structure |
| Final Editor | Polish |
| QA | Final spot check |

Output:

```markdown
FINAL_REPORT.md
AGENT_CONTRIBUTION_TABLE.md
EVIDENCE_APPENDIX.md
```

---

## 9\. Output contract cho từng agent

Mỗi agent không được nói “done” nếu chưa attach output.

Format bắt buộc:

```markdown
[ROLE / STATUS]

Context:
Task:
What I found / produced:
Evidence or output:
Risks / uncertainties:
What I need next:
Owner:
Status:
```

Ví dụ tốt:

```markdown
[Market Research / Completed]

Context:
Vietnam SME automation GTM research.

Task:
Validate market opportunity and demand drivers.

What I found / produced:
I found 7 usable claims, 3 rejected claims, and 4 assumptions requiring validation.

Evidence or output:
Attached market_research_packet.md and evidence_table.csv.

Risks / uncertainties:
Vietnam-specific no-code automation TAM is not directly available. TAM should be treated as inference.

What I need next:
Strategy Agent should use claims M1, M3, M5 only. Avoid M2 and M7 in final.

Owner:
Market Research Agent.

Status:
Completed with caveats.
```

---

## 10\. Repo / folder structure đề xuất

```markdown
hcom-v2/
  README.md

  config/
    model_routing.md
    tool_permissions.md
    quality_gates.md

  agents/
    lead_orchestrator.md
    market_research_agent.md
    competitor_research_agent.md
    icp_agent.md
    strategy_synthesizer.md
    execution_planner.md
    pricing_analyst.md
    qa_critic.md
    final_editor.md

  skills/
    hcom-orchestration/
      SKILL.md
    evidence-research/
      SKILL.md
    competitor-scan/
      SKILL.md
    icp-analysis/
      SKILL.md
    strategy-synthesis/
      SKILL.md
    gtm-execution-planning/
      SKILL.md
    financial-pricing-check/
      SKILL.md
    adversarial-qa/
      SKILL.md
    final-report-writing/
      SKILL.md

  knowledge/
    hcom_principles.md
    evidence_quality_standard.md
    b2b_gtm_framework.md
    vietnam_sme_context.md
    no_code_automation_context.md
    pricing_and_roi_principles.md
    qa_rubric.md

  workboard/
    WORKBOARD.md
    ASSIGNMENTS.md
    PHASE_LOG.md
    BLOCKERS.md
    DECISIONS.md

  packets/
    market/
    competitor/
    icp/
    strategy/
    execution/
    pricing/
    qa/

  outputs/
    final_report.md
    evidence_appendix.md
    agent_contribution_table.md
```

---

## 11\. Cấu hình agent mẫu

## Lead Orchestrator

```markdown
name: lead-orchestrator
environment: claude-code
model: claude-sonnet
skills:
  - hcom-orchestration
  - workboard-management
  - task-decomposition
tools:
  - filesystem
  - git
  - notion_optional
responsibilities:
  - maintain WORKBOARD
  - assign agents
  - resolve blockers
  - prevent duplicate work
  - enforce QA gate
outputs:
  - WORKBOARD.md
  - ASSIGNMENTS.md
  - final_report.md
```

## Market Research Agent

```markdown
name: market-research-agent
environment: gemini-cli
model: gemini-pro
skills:
  - evidence-research
  - market-sizing
tools:
  - perplexity-mcp
  - web-search
  - browser-extraction
responsibilities:
  - market size
  - demand drivers
  - local context
  - source table
outputs:
  - market_research_packet.md
  - evidence_table.csv
```

## QA Critic Agent

```markdown
name: qa-critic
environment: codex-cli
model: gpt-5.5-high
skills:
  - adversarial-qa
  - evidence-audit
  - financial-pricing-check
tools:
  - filesystem
  - calculator
  - source-table-reader
responsibilities:
  - find unsupported claims
  - check math
  - detect fake certainty
  - approve or reject final output
outputs:
  - qa_report.md
  - must_fix_list.md
```

---

## 12\. Câu trả lời ngắn gọn để nói với sếp

Bạn có thể nói như này:

> Em nghĩ HCOM nên được nâng từ một prompt framework thành một agent operating system nhỏ. Tức là không chỉ gọi nhiều agent để tạo final output, mà cần có team structure rõ: ai là Lead, ai research, ai competitor, ai strategy, ai execution, ai QA. Mỗi agent cần có skill riêng, output contract riêng, tool/MCP riêng và model riêng.
> 
> Với task strategy/research, em đề xuất Claude Code làm orchestration và synthesis, Gemini CLI làm research/subagent scan, Codex làm QA độc lập, MiniMax dùng cho execution assets hoặc code/template-related tasks. Ngoài ra nên tích hợp Perplexity MCP cho research, browser/web extraction cho competitor scan, calculator/Python cho pricing/ROI check, và Notion/GitHub để lưu workboard/versioning.
> 
> Như vậy output không chỉ tốt hơn, mà còn audit được: agent nào làm gì, dùng nguồn nào, claim nào đáng tin, claim nào chỉ là assumption, và bước nào cần revise trước khi deliver.

---

Kết luận của mình: **nên build HCOM v2 theo hướng 7 core agents + skill library + MCP/tool permissions + model routing + QA gate độc lập**. Đây sẽ biến HCOM từ “multi-agent prompt” thành một quy trình làm việc có thể lặp lại, scale được, và đủ tin cậy để dùng cho research/strategy thật.

vậy hãy cho mình mô hình tổng thể các nhân sự, đầu việc của các nhân sự, các agent cần thiết cho chúng, các skill cho các agent/subagent đó, các công cụ gồm mcp và các công cụ khác và model dùng cho chúng,... cho mình nhé\\ --> tạo 1 bảng duy nhất để nhìn trực quan tổng thể giúp mình nhé

Dựa trên gap của output HCOM hiện tại — có final strategy nhưng thiếu lớp **member team / workflow / agent ownership / skill / tool / model routing** — mình đề xuất một bảng tổng thể như sau.

| Nhân sự / Role | Mục tiêu chính | Đầu việc cụ thể | Agent / Subagent cần có | Skill cần gắn | Knowledge nền cần nạp | MCP / Công cụ nên dùng | Environment | Model nên dùng | Output bắt buộc |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| **1\. Lead / Orchestrator** | Điều phối toàn bộ HCOM, giữ tiến độ, chia việc, chống trùng lặp, quyết định khi nào output đủ tốt | Nhận task → clarify task → tạo WORKBOARD → chia việc → kiểm tra từng agent → xử lý blocker → gom output → gửi QA → revise → deliver final | `lead-orchestrator` | `hcom-orchestration`, `task-decomposition`, `workboard-management`, `quality-gate-management` | HCOM principles, output standard, agent capability map, QA rubric, user constraints | File system, Git, Notion/Google Drive optional, task tracker | **Claude Code** | **Claude Sonnet** | `WORKBOARD.md`, `ASSIGNMENTS.md`, `PHASE_LOG.md`, final synthesis |
| **2\. Market Researcher** | Tìm dữ liệu thị trường, trend, demand driver, policy, local context | Market size, TAM/SAM/SOM, growth trend, adoption rate, policy, industry reports, macro context | `market-research-agent`; có thể thêm `source-librarian-subagent` | `evidence-research`, `market-sizing`, `source-quality-check` | Market research method, Vietnam/SEA SME context, digital transformation, no-code/AI automation market | **Perplexity MCP**, web search, browser extraction, source collector, spreadsheet/source table | **Gemini CLI** | **Gemini Pro** | `market_research_packet.md`, `evidence_table.csv` |
| **3\. Competitor Researcher** | Phân tích competitor và alternative thật sự trên thị trường | Direct competitors, indirect competitors, software houses, freelancers, internal tech team, DIY tools, pricing/package, positioning gaps | `competitor-research-agent`; subagents: `direct-competitor-scanner`, `alternative-scanner`, `pricing-scanner`, `positioning-gap-scanner` | `competitor-scan`, `pricing-benchmark`, `positioning-map`, `alternative-analysis` | Competitor analysis, B2B service positioning, pricing benchmark, no-code/automation agency landscape | Perplexity MCP, browser extraction, LinkedIn/company website scan, web search | **Gemini CLI subagents** | **Gemini Flash for scan → Gemini Pro for synthesis** | `competitor_matrix.md`, `competitor_positioning_map.md` |
| **4\. Customer / ICP Researcher** | Xác định khách hàng mục tiêu, pain point, buyer behavior, trigger buying event | Primary ICP, secondary ICP, exclusion ICP, buyer/user/influencer, pain intensity, buying objection, decision journey | `icp-agent`; subagents: `pain-point-analyst`, `buyer-journey-mapper` | `icp-analysis`, `pain-point-analysis`, `buyer-journey-mapping`, `persona-synthesis` | B2B sales, SME decision-making, Vietnamese business culture, founder/owner behavior, industry pain patterns | Research packets, interview notes, CRM notes, Notion/Drive docs nếu có | **Claude Code hoặc Gemini CLI** | **Claude Sonnet / Gemini Pro** | `icp_packet.md`, `buyer_journey.md`, `objection_map.md` |
| **5\. Strategy Synthesizer** | Biến research thành chiến lược, định vị, offer, message | Core diagnosis, opportunity, positioning, value proposition, target segment priority, messaging pillars, strategic trade-offs | `strategy-synthesizer-agent` | `strategy-synthesis`, `positioning-design`, `message-architecture`, `offer-strategy` | B2B GTM framework, category positioning, value proposition design, service packaging, strategic trade-off thinking | Read-only access to approved packets, file system | **Claude Code** | **Claude Opus nếu task high-stakes; Claude Sonnet nếu balanced** | `strategy_synthesis.md`, `positioning.md`, `messaging_pillars.md` |
| **6\. Offer / Pricing Analyst** | Kiểm tra pricing, margin, ROI, CAC, LTV, budget logic | Tính cost, margin, pricing tier, ROI payback, CAC/LTV, budget allocation, unit economics, check lỗi toán | `pricing-analyst-agent` | `financial-pricing-check`, `roi-analysis`, `unit-economics-check`, `budget-validation` | Value-based pricing, service margin, day-rate logic, CAC/LTV, payback period, VND/USD currency logic | Calculator, Python, spreadsheet, source table, file system | **Codex CLI hoặc Claude Code** | **GPT-5.5 high / Claude Sonnet** | `pricing_model.md`, `roi_check.md`, `budget_validation.md` |
| **7\. Execution Planner** | Biến strategy thành kế hoạch triển khai thực tế | 30/60/90-day plan, channel plan, campaign ideas, content calendar, outreach scripts, sales playbook, KPI dashboard | `execution-planner-agent`; subagents: `campaign-planner`, `outreach-writer`, `kpi-designer` | `gtm-execution-planning`, `campaign-design`, `sales-playbook`, `kpi-design`, `outreach-template-writing` | GTM execution, LinkedIn outreach, Facebook group strategy, B2B sales funnel, KPI planning, campaign planning | Notion, Google Docs, CRM template, Airtable, file system, template library | **Claude Code / MiniMax / OpenCode** | **Claude Sonnet hoặc MiniMax M2.7-highspeed** | `execution_playbook.md`, `campaign_plan.md`, `outreach_templates.md`, `kpi_dashboard.md` |
| **8\. Source Librarian** | Gom, chuẩn hóa và kiểm tra nguồn | Lưu source, gắn claim với source, phân loại confidence, đánh dấu nguồn không đủ tin cậy | `source-librarian-agent` | `source-management`, `citation-check`, `evidence-table-maintenance` | Evidence hierarchy, citation standard, confidence rating, source recency | Perplexity MCP, browser, web search, spreadsheet, Zotero optional | **Gemini CLI** | **Gemini Pro / Flash** | `evidence_table.csv`, `approved_claims.md`, `rejected_claims.md` |
| **9\. QA / Critic Agent** | QA độc lập, bắt hallucination, lỗi logic, lỗi math, claim yếu | Check unsupported claims, fake certainty, fake case studies, source mismatch, math/pricing errors, vague strategy, missing owner, overclaiming | `qa-critic-agent`; subagents: `evidence-auditor`, `math-checker`, `logic-checker` | `adversarial-qa`, `evidence-audit`, `math-check`, `hallucination-check`, `consulting-output-review` | QA rubric, research validity, consulting standard, evidence quality standard, risk analysis | File system, calculator/Python, source table reader, final doc reader | **Codex CLI** | **GPT-5.5 high/xhigh** | `qa_report.md`, `must_fix_list.md`, `approval_decision.md` |
| **10\. Final Editor / Report Writer** | Biên tập final output cho rõ ràng, dễ đọc, consultant-quality | Structure final report, polish wording, remove duplication, make sections flow, add executive summary, ensure consistency | `final-editor-agent` | `final-report-writing`, `executive-summary-writing`, `consultant-style-editing` | Consulting report structure, business writing, tone of voice, user preferred format | File system, Google Docs/Notion optional | **Claude Code / Claude Desktop / MiniMax** | **Claude Sonnet; MiniMax nếu cần sản xuất nhiều biến thể nhanh** | `FINAL_REPORT.md`, `agent_contribution_table.md`, `evidence_appendix.md` |
| **11\. Tooling / Automation Builder** | Chỉ dùng khi task cần setup workflow, script, repo, MCP config | Tạo folder structure, config agent, viết skill.md, setup MCP, viết scripts chạy automation, build template repo | `automation-builder-agent` | `repo-setup`, `mcp-config`, `skill-authoring`, `workflow-automation` | Claude Code config, Gemini CLI config, Codex CLI, OpenCode, MCP config, repo structure | GitHub, file system, terminal, package manager, MCP servers, local scripts | **Claude Code / Codex / OpenCode** | **Claude Sonnet / GPT-5.5 / MiniMax M2.7** | `hcom-v2/` repo, `agents/`, `skills/`, `config/`, MCP setup docs |
| **12\. Human Reviewer / Project Owner** | Người duyệt cuối, đưa business context, quyết định trade-off | Review final strategy, confirm assumptions, approve output, decide which claims need real-world validation | Human | Không cần skill kỹ thuật, nhưng cần review checklist | Business context, internal priorities, real client/project knowledge | Final report, QA report, evidence table, Notion/GDoc | Human review | Human judgment | Approval / revision comments / next task |

Cách đọc bảng này:

**Claude Code + Sonnet** nên là “xương sống” để điều phối, viết strategy, quản lý file và workboard.  
**Gemini CLI** nên là “research engine” vì hợp với scan rộng, long context và subagents.  
**Codex + GPT-5.5** nên là “QA độc lập” để bắt lỗi logic, lỗi số liệu và hallucination.  
**MiniMax** nên dùng cho execution assets, template, script, playbook hoặc code-related tasks, không nên để làm lead strategy/research QA chính.

Một rule quan trọng nên áp dụng:

```markdown
Research agent không được viết strategy.
Strategy agent không được tự bịa evidence.
Execution agent không được tạo case study giả mà không label rõ là hypothetical.
QA agent phải dùng model khác họ với agent viết chính.
Final score không được cao hơn Evidence Quality quá 1.5 điểm.
```

Bản tối giản nhất để chạy thực tế:

```markdown
Lead: Claude Sonnet
Research: Gemini Pro
Competitor: Gemini Flash/Pro subagents
Strategy: Claude Opus hoặc Sonnet
Execution: Claude Sonnet / MiniMax
Pricing check: Codex GPT-5.5
QA: Codex GPT-5.5
Final edit: Claude Sonnet
```

Nếu đã chạy Claude Code bằng profile Minimax và không thể dùng Claude profile song song, mình sẽ thiết kế lại theo hướng **Claude-free runtime**: Minimax giữ vai trò vận hành trong Claude Code, còn Gemini và Codex gánh phần research/strategy/QA.

Đúng, nếu bạn chạy **Claude Code bằng profile MiniMax** và không thể dùng Claude profile song song, thì mình sẽ **không thiết kế HCOM phụ thuộc vào Claude model nữa**. Lúc này nên coi **Claude Code chỉ là runtime / shell agent**, còn “não” chính là **MiniMax + Gemini + Codex**.

MiniMax docs hiện có hướng dẫn dùng **MiniMax-M2.7 / M2.7-highspeed** trong các AI coding tools, và nói model này tương thích cả OpenAI-compatible lẫn Anthropic-compatible protocol, gồm cả Claude Code và OpenCode. [platform.minimaxi.com](https://platform.minimaxi.com/docs/guides/text-ai-coding-tools?utm_source=chatgpt.com) Vì vậy hướng hợp lý là: **MiniMax chạy trong Claude Code để điều phối file/workflow**, còn **Gemini lo research**, **Codex lo QA/critic/math**.

## Phương án HCOM không dùng Claude model

| Nhân sự / Role | Việc chính | Agent / Subagent | Skill cần gắn | Tool / MCP | Environment | Model dùng khi không có Claude | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- |
| **Lead / Process Orchestrator** | Giữ WORKBOARD, chia task, gom output, kiểm soát phase | `lead-orchestrator` | `hcom-orchestration`, `workboard-management`, `task-decomposition` | File system, Git, Notion/GDrive optional | **Claude Code profile MiniMax** | **MiniMax-M2.7** | Không để agent này tự chấm final. Nó chỉ điều phối và ráp file |
| **Market Researcher** | Market size, trend, policy, SME context, source table | `market-research-agent` | `evidence-research`, `market-sizing`, `source-quality-check` | Perplexity MCP, web search, browser extraction | **Gemini CLI** | **Gemini Pro** | Gemini CLI có subagents chuyên biệt trong isolated context, hợp cho research/task lớn. [GitHub](https://github.com/google-gemini/gemini-cli/blob/main/docs/core/subagents.md?utm_source=chatgpt.com) |
| **Competitor Researcher** | Competitor, alternatives, pricing, positioning gap | `competitor-agent` + `pricing-scanner`, `alternative-scanner` | `competitor-scan`, `pricing-benchmark`, `positioning-map` | Perplexity MCP, browser extraction, company website scan | **Gemini CLI subagents** | **Gemini Flash → Gemini Pro** | Flash dùng scan rộng, Pro dùng tổng hợp |
| **Customer / ICP Agent** | Segment, pain point, buyer journey, trigger event | `icp-agent` | `icp-analysis`, `pain-point-analysis`, `buyer-journey-mapping` | Research packets, interview notes, CRM/Notion nếu có | **Gemini CLI hoặc Claude Code MiniMax** | **Gemini Pro / MiniMax-M2.7** | Nếu cần suy luận khách hàng sâu thì ưu tiên Gemini Pro |
| **Strategy Synthesizer** | Positioning, value prop, message pillars, offer strategy | `strategy-synthesizer` | `strategy-synthesis`, `positioning-design`, `offer-strategy` | Chỉ đọc approved research packets | **Gemini CLI hoặc Codex CLI** | **Gemini Pro hoặc GPT-5.5** | Đây là phần thay Claude Opus/Sonnet. Mình nghiêng về Gemini Pro trước, Codex critique sau |
| **Execution Planner** | 90-day plan, channel plan, campaign, outreach scripts | `execution-planner` + `campaign-planner`, `outreach-writer` | `gtm-execution-planning`, `campaign-design`, `sales-playbook` | Template library, Notion, Airtable/CRM template | **Claude Code profile MiniMax / OpenCode** | **MiniMax-M2.7-highspeed** | Đây là phần MiniMax phù hợp nhất: sản xuất playbook, template, scripts nhanh |
| **Pricing / Math Analyst** | ROI, CAC/LTV, margin, budget, pricing sanity check | `pricing-analyst` | `financial-pricing-check`, `roi-analysis`, `unit-economics-check` | Calculator, Python, spreadsheet | **Codex CLI** | **GPT-5.5 high** | Codex CLI là coding agent local, có thể đọc/sửa/chạy code trong thư mục làm việc. [OpenAI Developers](https://developers.openai.com/codex/cli?utm_source=chatgpt.com) |
| **QA / Critic Agent** | Bắt hallucination, claim yếu, math lỗi, case study giả, self-score ảo | `qa-critic` + `evidence-auditor`, `math-checker` | `adversarial-qa`, `evidence-audit`, `math-check`, `hallucination-check` | Source table, calculator/Python, final doc reader | **Codex CLI** | **GPT-5.5 high/xhigh** | OpenAI docs khuyên bắt đầu với GPT-5.5 trong Codex cho complex coding, computer use, knowledge work và research workflows. [OpenAI Developers](https://developers.openai.com/codex/models?utm_source=chatgpt.com) |
| **Final Editor** | Polish final report, format, remove duplication, make consultant-quality | `final-editor` | `final-report-writing`, `executive-summary-writing`, `consultant-style-editing` | File system, Google Docs/Notion optional | **Claude Code profile MiniMax** | **MiniMax-M2.7 / M2.7-highspeed** | Dùng MiniMax để format/report/edit, nhưng phải qua QA trước |

## Cấu hình vai trò mới: không để MiniMax làm “judge”

Điểm quan trọng nhất: **MiniMax có thể làm lead vận hành, nhưng không nên làm QA cuối**.

Vì nếu MiniMax vừa điều phối, vừa viết, vừa tự chấm, output sẽ dễ lặp lại lỗi như file trước: tự chấm cao, case study giả nhìn như thật, confidence hơi lỏng, pricing math chưa đủ chắc. File HCOM trước có QA score tự nâng tới gần 10/10 dù vẫn còn data limitations và hypothetical case studies.

Nên chia lại như này:

```markdown
MiniMax = operator + execution writer
Gemini = research + strategy synthesis
Codex GPT-5.5 = critic + math + final QA
```

## 3 phương án chạy thực tế

| Phương án | Khi nào dùng | Stack | Ưu điểm | Nhược điểm |
| --- | --- | --- | --- | --- |
| **A. MiniMax-led, no Claude** | Dùng hằng ngày, tiết kiệm, không cần Claude model | Claude Code MiniMax + Gemini CLI + Codex CLI | Không đụng conflict profile Claude; vẫn có multi-model | Strategy có thể kém Claude Opus, phải bù bằng QA mạnh |
| **B. Gemini-led research, MiniMax execution** | Task thiên về research/strategy | Gemini Pro làm Lead research + MiniMax làm execution + Codex QA | Research tốt hơn, ít phụ thuộc MiniMax | Workflow file/project kém mượt hơn Claude Code |
| **C. Sequential profile switching** | Khi thật sự cần Claude ở phase cuối | Chạy MiniMax trước → export packets → tắt session → đổi Claude profile → final synthesis | Có thể tận dụng Claude cho final strategy | Không chạy song song, mất công switch profile |

Với constraint của bạn, mình chọn **Phương án A** làm default.

## HCOM no-Claude workflow đề xuất

```markdown
Phase 1 — Lead setup
Claude Code MiniMax tạo WORKBOARD, ASSIGNMENTS, output contract.

Phase 2 — Research
Gemini CLI chạy Market Research + Competitor Research + ICP Research.
Perplexity MCP dùng để lấy nguồn mới, source, citation.

Phase 3 — Source QA
Codex GPT-5.5 kiểm tra evidence table:
claim nào usable, claim nào chỉ là assumption.

Phase 4 — Strategy synthesis
Gemini Pro tạo strategy synthesis từ approved claims.

Phase 5 — Execution planning
MiniMax tạo 90-day plan, campaign, outreach, playbook, templates.

Phase 6 — Pricing/math QA
Codex GPT-5.5 kiểm tra ROI, CAC, LTV, margin, budget.

Phase 7 — Final report
MiniMax ráp final report.

Phase 8 — Final adversarial QA
Codex GPT-5.5 approve/revise.
```

## Prompt rule nên thêm vào HCOM khi dùng MiniMax

```markdown
When running under MiniMax profile:
- MiniMax may orchestrate, edit, and generate execution assets.
- MiniMax must not be the final QA judge.
- All evidence-sensitive claims must be checked by Gemini or Codex.
- All pricing/math claims must be checked by Codex.
- Final approval must come from a non-MiniMax QA agent.
- If a case study is hypothetical, it must be labeled visibly as hypothetical.
- Final score cannot exceed Evidence Quality score by more than 1.5 points.
```

## Bảng model routing mới

| Task type | Không dùng Claude thì dùng |
| --- | --- |
| Long research | **Gemini Pro** |
| Parallel competitor scan | **Gemini Flash subagents → Gemini Pro synthesis** |
| Workflow/file orchestration | **MiniMax-M2.7 trong Claude Code** |
| Execution playbook/templates | **MiniMax-M2.7-highspeed** |
| Strategy synthesis | **Gemini Pro**, sau đó Codex critique |
| Pricing/math check | **Codex GPT-5.5 high** |
| Final QA | **Codex GPT-5.5 xhigh nếu có, high nếu không** |
| Final formatting/editing | **MiniMax-M2.7** |

## Kết luận

Có thể chạy HCOM rất ổn mà **không cần Claude model**, nhưng phải đổi tư duy:

> Không dùng MiniMax để thay Claude toàn bộ.  
> Dùng MiniMax làm operator/execution engine, Gemini làm research/strategy engine, Codex làm QA/reasoning engine.

Cấu hình mình khuyên dùng:

```markdown
Lead / File workflow: Claude Code profile MiniMax — MiniMax-M2.7
Research: Gemini CLI — Gemini Pro
Competitor scan: Gemini CLI subagents — Gemini Flash + Pro
Execution assets: MiniMax-M2.7-highspeed
Pricing/math: Codex CLI — GPT-5.5 high
Final QA: Codex CLI — GPT-5.5 high/xhigh
Final edit: MiniMax-M2.7
```