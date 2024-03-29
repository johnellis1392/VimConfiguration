" General settings for vim
"

" General -- {{{
" set verbose=20
set shell=/bin/bash
set nocompatible
set hidden " Sets option to delete abandoned buffers
set encoding=utf-8

syntax on
set number
set ai
set smartindent

" }}}

" Search -- {{{
set incsearch  " Highlight text while typing in search panel
set hlsearch   " Highlight Searches
" }}}

" Visual -- {{{

" Reset available color pallete for vim to 256.
" It defaults to 8, which can mess with the color
" pallettes on some plugins.
set t_Co=256

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

" Set timeout on keycodes
set notimeout
set ttimeout
set ttimeoutlen=200

" Turn off cursor blinking
set gcr=n:blinkon0
hi StatusLine ctermbg=8 ctermfg=4
set statusline=%f\ -\ FileType:\ %y
set statusline+=%=[%4l/%L]

" }}}

" Meta -- {{{

set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab

set scroll=15

set wildmenu   " Better command-line completion
set wildmode=longest:full,full
set showcmd    " Show partial commands

set autochdir " Automatically change directory when opening files

" Set the default directory for storing *.swp files, so
" as to not clutter up working project directories
" NOTE: the '//' at the end here means that the name
" of the swap file is constructed out of the full path
" to the file that is being modified
set directory=$HOME/.vim/swapfiles//

" Folding config for C-style languages.
" Reset to foldmethod=syntax for non-C languages.
set foldmethod=marker
set foldmarker={,}

" Set extra search directories
let $PATH=$PATH . ":~/.cabal/bin"
let $PATH=$PATH . ":~/.local/bin"

" }}}
