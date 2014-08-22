Configs for shell, Vim, Tmux and other.
=======================================

Deployment
----------

Deploy all.

    ./deploy-all.sh

Only shell. Don't forget to replace _yazevnul_ (this is my username) with yours.

    cp profile.sh ~/.profile

Only Tmux.

    cd tmux && ./deploy-tmux-config.sh

Only Vim. This might take some time, especially with slow network connection.

    cd vim && ./deploy-vim-config.sh


Details
-------

[Solarized](http://ethanschoonover.com/solarized) colorscheme is used everywhere, so you will need
to change you terminal colorscheme in order to make everything look really good.

Here are some tips on how to achieve it:

- [Mac OS X](https://github.com/tomislav/osx-terminal.app-colors-solarized)
- [iTerm 2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
- [Gnome terminal](https://github.com/Anthony25/gnome-terminal-colors-solarized)

Vim plugins:

- [Vundle](https://github.com/gmarik/Vundle.vim)
- [NERDTree](https://github.com/scrooloose/nerdtree)
- [vim-airline](https://github.com/bling/vim-airline)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vcscommand.vim](https://github.com/vim-scripts/vcscommand.vim)
- [a.vim](http://www.vim.org/scripts/script.php?script_id=31)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [tagbar](https://github.com/majutsushi/tagbar)
- [flake8-vim](https://github.com/andviro/flake8-vim)

That is how it looks like on Mac OS X in Terminal.app.
![Demonstration](http://i.imgur.com/CCqrOAi.png)
