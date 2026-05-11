# Hands-on Lab: Module 3

## Overview
- **Type:** Advanced Strategy
- **Target Audience:** Architects & Senior Developers
- **Time Estimate:** 25 Minutes

---

## Level 1: Basic - Initiating a Plan
**Objective:** Use `/plan` to map out a simple feature.

1. Launch `rtk gemini`.
2. Start a plan for a new utility:
   ```none
   /plan Create a utility function to validate email addresses.
   ```
3. Watch the agent research the project and propose a strategy.
4. Approve the plan and watch it implement.

---

## Level 2: Intermediate - Model Steering
**Objective:** Guide the agent's research phase in real-time.

1. Start a plan for a more complex task:
   ```none
   /plan Implement a basic logger that writes to a file named `app.log`.
   ```
2. **Steer:** While the agent is searching, type a hint:
   ```none
   Make sure the logger uses a rotating file strategy to prevent the log file from growing too large.
   ```
3. Observe how the agent acknowledges the hint and adjusts its research to look for "rotating file" libraries or logic.

---

## Level 3: Challenge - Collaborative Editing
**Objective:** Directly modify the agent's proposed implementation steps.

1. Prompt: `/plan Refactor @calc.js into a Class-based structure.`
2. Wait for the agent to present the final Markdown plan.
3. Press `Ctrl+X` to open the plan in your editor.
4. **Modify:** Delete one of the proposed steps or add a new requirement (e.g., "Add a 'version' static property to the class").
5. Save and close the editor.
6. Verify that Gemini acknowledges your manual edits and updates its final plan before you press `y` to implement.

---

## Troubleshooting
- **Plan Mode not starting:** Ensure it's enabled in `/settings`.
- **Steering hint ignored:** Try to steer while the agent is *actively* calling tools (indicated by the spinner).
- **Editor won't open:** Set your `EDITOR` or `VISUAL` environment variable (e.g., `export EDITOR="code --wait"`).

---

## Citations
- Source: [Plan Mode Documentation](Clippings/III. Features/III. 14. Plan Mode.md)
- Source: [Model Steering Tutorial](Clippings/II. Use Gemini CLI/7. Use Plan Mode with model steering for complex tasks.md)
