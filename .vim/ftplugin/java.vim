" Import the class under the cursor with <leader>i.
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
" Search for the javadocs of the element under the cursor with <leader>d.
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
" Perform a context sensitive search of the element under the cursor with <enter>.
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

"EclipseEnable
