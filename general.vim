" General settings for vim

" General -- {{{
set nocompatible
syntax on
set number
" }}}

" Search -- {{{
set incsearch  " Highlight text while typing in search panel
set hlsearch   " Highlight Searches
" }}}

" Visual -- {{{
set ignorecase " Case insensitive search
set smartcase  " Case sensitive search when you use capital letters
set backspace=indent,eol,start 
set autoindent
set ruler      " Display cursor position
set laststatus=2
set confirm    " Confirm save before performing a command
set visualbell " Visual bell instead of audible beeping
set t_vb=
set mouse=a    " Enable mouse
set notimeout ttimeout ttimeoutlen=200 " Set timeout on keycodes

" Turn off cursor blinking
set gcr=n:blinkon0
hi StatusLine ctermbg=8 ctermfg=4
set statusline=%f\ -\ FileType:\ %y
set statusline+=%=[%4l/%L]
" }}}

" Meta -- {{{
set softtabstop=2
set shiftwidth=2
set expandtab

set scroll=15

set wildmenu   " Better command-line completion
set showcmd    " Show partial commands

set autochdir 
" }}}
