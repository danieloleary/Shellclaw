#!/bin/bash
PASS=0
TESTS=0

count_test() {
    TESTS=$((TESTS+1))
    if eval "$1"; then
        PASS=$((PASS+1))
    fi
}

echo "🦀 Shell Claw - 29 tests"
echo "=================================="

# emoji-lookup.sh (10 tests)
count_test "bash scripts/emoji-lookup.sh 'idea' | grep -q '💡'"
count_test "bash scripts/emoji-lookup.sh 'happy' | grep -q '😊'"
count_test "bash scripts/emoji-lookup.sh 'thinking' | grep -q '🤔'"
count_test "bash scripts/emoji-lookup.sh 'done' | grep -q '✅'"
count_test "bash scripts/emoji-lookup.sh 'thanks' | grep -q '🙏'"
count_test "bash scripts/emoji-lookup.sh 'work' | grep -q '💼'"
count_test "bash scripts/emoji-lookup.sh 'target' | grep -q '🎯'"
count_test "bash scripts/emoji-lookup.sh 'coding' | grep -q '💻'"
count_test "bash scripts/emoji-lookup.sh 'search' | grep -q '🔍'"
count_test "bash scripts/emoji-lookup.sh 'launch' | grep -q '🚀'"

# emoji-suggest.sh (5 tests)
count_test "bash scripts/emoji-suggest.sh 'happy excited' | grep -q '😊 🙌 🎉'"
count_test "bash scripts/emoji-suggest.sh 'thinking problem' | grep -q '🤔 💭 🧠'"
count_test "bash scripts/emoji-suggest.sh 'great idea' | grep -q '💡 ✨ 🎯'"
count_test "bash scripts/emoji-suggest.sh 'bug code' | grep -q '🔧 🐛 🤔'"
count_test "bash scripts/emoji-suggest.sh 'thank you' | grep -q '🙏 ❤️ 💚'"

# analyze-context.sh (5 tests)
count_test "bash scripts/analyze-context.sh 'congrats on the win' | grep -q 'celebration'"
count_test "bash scripts/analyze-context.sh 'project deadline' | grep -q 'professional'"
count_test "bash scripts/analyze-context.sh 'how does this work' | grep -q 'learning'"
count_test "bash scripts/analyze-context.sh 'bug in production' | grep -q 'problem'"
count_test "bash scripts/analyze-context.sh 'thanks for help' | grep -q 'personal'"

# Phase 2: fingerprint system (4 tests)
bash scripts/track-emoji-usage.sh "💡" "test" >/dev/null 2>&1
count_test "[ -f $HOME/.shell-claw-usage/emoji-usage.txt ]"

bash scripts/build-fingerprint.sh >/dev/null 2>&1
count_test "[ -f $HOME/.shell-claw-usage/fingerprint.json ]"

count_test "grep -q 'most_used_emoji' $HOME/.shell-claw-usage/fingerprint.json"
count_test "grep -q 'emoji_variety' $HOME/.shell-claw-usage/fingerprint.json"

# generate-dictionary.sh (3 tests)
bash scripts/generate-dictionary.sh /tmp/test-dict.md >/dev/null 2>&1
count_test "[ -f /tmp/test-dict.md ]"
count_test "grep -q 'My Personal Emoji Dictionary' /tmp/test-dict.md"
count_test "grep -q 'Shell Claw Structure' /tmp/test-dict.md"
rm -f /tmp/test-dict.md

echo "=================================="
echo "🦀 $PASS / $TESTS passed"
echo ""

[ $PASS -eq $TESTS ] && echo "✅ All tests pass" && exit 0 || echo "❌ Some failed" && exit 1
