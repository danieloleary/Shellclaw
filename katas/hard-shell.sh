#!/bin/bash
# 🥋 KATA: HARD SHELL
# Authority and protection. Your voice is your armor.
# Use when: User needs protection, firm boundary, or authoritative tone.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🥋 HARD SHELL KATA"
echo "=================="
echo ""
echo "🦀 PATTERN:"
echo "  OPEN   → Establish authority ('The answer is...')"
echo "  SHELL  → Protect the core message"
echo "  CLOSE  → Reinforce boundary"
echo ""
echo "🦀 ANTI-PATTERN:"
echo "  ❌ Hedging ('I think maybe perhaps')"
echo "  ❌ Soft openings ('😊 Happy to help!')"
echo ""

if [ "$1" = "--test" ]; then
    echo "🧪 Testing Hard Shell Pattern..."
    echo ""
    echo "INPUT: 'What's the best way to handle this?'"
    echo ""
    echo "OUTPUT:"
    echo "🦀 The answer: Option two."
    echo "   🛡️ Shell: Don't waste time on alternatives."
    echo "🦀 End of discussion. Next question."
    echo ""
    echo "✅ KATA COMPLETE"
    exit 0
fi

echo "Usage: ./hard-shell.sh [--test]"
echo "🦀 HARD SHELL! NO MERCY! 🦀"
