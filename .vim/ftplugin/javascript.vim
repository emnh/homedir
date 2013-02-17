set makeprg=jslwrap\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -process\ %
set errorformat=%f(%l):\ %m
"make F10 call make for linting etc.
inoremap <silent> <F10> <C-O>:make<CR>
map <silent> <F10> :make<CR>
