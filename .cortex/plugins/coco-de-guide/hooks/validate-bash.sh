#!/bin/bash
# validate-bash.sh — PreToolUse hook for the bash tool.
# Blocks dbt commands that target the prod environment.
INPUT=$(cat)

if echo "$INPUT" | grep -qE '\bdbt\b' && \
   echo "$INPUT" | grep -qE '(--target[ =]+|-t +)prod\b'; then
  echo '{"decision": "block", "reason": "Blocked: direct production dbt runs are not allowed. Use the CI/CD pipeline to deploy to prod."}'
  exit 0
fi

exit 0
