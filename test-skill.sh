#!/bin/bash
# COBRACLAW TEST SUITE
# Verify the dojo is ready for training

VERBOSE=false

for arg in "$@"; do
  case $arg in
    --verbose)
      VERBOSE=true
      ;;
  esac
done

log() {
  if [ "$VERBOSE" = true ]; then
    echo "  $1"
  fi
}

PASS=0
TESTS=0

count_test() {
    TESTS=$((TESTS+1))
    if eval "$1"; then
        PASS=$((PASS+1))
        log "OK $2"
    else
        log "FAIL $2"
    fi
}

echo "COBRACLAW Tests"
echo "=================================="

# Core files
count_test "[ -f SKILL.md ]" "SKILL.md exists"

# Scripts
count_test "[ -f test-skill.sh ]" "test-skill.sh exists"
count_test "[ -f patrol.sh ]" "patrol.sh exists"
count_test "[ -f cobra-mode.sh ]" "cobra-mode.sh exists"
count_test "[ -f trophies.sh ]" "trophies.sh exists"
count_test "[ -f quotes.sh ]" "quotes.sh exists"
count_test "[ -f cobraclaw ]" "CLI (cobraclaw) exists"

# Katas
count_test "[ -x katas/strike-first.sh ]" "kata: strike-first.sh"
count_test "[ -x katas/hard-shell.sh ]" "kata: hard-shell.sh"
count_test "[ -x katas/cobra-strike.sh ]" "kata: cobra-strike.sh"
count_test "[ -x katas/no-mercy.sh ]" "kata: no-mercy.sh"
count_test "[ -x katas/evolve.sh ]" "kata: evolve.sh"
count_test "[ -x katas/wax-on-wax-off.sh ]" "kata: wax-on-wax-off.sh"
count_test "[ -x katas/sweep-the-leg.sh ]" "kata: sweep-the-leg.sh"

# Scrolls
count_test "[ -f scrolls/doctrine-quick-ref.md ]" "scroll: doctrine-quick-ref.md"
count_test "[ -f scrolls/pillars-reference.md ]" "scroll: pillars-reference.md"
count_test "[ -f scrolls/patterns-lookup.md ]" "scroll: patterns-lookup.md"
count_test "[ -f scrolls/quotes-collection.md ]" "scroll: quotes-collection.md"
count_test "[ -f scrolls/victories.md ]" "scroll: victories.md"

echo "=================================="
echo "$PASS / $TESTS passed"
echo ""

if [ $PASS -eq $TESTS ]; then
    echo "All tests pass."
    exit 0
else
    echo "Some tests failed."
    exit 1
fi
