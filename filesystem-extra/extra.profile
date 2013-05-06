export EXTRADIR=/extra
export PATH=$PATH:$EXTRADIR/usr/bin 
export MANPATH=$MANPATH:$EXTRADIR/usr/man 
if [ ! -z $PKG_CONFIG_PATH ]; then
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$EXTRADIR/usr/lib/pkgconfig
else
  export PKG_CONFIG_PATH=$EXTRADIR/usr/lib/pkgconfig
fi 
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
if [ ! -z $PYTHONPATH ]; then
  export PYTHONPATH=$PYTHONPATH:$EXTRADIR/usr/lib/python2.7/site-packages:$EXTRADIR/usr/lib/python2.7/site-packages/gtk-2.0
else
  export PYTHONPATH=$EXTRADIR/usr/lib/python2.7/site-packages:$EXTRADIR/usr/lib/python2.7/site-packages/gtk-2.0
fi
