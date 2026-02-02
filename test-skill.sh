#!/bin/bash
# 🥋 COBRACLAW TEST SUITE
# Verify the dojo is ready for training

WAX_ON=false
VERBOSE=false

# Parse --wax-on for verbose output
for arg in "$@"; do
  case $arg in
    --wax-on)
      WAX_ON=true
      VERBOSE=true
      ;;
    --verbose)
      VERBOSE=true
      ;;
  esac
done

log() {
  if [ "$VERBOSE" = true ]; then
    echo "🥋 $1"
  fi
}

PASS=0
TESTS=0

count_test() {
    TESTS=$((TESTS+1))
    if eval "$1"; then
        PASS=$((PASS+1))
        log "  ✅ $2"
    else
        log "  ❌ $2"
    fi
}

echo "🥋 Cobra Claw Tests"
echo "=================================="

# Core files
count_test "[ -f README.md ]" "README.md exists"
count_test "[ -f ARCHITECTURE.md ]" "ARCHITECTURE.md exists"
count_test "[ -f creed.yaml ]" "creed.yaml exists"
count_test "[ -f dojo-functions.js ]" "dojo-functions.js exists"

# QMD System (new)
count_test "[ -f TROPHIES.qmd ]" "TROPHIES.qmd exists"
count_test "[ -f MIYAGI-MODE.qmd ]" "MIYAGI-MODE.qmd exists"
count_test "[ -f PREEMPTIVE-STRIKES.qmd ]" "PREEMPTIVE-STRIKES.qmd exists"
count_test "[ -f QUOTES.qmd ]" "QUOTES.qmd exists"

# Scripts
count_test "[ -f test-skill.sh ]" "test-skill.sh exists"
count_test "[ -f patrol.sh ]" "patrol.sh exists"
count_test "[ -f cobra-mode.sh ]" "cobra-mode.sh exists"
count_test "[ -f trophies.sh ]" "trophies.sh exists"
count_test "[ -f quotes.sh ]" "quotes.sh exists"

echo "=================================="
echo "🥋 $PASS / $TESTS passed"
echo ""

if [ $PASS -eq $TESTS ]; then
    echo "✅ All tests pass — Strike first."
    exit 0
else
    echo "❌ Some failed — Strike harder."
    exit 1
fi
