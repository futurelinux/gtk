export EXTRADIR=/extra 
export EXTRADIRS=$EXTRADIR:/usr
export PATH=$PATH:$EXTRADIR/bin 
export MANPATH=$MANPATH:$EXTRADIR/man 
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$EXTRADIR/lib/pkgconfig
if [ ! -z $XDG_DATA_DIRS ]; then 
  export XDG_DATA_DIRS=$XDG_DATA_DIRS:$EXTRADIR/share 
else 
  export XDG_DATA_DIRS=$EXTRADIR/share 
fi 
if [ ! -z $XDG_CONFIG_DIRS ]; then 
  export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$EXTRADIR/etc/xdg 
else 
  export XDG_CONFIG_DIRS=$EXTRADIR/etc/xdg 
fi
