export EXTRADIR=/extra
export EXTRADIRS=$EXTRADIR/usr:/usr
export PATH=$PATH:$EXTRADIR/usr/bin 
export MANPATH=$MANPATH:$EXTRADIR/usr/man 
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$EXTRADIR/usr/lib/pkgconfig
if [ ! -z $XDG_DATA_DIRS ]; then 
  export XDG_DATA_DIRS=$XDG_DATA_DIRS:$EXTRADIR/usr/share 
else 
  export XDG_DATA_DIRS=$EXTRADIR/usr/share 
fi 
if [ ! -z $XDG_CONFIG_DIRS ]; then 
  export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$EXTRADIR/etc/xdg 
else 
  export XDG_CONFIG_DIRS=$EXTRADIR/etc/xdg 
fi

