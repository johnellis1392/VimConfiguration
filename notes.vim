" You can use <C-c> to exit insert mode instead of <esc>
"
" Any time you want to learn a new key, try setting the 
" old key to <nop> to force yourself to learn.
" 
" Note: comment out section; .,+5s/^(.*)$/" \1/
"
" nmap <silent> <C-m> :call DoSomething(1, 2)
" function! DoSomething(i, j)
"   " Use a:i notation to reference parameters
"   " let v = @* " Get visual selection
"   echom a:i
" endfunction
