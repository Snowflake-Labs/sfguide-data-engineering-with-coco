---
name: new-dbt-model
description: Use when the user asks to create, add, or scaffold a new dbt model in this project.
---

# Conventions

1. Always use `dbt build` (not `dbt run`) so tests run together with compilation
2. Every model's primary key must have not_null and unique tests in _schema.yml
3. All raw tables must be referenced through _sources.yml using source() — never reference the source database directly in model SQL

# Workflow

1. Confirm which source table(s) to model — ask if not specified
2. Write the model SQL using source() references
3. Add the model entry to _schema.yml with a description and primary key tests
4. Run `dbt build --select <model_name> --project-dir dbt/` and report the result
