" Setup Plugins
set nocompatible
filetype off

" Initialize pathogen
execute pathogen#infect()

" Setup Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Vundle Setup {{{
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

" NeoBundle Setup {{{
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

" EasyMotion Setup {{{

" Disable default easy-motion mappings
let g:EasyMotion_do_mapping = 0

" Set easy-motion keybinding
" nnoremap <leader>s <Plug>(easymotion-overwin-f)
nmap <Leader>e <Plug>(easymotion-overwin-f)

" Easy motion with smaller keyset
" nnoremap <leader>s <Plug>(easymotion-overwin-f2)

" jk motions: Move by lines
nnoremap <leader>j <Plug>(easymotion-j)
nnoremap <leader>k <Plug>(easymotion-k)

" }}}

" NERDTree config {{{

autocmd VimEnter * nnoremap <leader>t :NERDTreeFocus<cr>
autocmd VimEnter * nnoremap <leader>T :NERDTreeClose<cr>

" }}}

" CtrlP config {{{

autocmd VimEnter * nnoremap <leader>o :CtrlP<cr>

" }}}

" Buffergator config {{{

" Remove conflicting bindings for above NERDTree config
" NOTE: Must use autocmd here since all plugins get
" sourced after vimrc is done loading
autocmd VimEnter * unmap <leader>to
autocmd VimEnter * unmap <leader>tc

" }}}

" Done setting up plugins: turn on filetype setting again
filetype plugin indent on

