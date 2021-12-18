" Color scheme settings
"
" NOTE: 'evening' looks good in gvim, but looks
" like shit in the terminal; adding this straight
" to .gvimrc
" colorscheme evening

" :help highlight-groups  // Highlight Groups Docs
" :highlight              // For viewing current settings
highlight Pmenu       ctermbg=DarkRed guibg=DarkGray guifg=White ctermfg=White
highlight PmenuSel    ctermbg=DarkRed guibg=DarkGray guifg=White ctermfg=White
highlight PmenuSbar   ctermbg=DarkRed guibg=DarkGray guifg=White ctermfg=White
highlight PmenuThumb  ctermbg=DarkRed guibg=DarkGray guifg=White ctermfg=White


" highlight Pmenu       ctermbg=LightBlue guibg=LightBlue guifg=LightBlue ctermfg=LightBlue
" highlight PmenuSel    ctermbg=LightBlue guibg=LightBlue guifg=LightBlue ctermfg=LightBlue
" highlight PmenuSbar   ctermbg=LightBlue guibg=LightBlue guifg=LightBlue ctermfg=LightBlue
" highlight PmenuThumb  ctermbg=LightBlue guibg=LightBlue guifg=LightBlue ctermfg=LightBlue

" Relevant Coc Highlights
" CocErrorSign
" CocWarningSign
" CocErrorHighlight
" CocWarningHighlight
highlight CocErrorHighlight     ctermbg=DarkRed         guibg=Red         guifg=White       ctermfg=White 
highlight CocWarningHighlight   ctermbg=DarkYellow      guibg=DarkYellow  guifg=Black       ctermfg=Black 
highlight CocErrorSign          ctermbg=Red             guibg=Red         guifg=White       ctermfg=White
highlight CocWarningSign        ctermbg=DarkYellow      guibg=DarkYellow  guifg=DarkYellow  ctermfg=DarkYellow 
highlight CocErrorVirtualText   ctermbg=Red             guibg=Red         guifg=DarkRed     ctermfg=DarkRed 
highlight CocWarningVirtualText ctermbg=DarkYellow      guibg=DarkYellow  guifg=DarkYellow  ctermfg=DarkYellow 
