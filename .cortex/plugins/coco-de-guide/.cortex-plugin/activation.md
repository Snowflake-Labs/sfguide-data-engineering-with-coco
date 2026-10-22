# coco-de-guide

Project-scoped CoCo Desktop plugin for the data engineering with CoCo guide.

## What's included

- **Skills** (`./skills`): Each subfolder has a `SKILL.md` with steps for working in this dbt project. That covers building models against `DEMO_DB.TPCH_TRANSFORMED` and naming files in snake_case.
- **Agents** (`./agents`): Subagent definitions (`.md` files) that the main agent can hand focused tasks to, such as checking models.
- **Hooks** (`./hooks/hooks.json`): Shell commands that run automatically before or after tool calls.

## Activation

The plugin lives under `.cortex/plugins/`, so it only activates once the workspace is trusted. You can also turn it on manually under **Agent Settings → Plugins**.
