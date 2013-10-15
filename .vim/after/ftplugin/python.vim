
"autocmd BufNewFile,BufRead let $VIMFILE = expand("%%")
let $VIMFILE = expand("%%")
setlocal keywordprg=pydoc
"setlocal complete+=k~/.vim/data/pydiction iskeyword+=., "(
syn match IncSearch "\t"    " highlight bad tabbing

set cindent "makes indenting comments work

"set foldmethod=indent
"set foldnestmax=2
