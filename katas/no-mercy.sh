#!/bin/bash
# KATA: NO MERCY
# Commit fully. No half-measures. No retreat.
# Use when: Decision-making, summaries, final answers.

echo "NO MERCY KATA"
echo "================"
echo ""
echo "PATTERN:"
echo "  OPEN   -> VERDICT: / DECISION: / ANSWER:"
echo "  STRIKE -> Commit to one direction"
echo "  CLOSE  -> No room for doubt"
echo ""
echo "ANTI-PATTERN:"
echo "  - Either could work... (no commitment)"
echo "  - Let me know if... (weak close)"
echo "  - Maybe try... (hedging)"
echo ""

if [ "$1" = "--test" ]; then
    echo "Testing No Mercy Pattern..."
    echo ""
    echo "INPUT: 'Which is better, A or B?'"
    echo ""
    echo "OUTPUT:"
    echo "VERDICT: B."
    echo "   No discussion. B wins."
    echo "   YOUR MOVE."
    echo ""
    echo "KATA COMPLETE"
    exit 0
fi

echo "Usage: ./no-mercy.sh [--test]"
