#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "%s" "Creating directory for old vimconfig..."
if [ -d $HOME/old-vim-config ]; then
    rm -rf $HOME/old-vim-config
fi
mkdir $HOME/old-vim-config
printf "%s\n" "Done"
printf "%s\n" "Old config will be stored in $HOME/old-vim-config"

printf "%s" "Copying old config..."
if [ -a $HOME/.vimrc ]; then
    cp $HOME/.vimrc $HOME/old-vim-config
fi
if [ -d $HOME/.vim ]; then
    cp -r $HOME/.vim $HOME/old-vim-config
fi
printf "%s\n" "Done"

if [ -a $HOME/.vimrc ]; then
    printf "%s" "Removing existing .vimrc..."
    rm $HOME/.vimrc
    printf "%s\n" "Done"
fi

if [ -d $HOME/.vim ]; then 
    printf "%s" "Removing existing .vim directory..."
    rm -rf $HOME/.vim
    printf "%s\n" "Done"
fi

printf "%s" "Copying new .vimrc..."
cp $DIR/vimrc.vim $HOME/.vimrc
printf "%s\n" "Done"

printf "%s\n" "Configuring vim..."
printf "%s\n" "Installing plugins..."
vim +PluginInstall +qall
printf "%s\n" "Installing plugins...Done"

printf "%s\n" "Installing YouCompleteMe completer..."
cd $HOME/.vim/bundle/YouCompleteMe/
./install.sh --clang-completer
printf "%s\n" "Installing YouCompleteMe completer...Done"

printf "%s" "Copying default YouCompleteMe config..."
cp $DIR/ycm_default_conf.py $HOME/.vim
printf "%s\n" "Done"
printf "%s\n" "Configuring vim...Done"

unset DIR
