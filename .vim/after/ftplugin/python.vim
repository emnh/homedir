
"autocmd BufNewFile,BufRead let $VIMFILE = expand("%%")
let $VIMFILE = expand("%%")
setlocal keywordprg=pydoc2
"setlocal complete+=k~/.vim/data/pydiction iskeyword+=., "(
syn match IncSearch "\t"    " highlight bad tabbing

set cindent "makes indenting comments work
