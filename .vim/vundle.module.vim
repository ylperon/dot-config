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

" Git staff
if has('python')
    Plugin 'tpope/vim-fugitive'
endif

" C++ staff
Plugin 'clang-complete'
Plugin 'a.vim'

" Python staff
if has('python')
    Plugin 'davidhalter/jedi-vim'
endif

" SVN and Git staff
Plugin 'vcscommand.vim'

call vundle#end()
filetype plugin indent on
