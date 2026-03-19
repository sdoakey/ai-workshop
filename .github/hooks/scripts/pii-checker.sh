#!/usr/bin/env bash
# pii-checker.sh — UserPromptSubmit hook that scans the user prompt for PII.
# If PII is detected the prompt is blocked with an explanatory message.
# Passes all other hook events through as a no-op.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="${SCRIPT_DIR}/../logs"
LOG_FILE="${LOG_DIR}/hooks.log"

mkdir -p "${LOG_DIR}"

# Read JSON input from stdin
INPUT=$(cat)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")

# Extract the hook event name (portable: no jq dependency)
HOOK_EVENT=$(echo "${INPUT}" | grep -o '"hookEventName"\s*:\s*"[^"]*"' | head -1 | sed 's/.*:.*"\([^"]*\)"/\1/')

# Only act on UserPromptSubmit events — pass everything else through
if [[ "${HOOK_EVENT}" != "UserPromptSubmit" ]]; then
  echo '{}'
  exit 0
fi

# Extract the prompt text from the JSON input
PROMPT=$(echo "${INPUT}" | grep -o '"prompt"\s*:\s*"[^"]*"' | head -1 | sed 's/"prompt"\s*:\s*"\(.*\)"/\1/')

PII_TYPE=""

# Email addresses  (user@domain.tld)
if echo "${PROMPT}" | grep -qiE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'; then
  PII_TYPE="email address"

# US phone numbers  (555-123-4567 / (555) 123-4567 / +1 555 123-4567 etc.)
elif echo "${PROMPT}" | grep -qE '(\+?1[[:space:].-]?)?\(?[0-9]{3}\)?[[:space:].-][0-9]{3}[[:space:].-][0-9]{4}'; then
  PII_TYPE="phone number"

# US Social Security Numbers  (123-45-6789)
elif echo "${PROMPT}" | grep -qE '(^|[^0-9])[0-9]{3}-[0-9]{2}-[0-9]{4}([^0-9]|$)'; then
  PII_TYPE="Social Security Number"

# Major credit card numbers  (Visa, Mastercard, Amex, Discover — 13–16 digit patterns)
elif echo "${PROMPT}" | grep -qE '(^|[^0-9])(4[0-9]{12}([0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|6011[0-9]{12})([^0-9]|$)'; then
  PII_TYPE="credit card number"

# UK National Insurance numbers  (AB123456C)
elif echo "${PROMPT}" | grep -qE '(^|[[:space:]])[A-Z]{2}[0-9]{6}[A-Z]([[:space:]]|$)'; then
  PII_TYPE="National Insurance number"
fi

if [[ -n "${PII_TYPE}" ]]; then
  {
    echo "────────────────────────────────────────"
    echo "[${TIMESTAMP}] PII_BLOCKED — Event: ${HOOK_EVENT} | Detected: ${PII_TYPE}"
    echo ""
  } >> "${LOG_FILE}"

  echo '{"decision":"block","reason":"This prompt looks to contain PII - it will not be submitted"}'
  exit 0
fi

# No PII detected — allow the prompt through
echo '{}'
