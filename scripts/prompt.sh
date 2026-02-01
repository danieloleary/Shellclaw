#!/bin/bash
# Show Shell Claw prompts

if [ "$1" = "--list" ]; then
    echo "SHELL CLAW PROMPT LIBRARY"
    echo "========================="
    echo ""
    grep "^## " PROMPTS.md | sed 's/^## /- /'
    echo ""
    echo "Use: ./prompt.sh [number] or ./prompt.sh --random"
    exit 0
fi

# Count prompts
TOTAL=$(grep -c "^## [0-9]" PROMPTS.md)

if [ -z "$1" ] || [ "$1" = "--random" ]; then
    NUM=$((RANDOM % TOTAL + 1))
else
    NUM="$1"
fi

# Extract specific prompt
START=$(grep -n "^## $NUM" PROMPTS.md | cut -d: -f1)
if [ -z "$START" ]; then
    echo "Prompt $NUM not found. Use --list to see all."
    exit 1
fi

# Get next prompt start or end of file
NEXT_NUM=$((NUM + 1))
NEXT_START=$(grep -n "^## $NEXT_NUM" PROMPTS.md | cut -d: -f1)
if [ -z "$NEXT_START" ]; then
        END=$(wc -l < PROMPTS.md)
    else
        END=$((NEXT_START - 1))
    fi

sed -n "${START},${END}p" PROMPTS.md
