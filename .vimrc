"Common
set nocompatible

set backspace=2

"Editor
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cursorline
set incsearch
set hlsearch
set ignorecase
set spell

set showmatch
set list
set listchars=trail:.

set number

"Search
set showmatch

"Opening splits
set splitright

" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251

so ~/.vim/vundle.module.vim
so ~/.vim/colors.module.vim

filetype plugin on
filetype indent on

" remove trailing whitespaces on save
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Switch between tabs on F7 and F8
map <F8> :tabnext<CR>
map! <F8> <ESC>:tabnext<CR>i
map <F7> :tabprevious<CR>
map! <F7> <ESC>:tabprevious<CR>i

"Plugins
let g:indent_guides_guide_size=1

"Vundle configs
let g:vundle_default_git_proto = 'git'

"Autocompletition command for jedi (python autocomplete for vim)
let g:jedi#autocompletion_command = "<C-x>"

" NERDTree
map <F4> :NERDTreeToggle<CR>
map! <F4> <ESC>:NERDTreeToggle<CR>

"vim-airline
set laststatus=2
let g:airline_theme='solarized'

"clang-complete
let g:clang_user_options = '-std=c++11 -stdlib=libc++'

autocmd BufEnter * lcd %:p:h

map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <C-a> :%s/\s\+$//g<CR>
