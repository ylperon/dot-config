filetype on
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'

" Git staff
if has('python')
    Bundle 'tpope/vim-fugitive'
endif

" C++ staff
Bundle 'clang-complete'
Bundle 'a.vim'

" Python staff
if has('python')
    Bundle 'davidhalter/jedi-vim'
endif

" Perl staff
Bundle 'c9s/perlomni.vim'

" SVN and Git staff
Bundle 'vcscommand.vim'
