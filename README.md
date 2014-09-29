Configs for Bash, Vim, Tmux and other.
=======================================

Deployment
----------

Deploy all.

    ./deploy.sh

Only Bash. Don't forget to replace _yazevnul_ (this is my username) with yours.

    ./bash/deploy.sh

Only Tmux.

    ./tmux/deploy.sh

Only Python.

    ./python/deploy.sh

Only Vim. This might take some time, especially with slow network connection.

    ./vim/deploy.sh


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
- [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
- [csv.vim](https://github.com/chrisbra/csv.vim)

Custom Vim key mappings:

- <kbd>F4</kbd> — show directory tree
- <kbd>F7</kbd> — move to the next tab
- <kbd>F8</kbd> — move to the previous tab
- <kbd>F9</kbd> — show/close tagbar
- <kbd>Ctrl</kbd> + <kbd>\]</kbd> — goto declaration

That is how it looks like on Mac OS X in Terminal.app.
![Demonstration](http://i.imgur.com/CCqrOAi.png)
