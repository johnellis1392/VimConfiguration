" Configuration Options for Hex Editing

" "vim -b" => Edit Binary File using "xxd" Format.
" Use ":h hex-editing" to get vim hex-editor functionality help.

" General Bindings {{{
augroup Binary

  " Shorter version of "automd!"
  " au! 
  autocmd!

  " au BufReadPre   *.bin,*.exe let &bin=1
  " au BufReadPost  *.bin,*.exe if &bin | %!xxd
  " au BufReadPost  *.bin,*.exe set ft=xxd | endif
  " au BufWritePre  *.bin,*.exe if &bin | %!xxd -r
  " au BufWritePre  *.bin,*.exe endif
  " au BufWritePost *.bin,*.exe if &bin | %!xxd
  " au BufWritePost *.bin,*.exe set nomod | endif


  " let &bin=1
  " if &bin
  "   %!xxd
  "   set ft=xxd
  " endif
  " if &bin 
  "   %!xxd -r
  " endif
  " if &bin 
  "   %!xxd
  "   set nomod
  " endif

augroup end
" }}}
