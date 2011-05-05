" temporary
"if &term == "xterm-color"
"set t_kb=
"fixdel
"endif

" examples
abbr myabbr expanded text

" filetype specific options
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    au BufNewFile,BufRead *.tex set textwidth=80
    au BufNewFile,BufRead *.txt set filetype=text
    au BufNewFile,BufRead *.go set filetype=go
endif

if has("python")
    python import vim
endif

"call OnOffIndentHi()

" key mappings
"map <F2> : read !date +"* \%a \%b \%e \%Y Eivind Magnus Hvidevold <hvidevold@gmail.com>" <CR>o- <CR><ESC>kA
map <F2> : read !echo -n " -- Eivind Magnus Hvidevold <hvidevold@gmail.com>  "; date -R <CR>
map <F3> : nohlsearch <CR>
map <F5> : w! <CR> : make <CR>
imap <F5> <ESC> <F5> 
"map <F5> : ! nc -w1 192.168.126.9 12345 <CR> u
"map <F6> : r ! nc -l -p 12345 <CR>

" make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" editing options
set virtualedit=block      " select unwritten chars in visual-block mode
set nocompatible           " enables all vim enhanced functions
set hlsearch               " syntax highlighting on last search
set incsearch              " instant (char by char) search
"set ignorecase            " while searching
if has("gui_running")
    set background=light   " usually white bg in gui
else
    set background=dark    " light colors; more readable, but uglier
endif
set bs=2                   " allow all backspacing in insert mode
syntax on                  " syntax coloring
set wildmode=longest,list  " bash-style tab-completion
set formatoptions+=or      " auto-insert comment characters
set autoread               " get rid of annoying 'file mode changed'-warning
filetype plugin on

" .viminfo settings
" read/write a .viminfo file, don't store more that 50 lines of registers
set viminfo='20,\"50
set history=50

"set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
hi StatusLine ctermfg=blue
" display options
set laststatus=2
"set rulerformat=%30(%f\ \ %c%a%V\ %p%%%)
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set showmatch
set showcmd

" tab/indenting options
filetype indent on   " per file indent
set autoindent       " new line starts indented
set smartindent      " see help
set tabstop=4        " display width for old tab characters
set shiftwidth=4     " new tabs 
set softtabstop=4    " how many spaces for tab key press
set expandtab        " always replace tab key with spaces
                     " if not set 2xtab makes one tab char
autocmd BufNewFile,BufRead Makefile,Makefile.in,Makefile.am set noexpandtab
autocmd BufNewFile,BufRead Makefile,Makefile.in,Makefile.am set softtabstop=0
autocmd BufNewFile,BufRead *.djml set filetype=htmldjango

" XXX: move to .vim.*ftplugin
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let python_highlight_all=1

let g:SuperTabSetDefaultCompletionType="context"
let g:pydiction_location='~/.vim/data/pydictionary/complete-dict'

" I hate the eclim way of alternating buffers after using make.
" It also changes directory on make. bad bad bad.
" Better to load it for specific filetypes when really wanted.
if &filetype != "java" | let g:EclimDisabled=1 | endif
"EclimDisable

" kongereglar for paragraftekst
"
" set textwidth=0
" set linebreak
" map <Up> gk
" map <Down> gj
" imap <Up> <C-O>gk
" imap <Down> <C-O>gj

"map <F4> :source ~/devel/muttvi/muttvi.vim<CR>

if &t_Co == 256
    colorscheme inkpot
endif

"let xterm16_brightness='high'
"let xterm16_colormap='soft'
"colorscheme xterm16

let g:tex_flavor='latex'

"make yank/paste use clipboard by default
let g:clipbrdDefaultReg = '+'

if has("win32") && has("gui_running")
    au GUIEnter * simalt ~x
endif
