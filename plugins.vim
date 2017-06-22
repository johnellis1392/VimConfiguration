" Setup Plugins
set nocompatible
filetype off

execute pathogen#infect()

" Vundle Setup -- {{{
" Note: Use :PluginInstall to install plugins,
"       and :PluginUpdate to update existing plugins
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
"
" Plugin 'gmarik/Vundle.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'SWIFT-ATE-Syntax'
" Plugin 'Buffergator' " Note: Use \b to open buffergator window
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
"
" " Note: Look into 'syntastic' for syntax correction
"
" call vundle#end()
" }}}

" NeoBundle Setup -- {{{
" Note: Use NeoBundleInstall to install plugins, and
"       NeoBundleUpdate to update existing plugins
"
" For more information, go to:
" https://github.com/Shougo/neobundle.vim
" set rtp+=~/.vim/bundle/neobundle.vim
" call neobundle#begin()
"
" NeoBundle 'toyamarinyon/vim-swift'
" NeoBundle 'syntastic'
" NeoBundle 'fugitive.vim'
" NeoBundle 'elixir-lang/vim-elixir'
"
" call neobundle#end()
" }}}

" Done setting up plugins: turn on filetype setting again
filetype plugin indent on