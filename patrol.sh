#!/bin/bash
# COBRACLAW PATROL SYSTEM
# Automated guards that watch the dojo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATROL_LOG="$SCRIPT_DIR/scrolls/patrols.log"

log_patrol() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$PATROL_LOG"
}

patrol() {
  local name="$1"
  local command="$2"
  local on_fail="$3"
  
  log_patrol "Starting patrol: $name"
  
  output=$(eval "$command" 2>&1)
  exit_code=$?
  
  if [ $exit_code -eq 0 ]; then
    log_patrol "$name: Clean. Victory."
    echo "$name: Clean."
  else
    log_patrol "$name: DEFEAT! $output"
    echo "$name: DEFEAT!"
    echo "$output"
    
    if [ "$on_fail" == "BLOCK" ]; then
      log_patrol "BLOCKING further strikes until fixed."
      echo "BLOCKED until you fix this."
      exit 1
    fi
  fi
}

# Run configured patrols
echo ""
echo "COBRACLAW PATROLS"
echo "===================="
echo ""

patrol "Code Quality" "echo 'Checking code...'" "WARN"
patrol "Test Endurance" "bash $SCRIPT_DIR/test-skill.sh" "BLOCK"

echo ""
echo "All patrols complete. The dojo is secure."
