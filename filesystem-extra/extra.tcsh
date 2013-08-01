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
if ( ! $?GI_TYPELIB_PATH ) then
  setenv GI_TYPELIB_PATH $EXTRADIR/usr/lib/girepository-1.0
else
  export GI_TYPELIB_PATH $GI_TYPELIB_PATH:$EXTRADIR/usr/lib/girepository-1.0
fi
