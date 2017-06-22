" Javascript-specific keybindings and functions
" Autocommands -- {{{
augroup js_util
  autocmd!

  " Folds -- {{{
  syntax region foldBraces   start="{" end="}" transparent fold keepend extend
  syntax region foldBrackets start="\[" end="\]" transparent fold keepend extend
  setlocal foldmethod=syntax
  setlocal foldlevelstart=1
  setlocal foldlevel=99
  " }}}

  " Load additional resources
  source ~/.vim/custom/js/keys.vim

  " Set jsx notation
  let g:jsx_pragma_required = 0
augroup end
" }}}
