# coco-de-guide

Project plugin for the dbt project in `dbt/`, which builds models in `DEMO_DB.TPCH_TRANSFORMED` from `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`.

## Includes

- **Skill: `new-dbt-model`**: creates a new dbt model using `source()` references, adds primary key tests to `_schema.yml`, and runs `dbt build`.
- **Agents (`./agents`)**: a dbt review subagent that checks models against the project conventions.
- **Hooks (`./hooks/hooks.json`)**: a production safety hook that guards against risky operations.

See `AGENTS.md` at the project root for the full set of project conventions.
