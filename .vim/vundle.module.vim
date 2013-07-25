filetype on
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'clang-complete'
Bundle 'bling/vim-airline'
if has('python')
    Bundle 'davidhalter/jedi-vim'
    Bundle 'tpope/vim-fugitive'
endif
