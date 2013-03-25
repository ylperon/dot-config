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
set ignorecase
set spell

set showmatch
set list
set listchars=trail:.

set number

set showmatch

" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

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

" NERDTree
map <F4> :NERDTreeToggle<CR>
map! <F4> <ESC>:NERDTreeToggle<CR>

autocmd BufEnter * lcd %:p:h

map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <C-a> :%s/\s\+$//g<CR>

map —ë `
map –π q
map —Ü w
map —É e
map –∫ r
map –µ t
map –Ω y
map –≥ u
map —à i
map —â o
map –∑ p
map —Ö [
map —ä ]
map —Ñ a
map —ã s
map –≤ d
map –∞ f
map –ø g
map —Ä h
map –æ j
map –ª k
map –¥ l
map –∂ ;
map —ç '
map —è z
map —á x
map —Å c
map –º v
map –∏ b
map —Ç n
map —å m
map –± ,
map —é .
map –Å ~
map –ô Q
map –¶ W
map –£ E
map –ö R
map –ï T
map –ù Y
map –ì U
map –® I
map –© O
map –ó P
map –• {
map –™ }
map –§ A
map –´ S
map –í D
map –ê F
map –ü G
map –† H
map –û J
map –õ K
map –î L
map –ñ :
map –≠ "
map –Ø Z
map –ß X
map –° C
map –ú V
map –ò B
map –¢ N
map –¨ M
map –ë <
map –Æ >
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
