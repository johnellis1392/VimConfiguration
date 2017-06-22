" Maps -- {{{
" Abbreviations -- {{{
" Easier function declarations
inoremap <buffer> fn{<space> function<space>()<space>{<space><space>}<left><left>
inoremap <buffer> fn{<cr> function<space>()<space>{<cr>}<esc>kA<cr>

" inoremap ( ()<esc>i
" inoremap " ""<esc>i
" }}}

" Keys -- {{{
" nnoremap <silent> <c-j> :call NextFunctionDecl()<cr>
" nnoremap <silent> <c-k> :call PrevFunctionDecl()<cr>
" }}}
" }}}

" Functions -- {{{
" Search for next javascript function declaration
function! NextFunctionDecl()
  call search("\\s*\\w\\+\\s*:\\{,1}\\s*function\\s*(\\(\\w\\+\\|,\\|\\s*\\)*)\\s*{\\{,1}", "w")
endfunction

" Search for last javascript function declaration
function! PrevFunctionDecl()
  call search("\\s*\\w\\+\\s*:\\{,1}\\s*function\\s*(\\(\\w\\+\\|,\\|\\s*\\)*)\\s*{\\{,1}", "bw")
endfunction
" }}}
