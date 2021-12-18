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
"
" zM => Close all folds
" zm => Close folds by level
" zR => Open all folds
" zr => Open folds by level
"
"
"
" Found this nifty little fix for iTerm2+Tmux+Vim integration:
" https://stackoverflow.com/questions/9520676/macvim-iterm2-tmux-bind-alt-meta
" Basically, iTerm interprets alt+char as ^[char,, which vim interprets as \e,
" so we're rebinding \echar here to a meta sequence that we can bind to
" something else.
execute "set <A-p>=\ep"
nnoremap <silent> <buffer> <A-p> :call AutoPairsToggle()<cr>

" Example of how to Redirect vim info to a file. In this case, we're
" writing the active keymap to a file.
:redir! > vim_keys.txt
:silent verbose map
:redir END
