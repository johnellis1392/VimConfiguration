" Setup Plugins
set nocompatible
filetype off

" Initialize pathogen
execute pathogen#infect()

" Syntastic Setup {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

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

" Easier find function
nmap <c-f> <Plug>(easymotion-overwin-f)

" }}}

" NERDTree config {{{

autocmd VimEnter * nnoremap <leader>t :NERDTreeFocus<cr>
autocmd VimEnter * nnoremap <leader>T :NERDTreeClose<cr>

" }}}

" CtrlP config {{{

autocmd VimEnter * nnoremap <leader>o :CtrlP<cr>

" Add files in .gitignore to ignore paths
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Custom ignore declarations
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git\|hg\|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }

set wildignore+=*tmp*,*node_modules*

" Set custom markers for finding project root
let g:ctrlp_root_markers = ['pom.xml', 'package.json', 'Dockerfile', 'docker-compose.yaml']

nnoremap <c-b> :CtrlPBuffer<cr>

" }}}

" Buffergator config {{{

" Remove conflicting bindings for above NERDTree config
" NOTE: Must use autocmd here since all plugins get
" sourced after vimrc is done loading
autocmd VimEnter * unmap <leader>to
autocmd VimEnter * unmap <leader>tc

" }}}

" MiniBufExplorer config {{{

" Add command to focus on MBE window
nnoremap <leader>mo :MBEFocus<cr>

" Customize color scheme
" hi MBENormal                guifg=#808080 guibg=fg
" hi MBEChanged               guifg=#CD5907 guibg=fg
" hi MBEVisibleNormal         guifg=#5DC2D6 guibg=fg
" hi MBEVisibleChanged        guifg=#F1266F guibg=fg
" hi MBEVisibleActiveNormal   guifg=#A6DB29 guibg=fg
" hi MBEVisibleActiveChanged  guifg=#F1266F guibg=fg

" hi MBENormal                guifg=Blue guibg=fg
" hi MBEChanged               guifg=Red guibg=fg
" hi MBEVisibleNormal         guifg=Blue guibg=fg
" hi MBEVisibleChanged        guifg=Yellow guibg=fg
" hi MBEVisibleActiveNormal   guifg=Green guibg=fg
" hi MBEVisibleActiveChanged  guifg=Yellow guibg=fg

" hi link MBENormal                Error
" hi link MBEChanged               Error
" hi link MBEVisibleNormal         Error
" hi link MBEVisibleChanged        Error
" hi link MBEVisibleActiveNormal   Error
" hi link MBEVisibleActiveChanged  Error


" }}}

" Airline config {{{

" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#show_buffers=1
" let g:airline#extensions#tabline#show_tabs=1

" Available Themes:

" Light Themes:
let g:airline_theme='aurora'
" let g:airline_theme='kolor'
" let g:airline_theme='xtermlight'
" let g:airline_theme='deus'
" let g:airline_theme='murmur'

" Dark Themes:
" let g:airline_theme='dark'
" let g:airline_theme='base16_colors'
" let g:airline_theme='simple'


" }}}

" Done setting up plugins: turn on filetype setting again
filetype plugin indent on

