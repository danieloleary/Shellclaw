#!/bin/bash
# COBRA MODE - Aggressive Performance
# Strike fast. Strike hard. No hesitation.

COBRA_MODE=true
STRIKE_TIMEOUT=10
MAX_RETRIES=3

strike() {
  local command="$1"
  local attempt=1
  
  echo "STRIKE: $command"
  
  while [ $attempt -le $MAX_RETRIES ]; do
    echo "  Attempt $attempt/$MAX_RETRIES..."
    
    output=$(eval "$command" 2>&1)
    exit_code=$?
    
    if [ $exit_code -eq 0 ]; then
      echo "  VICTORY!"
      return 0
    fi
    
    if [ $attempt -lt $MAX_RETRIES ]; then
      echo "  Defeat. Retrying..."
    fi
    
    attempt=$((attempt + 1))
    sleep 1
  done
  
  echo "FINAL DEFEAT: $command"
  echo "FINISH IT? [y/N]"
  read -r response
  if [[ "$response" == "y" || "$response" == "Y" ]; then
    echo "FINISHING IT!"
    eval "$command" || true
  fi
  
  return 1
}

# Execute command in Cobra Mode
if [ -n "$1" ]; then
  strike "$1"
else
  echo "COBRA MODE ACTIVATED"
  echo "Usage: ./cobra-mode.sh '<command>'"
fi
