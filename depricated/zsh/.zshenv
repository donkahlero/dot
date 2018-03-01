export EDITOR=vim
export COLORTERM=truecolor
export TERM=xterm-kitty
export CPATH=$CPATH:"/usr/include/hdf5/serial/"

# macOS specific
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
    PATH=$PATH:/Applications/kitty.app/Contents/MacOS:/usr/local/go/bin
fi
