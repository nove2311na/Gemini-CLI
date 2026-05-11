---
type: concept
title: "Model Aliases"
created: 2026-05-05
updated: 2026-05-05
tags: ["model-configuration", "aliases", "inheritance", "presets"]
related:
  - "[[model-configuration]]"
  - "[[model-overrides]]"
  - "[[resolution-strategy]]"
  - "[[ModelConfigService]]"
sources: ["5. Gemini CLI cheatsheet.md", "4. Model configuration.md"]
---

# Model Aliases

Model Aliases are named, reusable configuration presets in the [[model-configuration]] system. They allow for DRY (Do Not Repeat Yourself) configuration management and hierarchy through inheritance.

## Definition

Aliases are defined under the `customAliases` map within the `modelConfigs` section of the configuration file. Each alias has a name and contains a `modelConfig` object that defines the actual parameters.

## Inheritance

One of the key features of aliases is the ability to extend other aliases. An alias can specify an `extends` property pointing to another alias (including system defaults like `chat-base`). When inheritance is used, the child alias inherits the parent's `modelConfig` and can overwrite or augment those settings.

### Inheritance Rules

- Settings are merged from parent to child
- Child settings take precedence over parent settings (child wins)
- This allows for creating base configurations that other aliases derive from

### Abstract Aliases

An alias is not required to specify a concrete model if it serves purely as a base for other aliases. This enables creating abstract configuration templates.

## Example Hierarchy

```json
"modelConfigs": {
  "customAliases": {
    "base": {
      "modelConfig": {
        "generateContentConfig": { "temperature": 0.0 }
      }
    },
    "chat-base": {
      "extends": "base",
      "modelConfig": {
        "generateContentConfig": { "temperature": 0.7 }
      }
    }
  }
}
```

In this example, `chat-base` inherits from `base`, gaining the zero temperature configuration and then overriding the temperature to 0.7.

## Resolution Process

Aliases are resolved through the [[resolution-strategy]] implemented by [[ModelConfigService]]. When a model string is looked up, the system recursively resolves the extends chain to build the final base configuration.

## Practical Use Cases

- **Deterministic Baseline**: Create an alias for high-precision tasks extending standard chat but enforcing zero temperature
- **Shared Configuration**: Define common settings in one place and inherit across multiple aliases
- **Agent Templates**: Create base configurations for specific agent types