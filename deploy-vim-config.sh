#!/usr/bin/env sh
echo $'Removing existing .vimrc'
rm ~/.vimrc
echo $'Removing existing .vim/'
rm -rf ~/.vim
echo $'Copying new .vimrc'
cp .vimrc ~
echo $'Copying new .vim/'
cp -r .vim ~
echo $'Installing Vundle (see http://github.com/gmarik/vundle for more details'
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo $'To install rest of vim plugins enter :BundleList in Vim'
echo $'And then press '"'"'i'"'"' on the line of each plugin you are interested in'
