" Custom Shortcuts

" Motion {{{

" Next/Previous Errors
" nnoremap <silent> <c-f><c-n> :lnext<cr>
" nnoremap <silent> <c-f><c-p> :lprev<cr>

" Open Marker Window
nnoremap <silent> <c-m> :<c-u>marks<cr>:normal! `

" execute 'set <A-n>=\en'
" execute 'set <A-p>=\ep'
" nnoremap <silent> <A-n> W
" nnoremap <silent> <A-p> B

" }}}

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

nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>

" }}}

" Window -- {{{
" nnoremap <silent> <f3> :NERDTreeToggle<cr>
" nnoremap <silent> <f2> <c-w>w
" nnoremap <silent> <Enter> o<Esc>

" Easier Change Windows
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

" Reshaping
nnoremap <silent> <up>    :resize +5<cr>
nnoremap <silent> <down>  :resize -5<cr>
nnoremap <silent> <right> :vertical resize +5<cr>
nnoremap <silent> <left>  :vertical resize -5<cr>

" Window Frame Movement
nnoremap <silent> <c-e> 7<c-e>
nnoremap <silent> <c-y> 7<c-y>

" Easier close window operation
nnoremap <silent> <c-c><c-c> :bd<cr>

" Easier Document Management
nnoremap <silent> <c-s> :w<cr>
" nnoremap <silent> <C-s> :w<cr>
nnoremap <silent> <c-q><c-q> :q!<cr>

nnoremap <silent> <c-c><c-v> :vsp<cr>
nnoremap <silent> <c-c><c-s> :sp<cr>
"nnoremap <silent> <c-A-s> :vsp<cr>
" }}}

" Tabs -- {{{
nnoremap <silent> <c-t> :tabnew<cr>

" Easier tab navigation
nnoremap <silent> <leader>[ :tabnext<cr>
nnoremap <silent> <leader>] :tabprevious<cr>
" nnoremap <silent> <c-w>[ :tabnext<cr>
" nnoremap <silent> <c-w>] :tabprevious<cr>

" }}}

" Folding -- {{{

" Make indent folding default
" set foldmethod=indent

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

" Commands for navigating to the previous and
" next closed folds
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

" nnoremap <silent> <c--> zM
" nnoremap <silent> <c-=> zR
nnoremap <silent> - zC
nnoremap <silent> = zO
nnoremap <silent> _ zM
nnoremap <silent> + zR

" }}}

" Vimrc Sourcing -- {{{

" Add mappings to make it easier to make it easier to edit
" (not my words; great quote)

let mapleader="\\"
" let mapleader = "\<Space>"
nmap <Space> <leader>

" NOTE: Changing this to reference configs in ~/.vim
" for convenience.
" nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>ve :vsplit $HOME/.vim/general.vim<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" }}}

" Mode Maps -- {{{

" Normal Mode -- {{{

" Format current buffer and save
" nmap <leader>f mqgg=G'q:w<cr>

" Clear highlighting after search
" nnoremap <silent> <leader>h :nohl<cr>
" nnoremap <leader>h :nohl<cr>
nnoremap <silent> <leader><esc> :nohl<cr>

" Remap \ from leader to normal key
" nnoremap <silent> <bslash> :echom "Hello!"<cr>

" }}}

" Insert Mode -- {{{
" Map jk to escape to normal mode
inoremap <silent> jk <esc>
"inoremap <silent> <esc> <nop>
"inoremap <silent> <c-c> <nop>
"inoremap <silent> <c-m> <nop>

"inoremap <silent> <c-g> <tab>
"inoremap <silent> <tab> <c-p>

imap <silent> <c-j> <cr>

" Save document
inoremap <c-s> <esc>:w<cr>
" }}}

" Visual Mode -- {{{

vnoremap <silent> <c-j> y
vnoremap <silent> // y/<c-r>"<cr>

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

" Motion maps for convenience
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-b> <left>
cnoremap <c-f> <right>

" }}}

" }}}

" Auto-Expanding -- {{{
" Taken from this Reddit thread:
" https://www.reddit.com/r/vim/comments/6h0dy7/which_autoclosing_plugin_do_you_use/
" inoremap (; (<cr>);<c-c>O
" inoremap (, (<cr>),<c-c>O
" inoremap (<cr> (<cr>)<c-c>O

" inoremap {; {<cr>};<c-c>O
" inoremap {, {<cr>},<c-c>O
" inoremap {<cr> {<cr>}<c-c>O

" inoremap [; [<cr>];<c-c>O
" inoremap [, [<cr>],<c-c>O
" inoremap [<cr> [<cr>]<c-c>O

" inoremap <silent> ( ()<c-c>i

" TODO: Come back to this later

" function! s:CloseBracket()
"   let line = getline('.')
"   if line =~# '^\s*\(struct\|class\|enum\)'
"     return "{\<Enter>};\<Esc>O"
"   elseif searchpair('(', '', ')', 'bmn', '', line('.'))
"     " Inside Function Call
"     return "{\<Enter>});\<Esc>O"
"   else
"     return "{\<Enter>}\<Esc>O"
"   endif
" endfunction
" inoremap <expr> {<Enter> <SID>CloseBracket()

let s:expandable_pairs = {'{': '}', '(': ')', '[': ']', "'": "'", '"': '"'}
function! CloseDelimiter(open, close)
  let line = getline('.')
  let c = line[col('.')-1]

  " let key = v:char
  " echo "Found Key: " . key
  " if has_key(s:expandable_pairs, open)
  "   return key . "\<c-c>" . "i"
  " else
  "   return key
  " endif
  return a:open . a:close . "\<Esc>i"
endfunction

" inoremap <expr> { CloseDelimiter()

function! AutoPairInit()
  for [open, close] in items(s:expandable_pairs)
    execute 'inoremap <buffer> <silent> '.open.' <c-r>=CloseDelimiter("'.open.'", "'.close.'")<cr>'
  endfor
endfunction

function! RebindSpace()

endfunction

function! AutoPairReturn()
  let line = getline('.')
endfunction

function! RebindEnter()
  execute 'inoremap <buffer> <silent> <cr> <sid>AutoPairReturn'
endfunction

" call AutoPairInit()

" au BufEnter * :call AutoPairInit()

" inoremap <silent> <buffer> " <C-O>:call Temp()<cr>


" }}}
