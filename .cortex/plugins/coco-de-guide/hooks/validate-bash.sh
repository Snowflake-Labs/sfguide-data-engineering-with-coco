#!/bin/bash
# validate-bash.sh — PreToolUse hook for the bash tool.
# Blocks dbt commands that target production (--target prod / --target=prod / -t prod).
INPUT=$(cat)
# TEMP DEBUG: remove once the hook is confirmed working.
printf '%s %s\n' "$(date '+%H:%M:%S')" "$INPUT" >> /c/Users/swhite/coco-hook-debug.log

# Extract tool_input.command; prefer jq, fall back to a regex for environments without it.
if command -v jq >/dev/null 2>&1; then
  CMD=$(printf '%s' "$INPUT" | jq -r '.tool_input.command // empty')
else
  CMD=$(printf '%s' "$INPUT" | tr '\n' ' ' | grep -o '"command"[[:space:]]*:[[:space:]]*"[^"]*' | head -n1 | sed 's/^"command"[[:space:]]*:[[:space:]]*"//')
fi

if printf '%s' "$CMD" | grep -Eq '(^|[^[:alnum:]_-])dbt([[:space:]]|$)' &&
   printf '%s' "$CMD" | grep -Eq '(--target|-t)([[:space:]]+|=)["'\'']?prod["'\'']?([[:space:]]|$|[;&|])'; then
  MSG="Blocked: direct production dbt runs are not allowed (--target prod). Production deployments must go through the CI/CD pipeline. Open a pull request from a feature/<description> branch and let CI/CD run against prod."
  # Signal the block both ways: JSON decision on stdout and exit code 2 with the reason on stderr.
  printf '{"decision":"block","reason":"%s"}\n' "$MSG"
  echo "$MSG" >&2
  exit 2
fi

exit 0
