#!/bin/sh

FISH="$(brew --prefix)/bin/fish"
test -x "$FISH" || HOMEBREW_ASK= HOMEBREW_DISPLAY_INSTALL_TIMES= HOMEBREW_NO_INSTALL_CLEANUP=1 brew install -q fish || exit 1
test -x "$FISH" || exit 1
grep -Fqx "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells >/dev/null || exit 1
chpass -s "$FISH" 2>/dev/null
exit $?
