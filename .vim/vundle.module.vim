filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'

Plugin 'Valloric/YouCompleteMe'

" Git staff
if has('python')
    Plugin 'tpope/vim-fugitive'
endif

" SVN and Git staff
Plugin 'vcscommand.vim'

" C++ staff
Plugin 'a.vim'

call vundle#end()
filetype plugin indent on
