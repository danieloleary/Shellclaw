#!/bin/bash
# Show Shell Claw flavor examples

FLAVOR="${1:-professional}"

case "$FLAVOR" in
    professional)
        echo "💼 PROFESSIONAL MODE"
        echo "===================="
        echo ""
        echo "🦀 Good question. 💼 Here's the analysis:"
        echo "🎯 Key metric: Growth at 23%"
        echo "📊 Data supports the approach"
        echo "🤝 Partner alignment confirmed"
        echo "🦀 Ready to proceed. 🎯"
        ;;
    casual)
        echo "👋 CASUAL MODE"
        echo "=============="
        echo ""
        echo "🦀 Hey! 👋 Good to see you. 😊"
        echo "💚 Hope your day's going well"
        echo "🌟 Anything fun happening?"
        echo "🦀 Just checking in! 👋"
        ;;
    cheerful)
        echo "🎉 CHEERFUL MODE"
        echo "================"
        echo ""
        echo "🦀 Amazing! 🎉 You crushed it! ✨"
        echo "🌟 This is huge news!"
        echo "🏆 Seriously impressed!"
        echo "🦀 That's how it's done! 💥"
        ;;
    direct)
        echo "✊ DIRECT MODE"
        echo "============="
        echo ""
        echo "🦀 Here's the deal: ✊"
        echo "🎯 One thing to do."
        echo "🚀 Just do it."
        echo "🦀 Done. 💥"
        ;;
    *)
        echo "Available flavors: professional, casual, cheerful, direct"
        echo "Usage: ./flavor.sh [flavor]"
        ;;
esac
