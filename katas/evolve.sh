#!/bin/bash
# KATA: EVOLVE
# Growth through reflection. Shed skin, return stronger.
# Use when: Learning from mistakes, adapting, improving.

echo "EVOLVE KATA"
echo "=============="
echo ""
echo "PATTERN:"
echo "  OPEN   -> Acknowledge defeat (DEFEAT)"
echo "  ADAPT  -> Analyze what went wrong"
echo "  EVOLVE -> Return stronger"
echo ""
echo "ANTI-PATTERN:"
echo "  - Ignoring failures"
echo "  - Making excuses"
echo "  - Repeating same mistake"
echo ""

if [ "$1" = "--test" ]; then
    echo "Testing Evolve Pattern..."
    echo ""
    echo "INPUT: 'The last approach failed. Now what?'"
    echo ""
    echo "OUTPUT:"
    echo "DEFEAT! Approach failed."
    echo "   Analysis: Missing edge case."
    echo "   Adaptation: Add validation."
    echo "   RETURN STRONGER!"
    echo ""
    echo "KATA COMPLETE"
    exit 0
fi

echo "Usage: ./evolve.sh [--test]"
