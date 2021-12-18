" Setup Plugins
set nocompatible

" Initialize pathogen
execute pathogen#infect()
filetype off
Helptags


" Airline config {{{

" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#show_buffers=1
" let g:airline#extensions#tabline#show_tabs=1

" Available Themes:

" Light Themes:
"let g:airline_theme='aurora'
" let g:airline_theme='kolor'
" let g:airline_theme='xtermlight'
" let g:airline_theme='deus'
" let g:airline_theme='murmur'

" Dark Themes:
" let g:airline_theme='dark'
" let g:airline_theme='base16_colors'
" let g:airline_theme='simple'

let g:airline#extensions#gutentags#enabled=1

" }}}

" Ale {{{

nmap <silent> <c-f><c-p> <Plug>(ale_previous_wrap)
nmap <silent> <c-f><c-n> <Plug>(ale_next_wrap)

" Haskell Linter Setups
let g:ale_linters = {'haskell': ['cabal_ghc', 'ghc-mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc']}

highlight ALEWarning ctermbg=DarkRed ctermfg=White
" highlight ALEWarning ctermbg=Black

nmap <silent> <leader>ad <Plug>(ale_detail)

" }}}

" AutoPairs {{{

" Found this nifty little fix for iTerm2+Tmux+Vim integration:
" https://stackoverflow.com/questions/9520676/macvim-iterm2-tmux-bind-alt-meta
" Basically, iTerm interprets alt+char as ^[char,, which vim interprets as \e,
" so we're rebinding \echar here to a meta sequence that we can bind to
" something else.
" execute "set <A-p>=\ep"
" nnoremap <silent> <buffer> <A-p> :call AutoPairsToggle()<cr>
nnoremap <silent> <leader>at :call AutoPairsToggle()<cr>

function! AutoPairsToggleFlyMode()
  if g:AutoPairsFlyMode == 0
    let g:AutoPairsFlyMode = 1
    echom "AutoPairsFlyMode enabled"
  else
    let g:AutoPairsFlyMode = 0
    echom "AutoPairsFlyMode disabled"
  endif
endfunction
nnoremap <silent> <buffer> <leader>af :call AutoPairsToggleFlyMode()<cr>

function! AutoPairsToggleMapCR()
  if g:AutoPairsMapCR == 0
    let g:AutoPairsMapCR = 1
    echom "AutoPairsMapCR enabled"
  else
    let g:AutoPairsMapCR = 0
    echom "AutoPairsMapCR disabled"
  endif
endfunction
nnoremap <silent> <buffer> <leader>ac :call AutoPairsToggleMapCR()<cr>

let g:AutoPairsFlyMode = 1
let g:AutoPairsCenterLine = 0

" }}}

" Buffergator config {{{

" Remove conflicting bindings for above NERDTree config
" NOTE: Must use autocmd here since all plugins get
" sourced after vimrc is done loading
autocmd VimEnter * unmap <leader>to
autocmd VimEnter * unmap <leader>tc

" }}}

" Coc {{{

inoremap <silent><expr> <tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" }}}

" CtrlP config {{{

autocmd VimEnter * nnoremap <leader>o :CtrlP<cr>

" Add files in .gitignore to ignore paths
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" Custom ignore declarations
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git\|hg\|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }

set wildignore+=*tmp*,*node_modules*

" Set custom markers for finding project root
let g:ctrlp_root_markers = ['pom.xml', 'package.json', 'Dockerfile', 'docker-compose.yaml', 'project.clj', '.envrc']

" List of all possible extensions
" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
"                         \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" Enabled extensions
let g:ctrlp_extensions = ['dir', 'line', 'mixed', 'tag']

nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap <leader>. :CtrlPTag<cr>

" }}}

" EasyMotion Setup {{{

" Disable default easy-motion mappings
let g:EasyMotion_do_mapping = 0

" Set easy-motion keybinding
" nmap <Leader>e <Plug>(easymotion-overwin-f)
" nmap <Leader>e <Plug>(easymotion-s)
" nmap <Leader>e <Plug>(easymotion-bd-f)

" New Binding (Old Binding conflicts with Conjure)
" nmap <Leader>f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-bd-f)

" Easy motion with smaller keyset
" nnoremap <leader>s <Plug>(easymotion-overwin-f2)

" jk motions: Move by lines
" nnoremap <leader>j <Plug>(easymotion-j)
" nnoremap <leader>k <Plug>(easymotion-k)

" Easier find function
" nmap <c-f> <Plug>(easymotion-overwin-f)
" nmap <c-f> <Plug>(easymotion-bd-f)

" }}}

" Fzf Config {{{

nmap <c-f> <nop>
nnoremap <silent> <c-f><c-t> :Tags<cr>
nnoremap <silent> <c-f><c-b> :BTags<cr>
nnoremap <silent> <c-f><c-r> :Rg<cr>
" let g:fzf_tags_command="ctags -R  --exclude=.git--exclude=vendor --exclude=node_modules --exclude=target --exclude=db --exclude=log ."
let g:fzf_tags_command="ctags -R ."

" }}}

" Gitgutter {

" }

" Gutentags Config {{{
" set statusline+=%{gutentags#statusline()}
" let g:gutentags_debug = 1
" let g:gutentags_trace = 1

let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git', 'deps.edn', 'project.clj', '.gitignore']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

let g:gutentags_ctags_extra_args = [ ' --tag-relative=yes', ' --fields=+ailmnS', ]

" Command for easily clearing GutenTags Cache Directory
command! -nargs=0 GutentagsClearCache call system("rm " . g:gutentags_cache_dir . "/*")

" Files to Ignore
let g:gutentags_ctags_exclude = [ '.git', '.svg', '.hg', '/tests/', 'build', 'dist', 'sites//files/', 'bin', 'node_modules', 'bower_components', 'cache', 'compiled', 'docs', 'example', 'bundle', 'vendor', '.md', '-lock.json', '.lock', 'bundle.js', 'build.js', '.rc', '.json', '.min.', '.map', '.bak', '.zip', '.pyc', '.class', '.sln', '.Master', '.csproj', '.tmp', '.csproj.user', '.cache', '.pdb', 'tags', 'cscope.', '.css', '.less', '.scss', '.exe', '.dll', '.mp3', '.ogg', '.flac', '.swp', '.swo', '.bmp', '.gif', '.ico', '.jpg', '.png', '.rar', '.zip', '.tar', '.tar.gz', '.tar.xz', '.tar.bz2', '.pdf', '.doc', '.docx', '.ppt', '.pptx']


" Haskell Setup
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'haskell', 'file': 'stack.yaml'})
call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
let g:gutentags_ctags_executable_haskell = "$HOME/.vim/scripts/hasktags-gutentags-shim.sh"


" }}}

" Hoogle {{{

nnoremap <silent> <leader>hh :Hoogle<cr>
nnoremap <silent> <leader>hH :Hoogle

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

" Neovim-LSP {
if has('nvim-0.5.0')
lua << EOF
  local nvim_lsp = require('lspconfig')
  local on_attach = function(client)
    local opts = { noremap=true }
    vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>',
        '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'K',
        '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd',
        '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gD',
        '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gr',
        '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ca',
        '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cr',
        '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls',
        '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

    vim.api.nvim_buf_set_keymap(0, 'i', '<C-s>',
        '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    -- autoformat only for haskell
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'haskell' then
        vim.api.nvim_command[[
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    end
  end

  nvim_lsp.hls.setup({
    on_attach = on_attach,
    settings = {
        haskell = {
            hlintOn = true,
            formattingProvider = "fourmolu"
        }
     }
  })
EOF
endif
" }

" NERDTree config {{{

autocmd VimEnter * nnoremap <leader>t :NERDTreeFocus<cr>
autocmd VimEnter * nnoremap <leader>T :NERDTreeClose<cr>

" }}}

" RainbowParentheses Config {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

    " ['black',       'SeaGreen3'],
    " ['Darkblue',    'SeaGreen3'],
    " ['Darkblue',    'firebrick3'],
" }}}

" Syntastic Setup {{{

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" C++20 Configs
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++20 -stdlib=libc++'

" Haskell Configs
let g:syntastic_haskell_checkers = ['hlint']

" }}}

" Vundle Setup {{{
" Note: Use :PluginInstall to install plugins,
"       and :PluginUpdate to update existing plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin 'gmarik/Vundle.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'SWIFT-ATE-Syntax'
" Plugin 'Buffergator' " Note: Use \b to open buffergator window
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'

Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plugin 'mlochbaum/BQN', { 'rtp':'editors/vim' }

call vundle#end()
" }}}


" Done setting up plugins: turn on filetype setting again
filetype plugin indent on
