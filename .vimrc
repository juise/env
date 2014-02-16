" Mapping: {{{

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

cabbrev й q
cabbrev й! q!
cabbrev й1 q!
cabbrev ц w
cabbrev ц! w!
cabbrev ц1 w!
cabbrev цй wq
cabbrev цй! wq!
cabbrev цй1 wq!
cabbrev w1 w!
cabbrev wq1 wq!

" }}}

" Interface: {{{

" Disable back compatible with vi
set nocompatible

filetype plugin indent on

" Enable syntax highlighting
syntax on
" Set numer of colors for terminal
if !has('gui_running')
	set t_Co=256
endif

" Colorscheme
colorscheme default
colorscheme xoria256

" Hightlight info lines
hi info ctermbg=67 guibg=67

" Highlight line under cursor
set cursorline

" Use ',' as mapleader
let mapleader = ","
let g:mapleader = ","

" Show some useful whitespaces (such as tabs and trailing spaces)
set list
set listchars=tab:»\ ,trail:·,nbsp:%,extends:>,precedes:<

set scrolloff=0
" The minimal number of columns to scroll horizontally.
set sidescroll=5
" The minimal number of screen columns to keep to the left and to the
" right of the cursor if 'nowrap' is set.
set sidescrolloff=5

" Use menu to show command-line completion (in 'full' case)
set wildmenu
" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Show line, column number, and relative position within a file
set ruler
" Show commands (or size of selection in Visual mode)
set showcmd

" Briefly jump to matching bracket
set showmatch
" Tenths of a second to show matching bracket
set matchtime=5

" Show line numbers and set width of number zone to 4 symbols
set numberwidth=4
set number

" Do not redraw screen during macros run
set lazyredraw
" Improve redrawing for fast terminal connection
set ttyfast

" Hide the mouse when typing text
set mousehide

" Keep cursor on same column when moving
set nostartofline

" When split windows, put new windows right and below
set splitbelow splitright

" Customization status line
"set laststatus=2
"set statusline=\ %f\ %{&enc}/%{&ff}%=%2c\ %2l/%L\ %2p%%\
"hi statusline ctermfg=244 ctermbg=234

"autocmd InsertEnter * :set laststatus=1
"autocmd InsertLeave * :set laststatus=2

" }}}


" Searching: {{{

" Enable incremental search
set incsearch
" Highlight results of a search
set hlsearch
" Be case sensitive only when search contains uppercase
set ignorecase smartcase

" }}}



" Editing: {{{

" Smart tab key behaviour
set smarttab
" Size of autoindent step in spaces
set shiftwidth=4
" Round indent to a multiple of shiftwidth
set shiftround
" Size of tab in spaces
set tabstop=4
" Change tab to 4 space
set expandtab
" Use 4 column for 1 tab
set softtabstop=4

" Enable automatic C program indenting
set cindent

" Encoding
set fileencodings=utf-8,cp1251,koi8-r,cp866
set encoding=utf-8

" Create backups
set backup
set backupdir=~/.vim/backup

" Clear trailing whitespaces
nmap <Leader> :%s/\s\+$//e<CR>
" Clear ^M from dos fileformat and replace with \r
nmap <Leader>m :%s/\r\(\n\)/\1/e<CR>
" Highlight current line
"nmap <Leader>h ml:execute 'match info /\%'.line('.').'l/'<CR>
nmap <Leader>h :exe "let m = matchadd('WildMenu','\\%" . line('.') . "l')"<CR>

" }}}


" Navigation: {{{

" New tab
nmap <c-t> :tabnew<cr>
vmap <c-t> <esc>:tabnew<cr>i
imap <c-t> <esc>:tabnew<cr>i


" }}}

" Commands: {{{

" Write file using sudo
cmap ws w !sudo tee > /dev/null %<CR>

" }}}


" Functions: {{{

function AutoComplete()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction

" }}}


" Python: {{{

autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set expandtab smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

iab cu # -*- coding: utf-8 -*-<cr>

" }}}


" HTML: {{{

autocmd BufRead *.html set expandtab smartindent

" }}}


" NERDTree: {{{

nmap <c-N> :NERDTreeToggle<cr>
vmap <c-N> <esc>:NERDTreeToggle<cr>i
imap <c-N> <esc>:NERDTreeToggle<cr>i

let NERDTreeIgnore=['\.pyc$', '\.beam$']

" }}}


" Omnicomletion: {{{

autocmd FileType erlang set omnifunc=erlangcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


imap <tab> <c-r>=AutoComplete()<cr>

" }}}

