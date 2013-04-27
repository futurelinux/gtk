#!/bin/sh

export GTK_PATH=${PWD}/usr/lib/gtk-2.0/

${PWD}/usr/bin/gtk-query-immodules-2.0 > /tmp/firefox.gtk.immodules
export GTK_IM_MODULE_FILE=/tmp/firefox.gtk.immodules

exec ${PWD}/opt/firefox/firefox "$@"
