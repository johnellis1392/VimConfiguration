" Custom Shortcuts

" Buffers {{{

" NOTE: You can map alt+key mappings on macs
" by finding out what alt character the mapping
" normally maps to, then binding that character.
" NOTE: You can view the alt character sequences
" associated with keys by using `sed -n l`
" NOTE: This doesn't actually work...
" Might be Tmux? :/
" nnoremap ˜ :MBEbn<cr>
" nnoremap π :MBEbp<cr>
" nnoremap <esc>^[n :MBEbn<cr>
" nnoremap <esc>^[p :MBEbp<cr>

nmap <leader>n :bp<cr>
nmap <leader>p :bn<cr>

" }}}

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
" nnoremap <silent> <c-n> 10j
" nnoremap <silent> <c-p> 10k

" Easier close window operation
nnoremap <silent> <c-c> :bd<cr>

" Easier Document Management
nnoremap <silent> <c-s> :w<cr>
nnoremap <silent> <c-q><c-q> :q!<cr>
" }}}

" Tabs -- {{{
nnoremap <silent> <c-t> :tabnew<cr>

" Easier tab navigation
" nnoremap <leader>h :tabprevious<cr>
" nnoremap <leader>l :tabnext<cr>

" }}}

" Folding -- {{{

" Make indent folding default
" set foldmethod=indent

" Commands for navigating to the previous and
" next closed folds
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

" Jump to next closed fold
function! NextClosedFold(dir)
  let cmd = 'norm!z' . a:dir
  let view = winsaveview()
  let [l0, l, open] = [0, view.lnum, 1]
  while l != l0 && open
    exe cmd
    let [l0, l] = [l, line('.')]
    let open = foldclosed(l) < 0
  endwhile
  if open
    call winrestview(view)
  endif
endfunction

" }}}

" Vimrc Sourcing -- {{{
" Add mappings to make it easier to make it easier to edit
" (not my words)

let mapleader="\\"
" let mapleader = "\<Space>"
nmap <Space> <leader>

" NOTE: Changing this to reference configs in ~/.vim
" for convenience.
" nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>ve :vsplit $HOME/.vim/general.vim
nnoremap <leader>vs :source $MYVIMRC<cr>

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
" vnoremap <silent> <c-_> :normal! I" <esc>
" }}}

" O-Maps -- {{{

" onoremap is used for operator-pending mappings.
" operator pending mappings are maps for commands
" that require associated motion commands, such as
" d, y, and c.

onoremap <silent> <c-j> <esc>

" }}}

" Command-Line Maps {{{

" Add <c-j> enter command
cnoremap <c-j> <cr>

" Add jk escape sequence
cnoremap jk <c-c>

" }}}

" }}}

" Miscellaeous {{{

" Format current buffer and save
nmap <leader>f gg=G<c-o><c-o>:w<cr>

" }}}

