# AGENTS.md

## Snowflake Environment

- **Database:** `DEMO_DB`
- **Schema:** `TPCH_TRANSFORMED`
- **Warehouse:** `DEMO_WH`
- **Role:** `DEMO_ROLE`

## Source Data

Source data comes from `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`. All raw tables must be referenced through `dbt/models/_sources.yml` — never query source tables directly in models.

## dbt

- **Build all models:** `dbt build --project-dir dbt/`
- **Build a single model:** `dbt build --select <model_name> --project-dir dbt/`
- Model files use **snake_case** naming (e.g., `orders_summary.sql`, `customers.sql`).

## Git Workflow

- Feature branches follow the pattern: `feature/<description>`
- PRs are required before merging to `main`

## Tooling

This project uses **CoCo Desktop**. Do not use the `cortex` CLI command.
