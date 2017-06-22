" Custom language-specific plugins
" Autocommands -- {{{
augroup custom_utils
  autocmd!
  autocmd Filetype javascript source $HOME/.vim/custom/js/index.vim
  autocmd Filetype haskell    source $HOME/.vim/custom/hs/index.vim
  autocmd Filetype vim        source $HOME/.vim/custom/vim/index.vim

  " Set txt and md extensions to same root
  autocmd Filetype text       source $HOME/.vim/custom/text/index.vim
  autocmd Filetype markdown   source $HOME/.vim/custom/text/index.vim
augroup end
" }}}
