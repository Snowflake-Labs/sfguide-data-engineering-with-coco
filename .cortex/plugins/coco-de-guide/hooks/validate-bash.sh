#!/bin/bash
# validate-bash.sh - PreToolUse hook for the bash tool.
# Blocks dbt commands that target production (--target prod, --target=prod, -t prod).
# Reads the hook context JSON from stdin. Blocks two ways, per the hooks docs:
# JSON {"decision":"block"} on stdout, and exit code 2 with the reason on stderr.

INPUT=$(cat)
echo "$(date) cwd=$(pwd) input=$INPUT" >> /tmp/coco-hook-debug.log

REASON="Blocked: direct production dbt runs are not allowed. Commands using --target prod must go through the CI/CD pipeline. Open a PR from a feature/<description> branch and let the pipeline deploy to production."

if echo "$INPUT" | grep -qiE '\bdbt\b' &&
   echo "$INPUT" | grep -qiE '(--target[= ]+|-t +)prod\b'; then
  echo "  -> BLOCK" >> /tmp/coco-hook-debug.log
  printf '{"decision":"block","reason":"%s"}\n' "$REASON"
  echo "$REASON" >&2
  exit 2
fi

exit 0
