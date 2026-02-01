#!/bin/bash
# Suggest emojis based on user's fingerprint + context

FINGERPRINT="$HOME/.shell-claw-usage/fingerprint.json"
CONTEXT="$1"

if [ ! -f "$FINGERPRINT" ]; then
    bash scripts/suggest-for-context.sh "$CONTEXT"
    exit 0
fi

# Get most used emoji
MOST_USED=$(python3 -c "import json; d=json.load(open('$FINGERPRINT')); print(d.get('most_used_emoji',''))")
VARIETY=$(python3 -c "import json; d=json.load(open('$FINGERPRINT')); print(d.get('emoji_variety',0))")

if [ -z "$MOST_USED" ]; then
    bash scripts/suggest-for-context.sh "$CONTEXT"
    exit 0
fi

# Get context-based suggestions
CONTEXT_EMOJIS=$(bash scripts/suggest-for-context.sh "$CONTEXT")

# Mix user's top emoji with context suggestions
echo "🎯 Context suggestions: $CONTEXT_EMOJIS"
echo "💎 Your style: $MOST_USED"
echo ""
echo "🧡 Suggested combo: $MOST_USED $CONTEXT_EMOJIS"

# If variety is low, encourage exploration
if [ "$VARIETY" -lt 5 ]; then
    echo ""
    echo "💡 Tip: Try new emojis to grow your voice!"
fi
