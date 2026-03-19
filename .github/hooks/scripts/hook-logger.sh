#!/usr/bin/env bash
# hook-logger.sh — Shared no-op hook script for all Copilot hook lifecycle events.
# Reads the JSON input from stdin, logs the event to a log file, and exits 0
# with an empty JSON object (no-op / no behaviour changes).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="${SCRIPT_DIR}/../logs"
LOG_FILE="${LOG_DIR}/hooks.log"

mkdir -p "${LOG_DIR}"

# Read JSON input from stdin (VS Code sends hook context as JSON)
INPUT=$(cat)

# Extract the hook event name from the input (portable: no jq dependency)
HOOK_EVENT=$(echo "${INPUT}" | grep -o '"hookEventName"\s*:\s*"[^"]*"' | head -1 | sed 's/.*:.*"\([^"]*\)"/\1/')
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")

# Log the invocation
{
  echo "────────────────────────────────────────"
  echo "[${TIMESTAMP}] Hook event: ${HOOK_EVENT:-unknown}"
  echo "Input: ${INPUT}"
  echo ""
} >> "${LOG_FILE}"

# Output valid empty JSON so VS Code treats this as a successful no-op
echo '{}'
