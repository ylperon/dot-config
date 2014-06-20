#!/usr/bin/env sh

mkdir $HOME/builds

printf "%s" "Building ncurses..."
cd $HOME/builds
wget "ftp://invisible-island.net/ncurses/ncurses.tar.gz"
tar -xzf ncurses.tar.gz
cd ncurses-5.9
./configure --prefix=$HOME/builds
make
make install
printf "%s" "Building ncurses...Done"

printf "%s" "Building vim...Done"
cd $HOME/builds
hg clone https://code.google.com/p/vim/ vim74
cd vim74
export CPPFLAGS="-I$HOME/builds/includes/"
export LDFLAGS="-L$HOME/builds/lib"
./configure --prefix=$HOME/builds \
            --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7-config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 \
            --enable-cscope
make VIMRUNTIMEDIR=$HOME/builds/share/vim/vim74
make install
printf "%s" "Building vim...Done"

printf "\n%s\n" "Now you need to add \$HOME/builds/bin to your \$PATH."
