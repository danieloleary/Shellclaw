#!/bin/bash
# Analyze usage data and build user's emoji fingerprint

USAGE_FILE="$HOME/.shell-claw-usage/emoji-usage.txt"
OUTPUT_FILE="$HOME/.shell-claw-usage/fingerprint.json"

if [ ! -f "$USAGE_FILE" ]; then
    echo "⚠️ No usage data yet. Use track-emoji-usage.sh first."
    exit 0
fi

TOTAL=$(wc -l < "$USAGE_FILE" | tr -d ' ')
UNIQUE=$(awk -F'|' '{print $1}' "$USAGE_FILE" | sort -u | wc -l | tr -d ' ')
MOST_USED=$(awk -F'|' '{print $1}' "$USAGE_FILE" | sort | uniq -c | sort -rn | head -1 | sed 's/.* //')
MOST_COUNT=$(awk -F'|' '{print $1}' "$USAGE_FILE" | sort | uniq -c | sort -rn | head -1 | awk '{print $1}')

echo "🦀 Your Emoji Fingerprint"
echo "========================="
echo "Total emoji uses: $TOTAL"
echo "Unique emojis: $UNIQUE"
echo "Most used: $MOST_USED ($MOST_COUNT times)"
echo ""
echo "Top emojis:"
awk -F'|' '{print $1}' "$USAGE_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print "  " $2 ": " $1}'
echo ""
echo "✅ Fingerprint saved"

# Build valid JSON using Python for reliability
python3 << EOF
import json

counts = {}
with open("$USAGE_FILE") as f:
    for line in f:
        parts = line.strip().split('|')
        if parts[0]:
            emoji = parts[0]
            counts[emoji] = counts.get(emoji, 0) + 1

total = sum(counts.values())
most_used = max(counts, key=counts.get)
most_count = counts[most_used]
variety = len(counts)

data = {
    "emoji_counts": counts,
    "most_used_emoji": most_used,
    "most_used_count": most_count,
    "emoji_variety": variety,
    "total_uses": total,
    "generated": "$(date +%Y-%m-%d)"
}

with open("$OUTPUT_FILE", "w") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)
EOF
