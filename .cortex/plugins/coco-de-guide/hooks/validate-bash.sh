#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$COMMAND" | grep -q "dbt" && echo "$COMMAND" | grep -q "\-\-target prod"; then
  echo "Direct production dbt runs are not allowed. Use the CI/CD pipeline instead." >&2
  exit 2
fi
