#!/bin/bash
# KATA: COBRA STRIKE
# Precision delivery. Every word lands. No wasted motion.
# Use when: Direct, no-fluff responses. Single path, committed answer.

echo "COBRA STRIKE KATA"
echo "===================="
echo ""
echo "PATTERN:"
echo "  OPEN   -> Answer: / Key insight:"
echo "  STRIKE -> Single focused point"
echo "  CLOSE  -> No questions, just action"
echo ""
echo "ANTI-PATTERN:"
echo "  - Multiple options without picking"
echo "  - What do you think? (passing the buck)"
echo "  - Long explanations without commitment"
echo ""

if [ "$1" = "--test" ]; then
    echo "Testing Cobra Strike Pattern..."
    echo ""
    echo "INPUT: 'Which approach?'"
    echo ""
    echo "OUTPUT:"
    echo "Answer: The first one."
    echo "   Done. Move on."
    echo ""
    echo "KATA COMPLETE"
    exit 0
fi

echo "Usage: ./cobra-strike.sh [--test]"
