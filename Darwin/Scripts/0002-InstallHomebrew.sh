#!/bin/sh

command -v brew >/dev/null 2>&1 && exit 0
curl -H 'Accept: application/vnd.github+json' -Ls https://api.github.com/repos/Homebrew/brew/releases/latest | perl -e 'print "$1\n" if /"browser_download_url":\s*"([^"]+\.pkg)"/' -n | xargs curl -Lo "$TMPDIR/Homebrew.pkg"
test -f "$TMPDIR/Homebrew.pkg" && sudo installer -pkg "$TMPDIR/Homebrew.pkg" -target /
RET=$?
rm -f "$TMPDIR/Homebrew.pkg"
exit $RET
