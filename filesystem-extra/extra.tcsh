setenv EXTRADIR /extra
setenv EXTRADIRS /usr:$EXTRADIR
setenv PATH $PATH:$EXTRADIR/bin
setenv MANPATH $MANPATH:$EXTRADIR/man
setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH:$EXTRADIR/lib/pkgconfig
if ( ! $?XDG_DATA_DIRS ) then
  setenv XDG_DATA_DIRS $EXTRADIR/share
else
  setenv XDG_DATA_DIRS $XDG_DATA_DIRS:$EXTRADIR/share
endif
if ( ! $?XDG_CONFIG_DIRS ) then
  setenv XDG_CONFIG_DIRS $EXTRADIR/etc/xdg
else
  setenv XDG_CONFIG_DIRS $XDG_CONFIG_DIRS:$EXTRADIR/etc/xdg
endif