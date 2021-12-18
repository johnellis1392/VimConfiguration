" Custom language-specific plugins

" Autocommands -- {{{
augroup custom_utils
  autocmd!
  source $HOME/.vim/custom/tmux/tmux.vim
  autocmd Filetype javascript source $HOME/.vim/custom/js/index.vim
  autocmd Filetype haskell    source $HOME/.vim/custom/hs/index.vim
  autocmd Filetype vim        source $HOME/.vim/custom/vim/index.vim
  autocmd Filetype clojure    source $HOME/.vim/custom/clojure/index.vim
  autocmd Filetype apl        source $HOME/.vim/custom/apl/index.vim

  " Set txt and md extensions to same root
  autocmd Filetype text       source $HOME/.vim/custom/text/index.vim
  autocmd Filetype markdown   source $HOME/.vim/custom/text/index.vim

  " Set binary extension plugins
  autocmd Filetype *.bin,*.exe source $HOME/.vim/custom/binary/index.vim
augroup end
" }}}
