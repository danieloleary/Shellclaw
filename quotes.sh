#!/bin/bash
# 💬 COBRACLAW QUOTES
# Get a random motivational quote

CONTEXT="${1:-startup}"
MODE="${2:-adaptive}"

# Cobra Kai Quotes
declare -a COBRA_STARTUP=(
  "Fear does not exist in this dojo."
  "Strike first. Strike hard. No mercy."
  "The enemy (bugs) never sleeps. Neither do we."
  "Cobra Kai! Strike first!"
  "Today is a good day to conquer."
)

declare -a COBRA_VICTORY=(
  "Another trophy for the dojo, Sensei!"
  "Victory is not given. It is taken."
  "Champion grows stronger with each strike."
  "No mercy on the field of battle."
  "You strike. You conquer. You win."
)

declare -a COBRA_DEFEAT=(
  "Defeat is a teacher, not a sentence."
  "Get up! Strike again!"
  "A true warrior learns from failure."
  "The fall makes the rise sweeter."
  "No one stays down in this dojo."
)

declare -a COBRA_STRIKE=(
  "Strike first. Strike hard."
  "No mercy. No hesitation."
  "Attack, always attack!"
  "Power through the pain."
  "Finish it!"
)

declare -a COBRA_PATROL=(
  "The dojo never sleeps. Neither do we."
  "Vigilance is strength."
  "A clean dojo is a victorious dojo."
  "Patrol complete. More tasks await."
  "Ready for the next battle."
)

# Miyagi Quotes
declare -a MIYAGI_STARTUP=(
  "Wax on, wax off."
  "First learn walk, then learn run."
  "Balance is not a place. It is a way of life."
  "Walk on road. Always walk on road."
  "Peace be with you, my friend."
)

declare -a MIYAGI_VICTORY=(
  "'First learn walk, then learn run.' - Victory is yours."
  "Balance in all things. Even victory."
  "The student has surpassed the master."
  "Jewel has many facets. This is a big one."
  "Peace be with you. You earned it."
)

declare -a MIYAGI_DEFEAT=(
  "Defeat is a lesson. Learn it well."
  "The best mistake is the one you learn from."
  "Face defeat with open mind."
  "Nothing is like it seems. Try again."
  "Jewel has many facets. This is just one."
)

declare -a MIYAGI_WISDOM=(
  "Wax on, wax off."
  "First learn walk, then learn run."
  "Balance is not a place. It is a way of life."
  "Walk on road. Always walk on road."
  "Face opponent with open mind."
  "Nothing is like it seems. Do not believe nose."
  "Peace be with you, my friend."
  "For you, strike first, strike hard—no mercy. For me, always peace."
  "Jewel has many facets. One facet give whole jewel."
  "The best mistake is the one you learn from."
)

# Get random quote
get_quote() {
  local arr_name="$1[@]"
  local arr=("${!arr_name}")
  echo "${arr[$((RANDOM % ${#arr[@]}))]}"
}

# Get quote based on context and mode
get_context_quote() {
  local context="$1"
  local mode="$2"
  
  if [ "$mode" = "miyagi" ]; then
    case "$context" in
      startup)   quote="${MIYAGI_STARTUP[$((RANDOM % ${#MIYAGI_STARTUP[@]}))]}" ;;
      victory)   quote="${MIYAGI_VICTORY[$((RANDOM % ${#MIYAGI_VICTORY[@]}))]}" ;;
      defeat)    quote="${MIYAGI_DEFEAT[$((RANDOM % ${#MIYAGI_DEFEAT[@]}))]}" ;;
      patrol)    quote="${MIYAGI_STARTUP[$((RANDOM % ${#MIYAGI_STARTUP[@]}))]}" ;;
      wisdom)    quote="${MIYAGI_WISDOM[$((RANDOM % ${#MIYAGI_WISDOM[@]}))]}" ;;
      *)         quote="${MIYAGI_STARTUP[$((RANDOM % ${#MIYAGI_STARTUP[@]}))]}" ;;
    esac
  elif [ "$mode" = "cobra" ]; then
    case "$context" in
      startup)   quote="${COBRA_STARTUP[$((RANDOM % ${#COBRA_STARTUP[@]}))]}" ;;
      victory)   quote="${COBRA_VICTORY[$((RANDOM % ${#COBRA_VICTORY[@]}))]}" ;;
      defeat)    quote="${COBRA_DEFEAT[$((RANDOM % ${#COBRA_DEFEAT[@]}))]}" ;;
      strike)    quote="${COBRA_STRIKE[$((RANDOM % ${#COBRA_STRIKE[@]}))]}" ;;
      patrol)    quote="${COBRA_PATROL[$((RANDOM % ${#COBRA_PATROL[@]}))]}" ;;
      *)         quote="${COBRA_STARTUP[$((RANDOM % ${#COBRA_STARTUP[@]}))]}" ;;
    esac
  else
    # Adaptive - mix both
    if [ $((RANDOM % 2)) -eq 0 ]; then
      quote="${MIYAGI_STARTUP[$((RANDOM % ${#MIYAGI_STARTUP[@]}))]}"
    else
      quote="${COBRA_STARTUP[$((RANDOM % ${#COBRA_STARTUP[@]}))]}"
    fi
  fi
  
  echo "$quote"
}

# Print quote with borders
print_quote() {
  local quote="$1"
  local type="$2"
  
  if [ "$type" = "miyagi" ]; then
    echo ""
    echo "     ╔═══════════════════════════════════════╗"
    echo "     ║ 🥋 $quote"
    echo "     ╚═══════════════════════════════════════╝"
    echo ""
  else
    echo ""
    echo "╔═══════════════════════════════════════╗"
    echo "║ $quote"
    echo "╚═══════════════════════════════════════╝"
    echo ""
  fi
}

# Main
quote=$(get_context_quote "$CONTEXT" "$MODE")

case "$MODE" in
  miyagi)   print_quote "$quote" "miyagi" ;;
  cobra)    print_quote "$quote" "cobra" ;;
  adaptive) print_quote "$quote" "cobra" ;;
  *)        print_quote "$quote" "adaptive" ;;
esac
