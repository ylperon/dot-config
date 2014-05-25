#!/usr/bin/env sh
echo 'Removing existing .vimrc'
rm ~/.vimrc
echo 'Removing existing .vim/'
rm -rf ~/.vim
echo 'Copying new .vimrc'
cp .vimrc ~
echo 'Copying new .vim/'
cp -r .vim ~
echo 'Installing Vundle (https://github.com/gmarik/Vundle.vim) for more details'
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
echo 'Installing plugins...'
vim +PluginInstall +qall
echo "Installing YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
echo 'Done'
