" temporary
"if &term == "xterm-color"
"set t_kb=
"fixdel
"endif

" 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || $TERM
      set t_Co=256
endif

" many good tips from http://statico.github.io/vim.html

" vim package manager vundle

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

"Bundle 'gmarik/vundle'

" set rtp+=~/.vim/bundle/neobundle.vim/
" call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" NeoBundleFetch 'Shougo/neobundle.vim'
" NeoBundleCheck

" https://github.com/tpope/vim-pathogen
" enables bundles in .vim/bundle
execute pathogen#infect()

" Powerline status line
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" examples
abbr myabbr expanded text

" filetype specific options
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    au BufNewFile,BufRead *.tex set textwidth=80
    au BufNewFile,BufRead *.txt set filetype=text
    au BufNewFile,BufRead *.go set filetype=go

    au BufNewFile,BufRead *.py TagbarOpen
    au BufNewFile,BufRead *.java TagbarOpen
    au BufNewFile,BufRead *.clj TagbarOpen
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

:nmap \e :NERDTreeToggle<CR> " NERD TREE
:nmap \t :Tlist<CR>          " taglist

" make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" editing options
set virtualedit=block      " select unwritten chars in visual-block mode
set nocompatible           " enables all vim enhanced functions
set hlsearch               " syntax highlighting on last search
set incsearch              " instant (char by char) search
set ignorecase             " while searching
set smartcase              " make searches case-insensitive except when you include upper-case characters
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
set tabstop=2        " display width for old tab characters
set shiftwidth=2     " new tabs 
set softtabstop=2    " how many spaces for tab key press
set expandtab        " always replace tab key with spaces
                     " if not set 2xtab makes one tab char
autocmd BufNewFile,BufRead Makefile,Makefile.in,Makefile.am set noexpandtab
autocmd BufNewFile,BufRead Makefile,Makefile.in,Makefile.am set softtabstop=0
autocmd BufNewFile,BufRead *.djml set filetype=htmldjango
autocmd BufNewFile,BufRead *.ps1 set filetype=ps1

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

" vimclojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
let vimclojure#SplitPos = "right" 

" from http://statico.github.io/vim.html
" Regarding Vim’s command line, its defaults make it behave very unlike a
" modern command line. If you’re used to Emacs-style movement keys on your
" Bash or Zsh command line (using Ctrl-A and Ctrl-E and the like) the you
" might want to make Vim act the same way:
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" code folding
nnoremap <space> za
vnoremap <space> zf

" taglist clojure settings
let tlist_clojure_settings = 'lisp;f:function'

" http://statico.github.io/vim.html
" ctrlp options
" :let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0
