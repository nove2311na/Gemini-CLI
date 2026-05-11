## A practical guide to building agents

<!-- image-->

## Contents

What is an agent? 4   
When should you build an agent? 5   
Agent design foundations 7   
Guardrails 24   
Conclusion 32

## Introduction

Large language models are becoming increasingly capable of handling complex, multi-step tasks. Advances in reasoning, multimodality, and tool use have unlocked a new category of LLM-powered systems known as agents.

This guide is designed for product and engineering teams exploring how to build their first agents, distilling insights from numerous customer deployments into practical and actionable best practices. It includes frameworks for identifying promising use cases, clear patterns for designing agent logic and orchestration, and best practices to ensure your agents run safely, predictably, and effectively.

After reading this guide, you’ll have the foundational knowledge you need to confidently start building your first agent.

# What is an agent?

While conventional software enables users to streamline and automate workflows, agents are able to perform the same workflows on the users’ behalf with a high degree of independence.

Agents are systems that independently accomplish tasks on your behalf.

A workflow is a sequence of steps that must be executed to meet the user’s goal, whether that's resolving a customer service issue, booking a restaurant reservation, committing a code change, or generating a report.

Applications that integrate LLMs but don’t use them to control workflow execution—think simple chatbots, single-turn LLMs, or sentiment classifiers—are not agents.

More concretely, an agent possesses core characteristics that allow it to act reliably and consistently on behalf of a user:

01 It leverages an LLM to manage workflow execution and make decisions. It recognizes when a workflow is complete and can proactively correct its actions if needed. In case of failure, it can halt execution and transfer control back to the user.

02 It has access to various tools to interact with external systems—both to gather context and to take actions—and dynamically selects the appropriate tools depending on the workflow’s current state, always operating within clearly defined guardrails.

# When should you build an agent?

Building agents requires rethinking how your systems make decisions and handle complexity. Unlike conventional automation, agents are uniquely suited to workflows where traditional deterministic and rule-based approaches fall short.

Consider the example of payment fraud analysis. A traditional rules engine works like a checklist, flagging transactions based on preset criteria. In contrast, an LLM agent functions more like a seasoned investigator, evaluating context, considering subtle patterns, and identifying suspicious activity even when clear-cut rules aren’t violated. This nuanced reasoning capability is exactly what enables agents to manage complex, ambiguous situations effectively.

As you evaluate where agents can add value, prioritize workflows that have previously resisted automation, especially where traditional methods encounter friction:

<table><tr><td>01</td><td>Complex decision-making:</td><td>Workflows involving nuanced judgment, exceptions, or context-sensitive decisions, for example refund approval in customer service workflows.</td></tr><tr><td>02</td><td>Difficult-to-maintain rules:</td><td>Systems that have become unwieldy due to extensive and intricate rulesets, making updates costly or error-prone, for example performing vendor security reviews.</td></tr><tr><td>03</td><td>Heavy reliance on unstructured data:</td><td>Scenarios that involve interpreting natural language, extracting meaning from documents, or interacting with users conversationally, for example processing a home insurance claim.</td></tr></table>

Before committing to building an agent, validate that your use case can meet these criteria clearly.   
Otherwise, a deterministic solution may suffice.

# Agent design foundations

In its most fundamental form, an agent consists of three core components:

01 Model

The LLM powering the agent’s reasoning and decision-making

02 Tools

External functions or APIs the agent can use to take action

03 Instructions

Explicit guidelines and guardrails defining how the agent behaves

Here’s what this looks like in code when using OpenAI’s Agents SDK. You can also implement the same concepts using your preferred library or building directly from scratch.

Python   
1 weather_agent = Agent(   
2 name= ,
 "Weather agent"   
3 instructions= "You are a helpful agent who can talk to users about the   
4 weather.",   
5 tools=[get_weather],   
6 )

## Selecting your models

Different models have different strengths and tradeoffs related to task complexity, latency, and cost. As we’ll see in the next section on Orchestration, you might want to consider using a variety of models for different tasks in the workflow.

Not every task requires the smartest model—a simple retrieval or intent classification task may be handled by a smaller, faster model, while harder tasks like deciding whether to approve a refund may benefit from a more capable model.

An approach that works well is to build your agent prototype with the most capable model for every task to establish a performance baseline. From there, try swapping in smaller models to see if they still achieve acceptable results. This way, you don’t prematurely limit the agent’s abilities, and you can diagnose where smaller models succeed or fail.

In summary, the principles for choosing a model are simple:

<table><tr><td>01</td><td> Set up evals to establish a performance baseline</td></tr><tr><td>02</td><td>Focus on meeting your accuracy target with the best models available</td></tr><tr><td>03</td><td>Optimize for cost and latency by replacing larger models with smaller ones where possible</td></tr></table>

You can find a comprehensive guide to selecting OpenAI models here.

## Defining tools

Tools extend your agent’s capabilities by using APIs from underlying applications or systems. For legacy systems without APIs, agents can rely on computer-use models to interact directly with those applications and systems through web and application UIs—just as a human would.

Each tool should have a standardized definition, enabling flexible, many-to-many relationships between tools and agents. Well-documented, thoroughly tested, and reusable tools improve discoverability, simplify version management, and prevent redundant definitions.

Broadly speaking, agents need three types of tools:

<table><tr><td>Type</td><td>Description</td><td>Examples</td></tr><tr><td>Data</td><td>Enable agents to retrieve context and information necessary for executing the workflow.</td><td>Query transaction databases or systems like CRMs, read PDF documents, or search the web.</td></tr><tr><td>Action</td><td>Enable agents to interact with systems to take actions such as adding new information to databases,updating records, or sending messages.</td><td>Send emails and texts, update a CRM record, hand-off a customer service ticket to a human.</td></tr><tr><td>Orchestration</td><td>Agents themselves can serve as tools for other agents一see the Manager Pattern in the Orchestration section.</td><td>Refund agent, Research agent, Writing agent.</td></tr></table>

For example, here’s how you would equip the agent defined above with a series of tools when using the Agents SDK:

Python   
1 from import agents Agent, WebSearchTool, function_tool   
2 @function_tool   
3 def save_results(output):   
4 db.insert({ : output, : datetime.time()})
"output" "timestamp"   
5 return "File saved"   
6   
7 search_agent = Agent(   
8 name= ,
"Search agent"   
8 instructions= "Help the user search the internet and save results if   
10 asked.",   
11 tools=[WebSearchTool(),save_results],   
12 )

As the number of required tools increases, consider splitting tasks across multiple agents (see Orchestration).

## Configuring instructions

High-quality instructions are essential for any LLM-powered app, but especially critical for agents. Clear instructions reduce ambiguity and improve agent decision-making, resulting in smoother workflow execution and fewer errors.

Best practices for agent instructions

<table><tr><td>Use existing documents Prompt agents to break</td><td>When creating routines, use existing operating procedures, support scripts, or policy documents to create LLM-friendly routines.In customer service for example, routines can roughly map to individual articles in your knowledge base.</td></tr><tr><td>down tasks</td><td>Providing smaller, clearer steps from dense resources helps minimize ambiguity and helps the model better follow instructions.</td></tr><tr><td>Define clear actions</td><td>Make sure every step in your routine corresponds to a specific action or output. For example,a step might instruct the agent to ask the user for their order number or to call an APl to retrieve account details. Being explicit about the action (and even the wording of a user-facing message) leaves less room for errors in interpretation.</td></tr><tr><td>Capture edge cases</td><td>Real-world interactions often create decision points such as how to proceed when a user provides incomplete information or asks an unexpected question.A robust routine anticipates common variations and includes instructions on how to handle them with conditional steps or branches such as an alternative step if a required piece of info is missing.</td></tr></table>

You can use advanced models, like o1 or o3-mini, to automatically generate instructions from existing documents. Here’s a sample prompt illustrating this approach:

## Unset

1 “You are an expert in writing instructions for an LLM agent. Convert the following help center document into a clear set of instructions, written in a numbered list. The document will be a policy followed by an LLM. Ensure that there is no ambiguity, and that the instructions are written as directions for an agent. The help center document to convert is the following {{help_center_doc}}”

## Orchestration

With the foundational components in place, you can consider orchestration patterns to enable your agent to execute workflows effectively.

While it’s tempting to immediately build a fully autonomous agent with complex architecture, customers typically achieve greater success with an incremental approach.

In general, orchestration patterns fall into two categories:

01 Single-agent systems, where a single model equipped with appropriate tools and instructions executes workflows in a loop

02 Multi-agent systems, where workflow execution is distributed across multiple coordinated agents

Let’s explore each pattern in detail.

## Single-agent systems

A single agent can handle many tasks by incrementally adding tools, keeping complexity manageable and simplifying evaluation and maintenance. Each new tool expands its capabilities without prematurely forcing you to orchestrate multiple agents.

<!-- image-->

Every orchestration approach needs the concept of a ‘run’, typically implemented as a loop that lets agents operate until an exit condition is reached. Common exit conditions include tool calls, a certain structured output, errors, or reaching a maximum number of turns.

For example, in the Agents SDK, agents are started using the method, which loops Runner.run() over the LLM until either:

A final-output tool is invoked, defined by a specific output type

02 The model returns a response without any tool calls (e.g., a direct user message)

Example usage:

## Python

1 Agents.run(agent, [UserMessage( )]) "What's the capital of the USA?"

This concept of a while loop is central to the functioning of an agent. In multi-agent systems, as you’ll see next, you can have a sequence of tool calls and handoffs between agents but allow the model to run multiple steps until an exit condition is met.

An effective strategy for managing complexity without switching to a multi-agent framework is to use prompt templates. Rather than maintaining numerous individual prompts for distinct use cases, use a single flexible base prompt that accepts policy variables. This template approach adapts easily to various contexts, significantly simplifying maintenance and evaluation. As new use cases arise, you can update variables rather than rewriting entire workflows.

## Unset

## When to consider creating multiple agents

Our general recommendation is to maximize a single agent’s capabilities first. More agents can provide intuitive separation of concepts, but can introduce additional complexity and overhead, so often a single agent with tools is sufficient.

For many complex workflows, splitting up prompts and tools across multiple agents allows for improved performance and scalability. When your agents fail to follow complicated instructions or consistently select incorrect tools, you may need to further divide your system and introduce more distinct agents.

Practical guidelines for splitting agents include:

Complex logic

When prompts contain many conditional statements (multiple if-then-else branches), and prompt templates get difficult to scale, consider dividing each logical segment across separate agents.

The issue isn’t solely the number of tools, but their similarity or overlap. Some implementations successfully manage more than 15 well-defined, distinct tools while others struggle with fewer than 10 overlapping tools. Use multiple agents if improving tool clarity by providing descriptive names, clear parameters, and detailed descriptions doesn’t improve performance.

## Multi-agent systems

While multi-agent systems can be designed in numerous ways for specific workflows and requirements, our experience with customers highlights two broadly applicable categories:

Manager (agents as tools)

A central “manager” agent coordinates multiple specialized agents via tool calls, each handling a specific task or domain.

Decentralized (agents handing off to agents)

Multiple agents operate as peers, handing off tasks to one another based on their specializations.

Multi-agent systems can be modeled as graphs, with agents represented as nodes. In the manager pattern, edges represent tool calls whereas in the decentralized pattern, edges represent handoffs that transfer execution between agents.

Regardless of the orchestration pattern, the same principles apply: keep components flexible, composable, and driven by clear, well-structured prompts.

## Manager pattern

The manager pattern empowers a central LLM—the “manager”—to orchestrate a network of specialized agents seamlessly through tool calls. Instead of losing context or control, the manager intelligently delegates tasks to the right agent at the right time, effortlessly synthesizing the results into a cohesive interaction. This ensures a smooth, unified user experience, with specialized capabilities always available on-demand.

This pattern is ideal for workflows where you only want one agent to control workflow execution and have access to the user.

<!-- image-->

```csv
Python
1 from import agents Agent, Runner
2
3 manager_agent = Agent(
4 "manager_agent" name= ,
5 instructions=(
6 "You are a translation agent. You use the tools given to you to
7 translate."
8 "If asked for multiple translations, you call the relevant tools."
9 ),
10 tools=[
11 spanish_agent.as_tool(
12 "translate_to_spanish"tool_name= ,
13 "Translate the user's message to Spanish"tool_description= ,
14 ),
15 french_agent.as_tool(
16 "translate_to_french"tool_name= ,
17 "Translate the user's message to French" tool_description= ,
18 ),
19 italian_agent.as_tool(
20 "translate_to_italian" tool_name= ,
21 "Translate the user's message to Italian" tool_description= ,
22 ),
23 ],
```

```python
24 )
25
26 main():
async def
27 msg = input( )

"Translate 'hello' to Spanish, French and Italian for me!"
28
29 orchestrator_output = await Runner.run(
30 manager_agent,msg)
32
32 message orchestrator_output.new_messages:
for in
33 (f"  - {message.content}")print Translation step:
```

## Declarative vs non-declarative graphs

Some frameworks are declarative, requiring developers to explicitly define every branch, loop, and conditional in the workflow upfront through graphs consisting of nodes (agents) and edges (deterministic or dynamic handoffs). While beneficial for visual clarity, this approach can quickly become cumbersome and challenging as workflows grow more dynamic and complex, often necessitating the learning of specialized domain-specific languages.

In contrast, the Agents SDK adopts a more flexible, code-first approach. Developers can directly express workflow logic using familiar programming constructs without needing to pre-define the entire graph upfront, enabling more dynamic and adaptable agent orchestration.