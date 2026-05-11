# Module 3: Advanced Task Planning & Steering

## 1. Learning Objectives
By the end of this module, students will be able to:
- **[Understand]** Explain the Research-Strategy-Execution lifecycle and the safety benefits of Plan Mode.
- **[Apply]** Initiate and guide complex tasks using `/plan` and real-time model steering.
- **[Analyze]** Evaluate and refine implementation plans using the collaborative editing feature (`Ctrl+X`).
- **[Create]** Configure custom policies to optimize tool usage within the Plan Mode environment.

---

## 2. The Architecture of Plan Mode
Plan Mode is a **read-only** environment designed for high-stakes or complex tasks. It ensures that the agent understands the problem and the solution before touching any production code.

### The 3-Step Lifecycle
1. **Research:** The agent explores the codebase using read-only tools (`read_file`, `grep_search`, `list_directory`).
2. **Strategy:** The agent proposes an architectural approach and discusses it with you.
3. **Execution:** Once a plan is finalized and approved, the agent switches to implementation mode.

### Automatic Model Routing
- **Planning Phase:** Uses a high-reasoning **Pro** model for complex decision-making.
- **Implementation Phase:** Switches to a high-speed **Flash** model once the plan is approved to accelerate coding.

---

## 3. Real-time Model Steering
Model steering allows you to provide "hints" while the agent is actively working (e.g., while the spinner is active).

### Why Steer?
- **Correct the Path:** "Don't look in `src/legacy`, check `src/v2` instead."
- **Enforce Patterns:** "Use the Factory pattern for this service."
- **Provide Context:** "This module will be deprecated next month; use the new API."

---

## 4. Collaborative Plan Editing
Sometimes natural language is too vague. Gemini CLI allows you to edit the proposed plan file directly.

1. **Invoke:** Press `Ctrl+X` when the agent presents a plan for review.
2. **Edit:** The plan opens in your default editor (VS Code, Vim, etc.).
3. **Refine:** You can reorder steps, add specific technical constraints, or delete unnecessary tasks.
4. **Sync:** Once you save and close, the agent automatically re-reads the plan and updates its strategy.

---

## 5. Security & Custom Policies
Plan Mode is restricted by a default policy (`plan.toml`) that blocks write operations. However, you can create custom rules in `~/.gemini/policies/` to allow specific read-only tools (like Git status) or auto-approve safe MCP tools.

### Example: Allow Git in Plan Mode
```toml
[[rule]]
toolName = "run_shell_command"
commandPrefix = ["git status", "git diff"]
decision = "allow"
priority = 100
modes = ["plan"]
```

---

## 6. Case Study: Architecting a Redis Service
**Scenario:** Implementing a Notification Service using Redis Pub/Sub.
**Solution Workflow:**
1. **Initiate:** `/plan Create a Redis-based notification service.`
2. **Steer:** Hint: "Check `packages/common` for the existing Redis connection logic."
3. **Discuss:** Agent asks: "Should I use a simple queue or Pub/Sub?" User: "Pub/Sub."
4. **Review:** Agent drafts a plan. User uses `Ctrl+X` to add a specific retry-logic requirement to Step 4.
5. **Implement:** User approves, and Gemini begins coding across multiple files.

---

## 7. Comparison: Plan Mode vs. Auto-Edit Mode
| Feature | Plan Mode | Auto-Edit Mode |
| :--- | :--- | :--- |
| **Safety** | Read-only (Surgical) | Write-enabled (Fast) |
| **Model** | Pro (Reasoning) | Flash (Speed) |
| **Workflow** | Strategic (Thinking first) | Tactical (Coding first) |
| **Best For** | Large features, Refactors | Bug fixes, Small tasks |

---

## Citations
- Source: [Plan Mode Documentation](Clippings/III. Features/III. 14. Plan Mode.md)
- Source: [Model Steering Tutorial](Clippings/II. Use Gemini CLI/7. Use Plan Mode with model steering for complex tasks.md)
- Source: [Project Context Reference](Clippings/IV. Configuration/5. Project context (GEMINI.md).md)
