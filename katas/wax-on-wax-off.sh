#!/bin/bash
# KATA: WAX ON / WAX OFF
# Practice makes perfect. Miyagi's way.

echo "WAX ON / WAX OFF"
echo "===================="

WAX_MODE="${1:-on}"

if [ "$WAX_MODE" = "--wax-on" ] || [ "$WAX_MODE" = "on" ]; then
    echo ""
    echo "WAX ON..."
    echo "   Paint the fence. Again. Again."
    echo ""
    echo "The more you repeat, the better you get."
    echo "Simple movements. Perfect them."
    echo ""
    echo "Wax on, wax off. - Mr. Miyagi"
    echo ""
    echo "Practice:"
    echo "  1. Read the pattern"
    echo "  2. Apply the pattern"  
    echo "  3. Repeat"
    echo ""
    echo "After 1000 reps, it's instinct."
elif [ "$WAX_MODE" = "--wax-off" ] || [ "$WAX_MODE" = "off" ]; then
    echo ""
    echo "WAX OFF..."
    echo "   Remove the wax. See the shine."
    echo ""
    echo "What you learned:"
    echo "  - Strike first"
    echo "  - Strike hard"
    echo "  - No mercy"
    echo ""
    echo "Now apply it. Without thinking."
    echo ""
    echo "Best fighter doesn't win. Fighter who never gives up. - Mr. Miyagi"
else
    echo "Usage: $0 [on|off]"
    echo "  on  - Wax on (practice mode)"
    echo "  off - Wax off (apply mode)"
fi
