#!/bin/sh

FISH="$(brew --prefix)/bin/fish"
test -x "$FISH" || HOMEBREW_ASK='' HOMEBREW_DISPLAY_INSTALL_TIMES='' HOMEBREW_NO_INSTALL_CLEANUP=1 brew install fish >/dev/null 2>&1 || exit 1
test -x "$FISH" || exit 1
grep -Fqx "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells >/dev/null || exit 1
sudo chpass -s "$FISH" "$(id -nu)" 2>/dev/null
exit $?
