#!/bin/bash
# Ralph Loop: COBRACLAW DOJO OVERHAUL
# Strike till done. No mercy.

echo "========================================"
echo "  🥋 COBRACLAW DOJO OVERHAUL 🥋"
echo "========================================"
echo ""
echo "Sensei: Dan"
echo "Champion: Teddy 🧸"
echo "Mission: Transform CobraClaw"
echo ""

cd "$(dirname "$0")"

# Check if prd.json exists
if [ ! -f "prd.json" ]; then
    echo "ERROR: prd.json not found!"
    exit 1
fi

# Check if prompt.md exists
if [ ! -f "prompt.md" ]; then
    echo "ERROR: prompt.md not found!"
    exit 1
fi

LOOP_COUNT=0
MAX_LOOPS=50

while [ $LOOP_COUNT -lt $MAX_LOOPS ]; do
    LOOP_COUNT=$((LOOP_COUNT + 1))
    
    echo ""
    echo "========================================"
    echo "  STRIKE #$LOOP_COUNT"
    echo "========================================"
    
    # Check if all stories are done
    DONE_COUNT=$(grep -o '"done": true' prd.json | wc -l)
    TOTAL_STORIES=$(grep -o '"done": false' prd.json | wc -l | awk '{print $1 + '"$DONE_COUNT"'}')
    
    if [ "$DONE_COUNT" -ge 5 ]; then
        echo ""
        echo "========================================"
        echo "  🏆 VICTORY! DOJO COMPLETE! 🏆"
        echo "========================================"
        echo ""
        echo "All 5 stories completed!"
        echo "Run: git push to publish"
        echo ""
        break
    fi
    
    echo "Stories remaining: $(grep -o '"done": false' prd.json | wc -l)"
    echo ""
    echo "👊 SENDING TO CLAUDE CODE... 👊"
    echo ""
    
    # Run Claude Code with prompt.md
    # This uses the coding-agent skill to iterate
    claude-code --prompt prompt.md
    
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -eq 0 ]; then
        echo ""
        echo "✅ Strike completed. Checking status..."
    else
        echo ""
        echo "⚠️ Strike had issues. Checking progress..."
    fi
    
    # Brief pause before next loop
    sleep 2
    
    # Check if commit was made
    RECENT_COMMITS=$(git log --oneline -1 2>/dev/null)
    if [ -n "$RECENT_COMMITS" ]; then
        echo "📝 Latest commit: $RECENT_COMMITS"
    fi
    
done

if [ $LOOP_COUNT -ge $MAX_LOOPS ]; then
    echo ""
    echo "⚠️ MAX LOOPS REACHED"
    echo "Check progress manually."
fi

echo ""
echo "========================================"
echo "  DOJO STATUS"
echo "========================================"
git log --oneline -10
echo ""
echo "To push: git push"
