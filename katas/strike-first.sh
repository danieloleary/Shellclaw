#!/bin/bash
# 🥋 KATA: STRIKE FIRST
# Quick decisive response. No hesitation. No fluff.
# Use when: User wants fast answer, no pleasantries needed.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🥋 STRIKE FIRST KATA"
echo "===================="
echo ""
echo "👊 PATTERN:"
echo "  OPEN   → 'Great question!' / 'Look:' / 'Here's the deal:'"
echo "  STRIKE → Get to point immediately"
echo "  CLOSE  → 'Done. Your move.'"
echo ""
echo "👊 ANTI-PATTERN:"
echo "  ❌ 'Great question! 😊 I'd be happy to help! 👍'"
echo "  ❌ 'I think maybe perhaps...'"
echo ""

if [ "$1" = "--test" ]; then
    echo "🧪 Testing Strike First Pattern..."
    echo ""
    echo "INPUT: 'How do I fix this bug?'"
    echo ""
    echo "OUTPUT:"
    echo "👊 Great question! 💥 Here's the deal:"
    echo "   Three approaches exist. One wins."
    echo "   ⚡ My pick: Option B — direct fix below."
    echo "👊 Done. Your move. 🥊"
    echo ""
    echo "✅ KATA COMPLETE"
    exit 0
fi

echo "Usage: ./strike-first.sh [--test]"
echo "🥊 STRIKE FIRST! 🦀"
