#!/bin/bash
# Track emoji usage - build user's fingerprint over time

USAGE_DIR="$HOME/.shell-claw-usage"
USAGE_FILE="$USAGE_DIR/emoji-usage.txt"
METADATA_FILE="$USAGE_DIR/metadata.json"

# Create directory if needed
mkdir -p "$USAGE_DIR"

# Create files if don't exist
[ ! -f "$USAGE_FILE" ] && touch "$USAGE_FILE"
[ ! -f "$METADATA_FILE" ] && echo '{"created": "'"$(date +%Y-%m-%d)"'", "last_updated": "'"$(date +%Y-%m-%d)"'"}' > "$METADATA_FILE"

EMOJI="$1"
CONTEXT="$2"

if [ -z "$EMOJI" ]; then
    echo "Usage: track-emoji-usage.sh [emoji] [context]"
    exit 1
fi

# Append emoji + optional context
if [ -n "$CONTEXT" ]; then
    echo "$EMOJI|$CONTEXT|$(date +%Y-%m-%d)" >> "$USAGE_FILE"
else
    echo "$EMOJI|unknown|$(date +%Y-%m-%d)" >> "$USAGE_FILE"
fi

# Update metadata
sed -i "s/\"last_updated\": \"[^\"]*\"/\"last_updated\": \"$(date +%Y-%m-%d)\"/" "$METADATA_FILE" 2>/dev/null || \
echo '{"created": "'"$(date +%Y-%m-%d)"'", "last_updated": "'"$(date +%Y-%m-%d)"'"}' > "$METADATA_FILE"

echo "✅ Tracked: $EMOJI"
