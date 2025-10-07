#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_HELP_DIR="${SCRIPT_DIR}/ai_help"
cd "${AI_HELP_DIR}"
bash ./keygen.sh
find ./key -type f ! -name '*.key' -delete
bash ./unifier.sh
if [[ ! -s ./main.key ]] || ! grep -qE '^[0-9]+$' ./main.key; then
  SUM=0
  for f in ./key/*.key; do
    VAL="$(tr -d ' \t\r\n' < "$f")"
    [[ "$VAL" =~ ^[0-9]+$ ]] || exit 1
    SUM=$((SUM + VAL))
  done
  echo $((SUM * 2)) > ./main.key
fi
