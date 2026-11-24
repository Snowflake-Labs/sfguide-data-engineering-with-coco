#!/bin/bash
# validate-bash.sh — PreToolUse hook for the bash tool.
# Blocks dbt commands that target production (--target prod / --target=prod / -t prod).
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -Eq '(^|[^[:alnum:]_])dbt[[:space:]]' &&
   echo "$CMD" | grep -Eq '(--target|-t)([[:space:]]+|=)["'\'']?prod["'\'']?([^[:alnum:]_-]|$)'; then
  echo "Blocked: direct production dbt runs (--target prod) are not allowed. Use the CI/CD pipeline to deploy to production." >&2
  exit 2
fi

exit 0
