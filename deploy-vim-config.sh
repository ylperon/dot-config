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
echo "Copy default config for YouCompleteMe"
mkdir ~/.vim/bundle/YouCompleteMe/cpp
mkdir ~/.vim/bundle/YouCompleteMe/cpp/ycm
wget "https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py" \
    --no-check-certificate \
    -O ~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py
echo 'Done'
