# Include this script from /etc/chromium-browser/default to enable
# the Adobe/Google Pepper Flash plugin.

FLASH_VERSION=@FLASH_VERSION@

CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ppapi-flash-path=/usr/lib/pepperflash/libpepflashplayer.so --ppapi-flash-version=$FLASH_VERSION"
