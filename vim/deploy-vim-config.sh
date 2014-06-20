#!/usr/bin/env sh

THIS_DIRECTORY=$(pwd)

printf "%s" "Creating directory for old vimconfig..."
mkdir $HOME/old-vim-config
printf "%s\n" "Done"
printf "%s\n" "Old config will be stored in $HOME/old-vim-config"

printf "%s" "Copying old config..."
cp $HOME/.vimrc $HOME/old-vim-config
cp -r $HOME/.vim $HOME/old-vim-config
printf "%s\n" "Done"

printf "%s" "Removing existing .vimrc..."
rm $HOME/.vimrc
printf "%s\n" "Done"

printf "%s" "Removing existing .vim directory..."
rm -rf $HOME/.vim
printf "%s\n" "Done"

printf "%s" "Copying new .vimrc..."
cp vimrc.vim $HOME/.vimrc
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
cp $THIS_DIRECTORY/ycm_default_conf.py $HOME/.vim
printf "%s\n" "Done"
printf "%s\n" "Configuring vim...Done"
