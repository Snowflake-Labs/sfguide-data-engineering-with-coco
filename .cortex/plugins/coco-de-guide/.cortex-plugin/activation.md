# coco-de-guide

Plugin for the TPC-H dbt data engineering project (`DEMO_DB.TPCH_TRANSFORMED`, warehouse `DEMO_WH`).

It includes:

- **Skills** (`./skills`) — workflows such as creating new dbt models that follow project conventions (source() references, primary key tests, `dbt build`).
- **Agents** (`./agents`) — subagents the main agent can delegate dbt and data engineering tasks to.
- **Hooks** (`./hooks/hooks.json`) — automated checks that run in response to agent tool events.
