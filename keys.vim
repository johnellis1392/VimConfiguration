" Custom Shortcuts

" Window -- {{{
nnoremap <silent> <f3> :NERDTreeToggle<cr>
nnoremap <silent> <f2> <c-w>w
nnoremap <silent> <Enter> o<Esc>

" Easier Change Windows
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

" Faster motion keys (without moving window)
nnoremap <silent> <c-n> 10j
nnoremap <silent> <c-p> 10k

" Easier close window operation
nnoremap <silent> <c-c> :bd<cr>

" Easier Document Management
nnoremap <silent> <c-s> :w<cr>
nnoremap <silent> <c-q><c-q> :q!<cr>
" }}}

" Tabs -- {{{
nnoremap <silent> <c-t> :tabnew<cr>

" nnoremap <silent> <c-,> gT
" nnoremap <silent> <c-.> gt
" }}}

" Folding -- {{{
" Turn on syntax folding and Map space to fold codeblock
" set foldmethod=syntax
nnoremap <silent> <space> za
" }}}

" Vimrc Sourcing -- {{{
" Add mappings to make it easier to make it easier to edit
" (not my words)
let mapleader="\\"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Mode Maps -- {{{

" Insert Mode -- {{{
" Map jk to escape to normal mode
inoremap <silent> jk <esc>
inoremap <silent> <esc> <nop>
inoremap <silent> <c-c> <nop>
inoremap <silent> <c-m> <nop>

inoremap <silent> <c-g> <tab>
inoremap <silent> <tab> <c-p>

" Save document
inoremap <c-s> <esc>:w<cr>
" }}}

" Visual Mode -- {{{
vnoremap <silent> <c-j> <esc>
" }}}

" O-Maps -- {{{

" onoremap is used for operator-pending mappings.
" operator pending mappings are maps for commands
" that require associated motion commands, such as
" d, y, and c.

onoremap <silent> <c-j> <esc>

" }}}

" }}}
