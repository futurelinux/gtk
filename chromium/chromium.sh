#!/bin/bash

# Override command-line options
# Based on Gentoo's chromium package (and by extension, Debian's)
if [[ -f /extra/etc/chromium/default ]]; then
	. /extra/etc/chromium/default
fi

# Prefer user defined CHROMIUM_USER_FLAGS (from env) over system
# default CHROMIUM_FLAGS (from /etc/chromium/default)
CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-$CHROMIUM_FLAGS}


export CHROME_WRAPPER=$(readlink -f "$0")
export CHROME_DESKTOP=chromium.desktop

exec /extra/usr/lib/chromium/chromium $CHROMIUM_FLAGS "$@"

