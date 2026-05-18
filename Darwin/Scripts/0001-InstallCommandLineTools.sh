#!/bin/sh

xcode-select -p >/dev/null 2>&1 && exit 0
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
LABEL="$(softwareupdate -l | grep '^\* Label: Command Line Tools' | sed -e 's/\* Label: //')"
test -n "$LABEL" && softwareupdate -i "$LABEL"
exit $?
