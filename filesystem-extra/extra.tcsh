setenv EXTRADIR /extra
setenv EXTRADIRS /usr:$EXTRADIR/usr
setenv PATH $PATH:$EXTRADIR/usr/bin
setenv MANPATH $MANPATH:$EXTRADIR/usr/man
setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH:$EXTRADIR/usr/lib/pkgconfig
if ( ! $?XDG_DATA_DIRS ) then
  setenv XDG_DATA_DIRS $EXTRADIR/usr/share
else
  setenv XDG_DATA_DIRS $XDG_DATA_DIRS:$EXTRADIR/usr/share
endif
if ( ! $?XDG_CONFIG_DIRS ) then
  setenv XDG_CONFIG_DIRS $EXTRADIR/etc/xdg
else
  setenv XDG_CONFIG_DIRS $XDG_CONFIG_DIRS:$EXTRADIR/etc/xdg
endif
if ( ! $?PYTHONPATH ) then
  setenv PYTHONPATH $EXTRADIR/usr/lib/python2.7/site-packages:$EXTRADIR/usr/lib/python2.7/site-packages/gtk-2.0
else
  setenv PYTHONPATH $PYTHONPATH:$EXTRADIR/usr/lib/python2.7/site-packages:$EXTRADIR/usr/lib/python2.7/site-packages/gtk-2.0
endif
