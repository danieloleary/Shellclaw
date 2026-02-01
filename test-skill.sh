#!/bin/bash
PASS=0

echo "🦀 Shell Claw Skill - Test Suite"
echo "=================================="

echo ""
echo "🧪 Running tests..."

# Test emoji-lookup.sh
echo ""
echo "📦 Testing: emoji-lookup.sh"
bash scripts/emoji-lookup.sh "idea" | grep -q "💡" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "happy" | grep -q "😊" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "thinking" | grep -q "🤔" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "done" | grep -q "✅" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "thanks" | grep -q "🙏" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "work" | grep -q "💼" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "target" | grep -q "🎯" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "coding" | grep -q "💻" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "search" | grep -q "🔍" && PASS=$((PASS+1))
bash scripts/emoji-lookup.sh "launch" | grep -q "🚀" && PASS=$((PASS+1))

# Test emoji-suggest.sh
echo ""
echo "🌊 Testing: emoji-suggest.sh"
bash scripts/emoji-suggest.sh "happy excited" | grep -q "😊 🙌 🎉" && PASS=$((PASS+1))
bash scripts/emoji-suggest.sh "thinking problem" | grep -q "🤔 💭 🧠" && PASS=$((PASS+1))
bash scripts/emoji-suggest.sh "great idea" | grep -q "💡 ✨ 🎯" && PASS=$((PASS+1))
bash scripts/emoji-suggest.sh "bug code" | grep -q "🔧 🐛 🤔" && PASS=$((PASS+1))
bash scripts/emoji-suggest.sh "thank you" | grep -q "🙏 ❤️ 💚" && PASS=$((PASS+1))

# Test generate-dictionary.sh
echo ""
echo "📋 Testing: generate-dictionary.sh"
bash scripts/generate-dictionary.sh /tmp/test-dict.md >/dev/null 2>&1
[ -f /tmp/test-dict.md ] && PASS=$((PASS+1))
grep -q "My Personal Emoji Dictionary" /tmp/test-dict.md 2>/dev/null && PASS=$((PASS+1))
rm -f /tmp/test-dict.md

echo ""
echo "=================================="
echo "🦀 Test Results: $PASS passed"
echo ""

if [ $PASS -eq 17 ]; then
    echo "🎉 All tests passed! Snap into emojis. 💥"
    exit 0
else
    echo "💥 Some tests failed. Shell Claw is not pleased."
    exit 1
fi
