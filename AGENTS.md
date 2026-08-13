# AGENTS.md

## Snowflake environment

- **Database:** DEMO_DB
- **Schema:** TPCH_TRANSFORMED
- **Warehouse:** DEMO_WH

## dbt

- Build all models: `dbt build --project-dir dbt/`
- Build a single model: `dbt build --select <model_name> --project-dir dbt/`
- Model files use snake_case naming convention
- Source data lives in `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1` — all raw tables must be referenced through `_sources.yml`

## Git workflow

- Feature branches: `feature/<description>`
- PRs are required before merging to main

## Tooling

- This project uses CoCo Desktop — do not use the `cortex` CLI command
