# AGENTS.md

Guidance for AI agents working in this repository.

## Snowflake Environment

- **Database:** `DEMO_DB`
- **Schema:** `TPCH_TRANSFORMED`
- **Warehouse:** `DEMO_WH`

## Source Data

- Source data is `TPCH_SF1` in the `SNOWFLAKE_SAMPLE_DATA` database.
- All raw tables must be referenced through `_sources.yml` using `{{ source(...) }}`. Never hardcode raw table names in models.

## dbt Commands

- Build the full project:
  ```
  dbt build --project-dir dbt/
  ```
- Build a single model:
  ```
  dbt build --select <model_name> --project-dir dbt/
  ```

## Conventions

- Model files use **snake_case** naming (e.g., `stg_orders.sql`, `fct_order_items.sql`).

## Git Workflow

- Feature branches follow the pattern: `feature/<description>`
- Pull requests are required before merging to `main`. Do not push directly to `main`.

## Tooling

- This project uses CoCo Desktop. Do **not** use the `cortex` CLI command.
