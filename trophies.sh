#!/bin/bash
# COBRACLAW TROPHIES SYSTEM
# Track victories and display trophy case

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TROPHY_FILE="$SCRIPT_DIR/scrolls/trophies.json"
TROPHY_DIR="$SCRIPT_DIR/scrolls"

# Initialize trophy file
init_trophies() {
  mkdir -p "$TROPHY_DIR"
  if [ ! -f "$TROPHY_FILE" ]; then
    cat > "$TROPHY_FILE" << 'EOF'
{
  "diamonds": 0,
  "golds": 0,
  "silvers": 0,
  "bronzes": 0,
  "fires": 0,
  "streak": 0,
  "total": 0,
  "victories": []
}
EOF
    echo "Trophy case initialized."
  fi
}

# Add a trophy
add_trophy() {
  local type="${1:-bronze}"
  local task="$2"
  
  init_trophies
  
  local points=0
  local medal=""
  
  case "$type" in
    diamond) points=10; medal="[D]" ;;
    gold)    points=5;  medal="[G]" ;;
    silver)  points=3;  medal="[S]" ;;
    bronze)  points=1;  medal="[B]" ;;
    *)       points=1;  medal="[B]" ;;
  esac
  
  # Update counts
  local diamonds=$(grep -o '"diamonds": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local golds=$(grep -o '"golds": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local silvers=$(grep -o '"silvers": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local bronzes=$(grep -o '"bronzes": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local fires=$(grep -o '"fires": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local streak=$(grep -o '"streak": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local total=$(grep -o '"total": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  
  # Increment
  case "$type" in
    diamond) diamonds=$((diamonds + 1)) ;;
    gold)    golds=$((golds + 1)) ;;
    silver)  silvers=$((silvers + 1)) ;;
    bronze)  bronzes=$((bronzes + 1)) ;;
  esac
  
  streak=$((streak + 1))
  total=$((total + points))
  
  # Check for streak bonus
  if [ $streak -ge 3 ]; then
    fires=$((fires + 1))
    total=$((total + 2))
    echo "STREAK OF $streak! Bonus trophy awarded!"
    streak=0
  fi
  
  # Simpler approach - rewrite file
  cat > "$TROPHY_FILE" << EOF
{
  "diamonds": $diamonds,
  "golds": $golds,
  "silvers": $silvers,
  "bronzes": $bronzes,
  "fires": $fires,
  "streak": $streak,
  "total": $total,
  "victories": []
}
EOF
  
  echo ""
  echo "VICTORY! $medal Trophy added to case."
  echo "   Task: $task"
  echo ""
  show_trophy_case
}

# Show trophy case
show_trophy_case() {
  init_trophies
  
  local diamonds=$(grep -o '"diamonds": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local golds=$(grep -o '"golds": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local silvers=$(grep -o '"silvers": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local bronzes=$(grep -o '"bronzes": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local fires=$(grep -o '"fires": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  local total=$(grep -o '"total": [0-9]*' "$TROPHY_FILE" | grep -o '[0-9]*')
  
  echo ""
  echo "COBRACLAW TROPHY CASE"
  echo "============================"
  echo "Diamond: $diamonds"
  echo "Gold:    $golds"
  echo "Silver:  $silvers"
  echo "Bronze:  $bronzes"
  echo "Fire:    $fires"
  echo "----------------------------"
  echo "TOTAL:      $total VICTORIES"
  echo "============================"
  echo ""
}

# Reset trophies
reset_trophies() {
  rm -f "$TROPHY_FILE"
  echo "Trophy case cleared. New dojo session begins."
}

# Export trophy summary
export_trophies() {
  init_trophies
  echo "TROPHY SUMMARY - $(date '+%Y-%m-%d %H:%M')"
  cat "$TROPHY_FILE"
}

# Main
case "$1" in
  add)    add_trophy "$2" "$3" ;;
  show)   show_trophy_case ;;
  reset)  reset_trophies ;;
  export) export_trophies ;;
  init)   init_trophies ;;
  *)      echo "TROPHIES - Usage: ./trophies.sh [add|show|reset|export|init]" ;;
esac
