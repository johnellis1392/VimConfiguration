let s:target = ""
let s:last_selected_pane = ""
let s:retry_send = ""
let s:spaces = repeat(" ", 4)

function! g:_TmuxPickPaneFromBuf() abort
  let line = getline(".")
  let pane_match = matchlist(line, '\(^[^ ]\+\)\: ')
  if len(pane_match) == 0
    echo "Please select a pane with enter or exit with 'q'"
    return
  endif
  let target_pane = pane_match[1]
  hide
  let s:target = target_pane
  let s:last_selected_pane = target_pane
  if len(s:retry_send) !=# 0
    call tmux#send(s:retry_send)
    let s:retry_send = ""
  endif
endfunction

" Select Tmux Pane for sending APL lines. Copied from ghci.vim
function! tmux#SelectPane() abort
  if len(s:target) !=# 0
    return
  endif

  belowright new
  set filetype=sh
  call setline(1, "# Select Pane (Esc/q to cancel): ")
  call setline(2, "")

  if len(s:last_selected_pane) != 0
    call setline(3, s:last_selected_pane . ": (last-used pane)")
  endif

  normal! G
  if !exists("g:slimux_pane_format")
    let g:slimux_pane_format = '#{session_name}:#{window_index}.#{pane_index}: #{window_name}: #{pane_title} [#{pane_width}x#{pane_height}] #{?pane_active,(active),}'
  endif

  let l:format = '#{pane_id}: ' . g:slimux_pane_format
  let l:command = "read !tmux list-panes -F '" . escape(l:format, '#') . "'"
  if !exists("g:slimux_select_from_current_window") || g:slimux_select_from_current_window != 1
    let l:command .= ' -a'
  endif

  execute l:command . ' | cat'
  execute min([ 10, line('$') ]) . 'wincmd _'
  call setpos(".", [0, 3, 0, 0])
  setlocal bufhidden=wipe buftype=nofile
  setlocal nobuflisted nomodifiable noswapfile nowrap
  setlocal cursorline nocursorcolumn

  nnoremap <buffer> <silent> q :hide<CR>
  nnoremap <buffer> <silent> <ESC> :hide<CR>
  nnoremap <buffer> <silent> <Enter> :call g:_TmuxPickPaneFromBuf()<CR>
  nnoremap <buffer> <silent> d :call system("tmux display-names")<CR>
endfunction

function! tmux#do(cmd, ...) abort
  if a:0
    return system("tmux ".a:cmd." -t ".s:target." ".a:1)
  endif
  return system("tmux ".a:cmd." -t ".s:target)
endfunction

function! s:EscapeText(text) abort
  return substitute(shellescape(a:text), "\\\\\\n", "\n", "g")
endfunction

function! tmux#send(text) abort
  if s:target ==# ""
    let s:retry_send = a:text
    call tmux#SelectPane()
    return
  endif

  let s:sent_text_length_limit = 1000
  let text = a:text

  while text != ""
    let local_text = strpart(text, 0, s:sent_text_length_limit)
    let text = strpart(text, s:sent_text_length_limit)
    let local_text = s:EscapeText("\<C-U>".local_text)
    call system("tmux set-buffer -- ".local_text)
    call tmux#do("paste-buffer")
  endwhile
endfunction

function! tmux#escape(text) abort
  let l:text = substitute(a:text, "\t", s:spaces, "g")
  let l:lines = split(l:text, "\n")
  " let l:lines = StripComments(l:lines)
  " let l:lines = ProcessLines(l:lines)
  return join(l:lines, "\n")."\n"
endfunction

function! tmux#sendcode(text) abort
  let text = tmux#escape(a:text)
  call tmux#send(text)
endfunction

function! tmux#sendfile() abort
  normal! mzgg"zyG'z
  let text = @z
  call tmux#send(text)
  let @z = ""
endfunction

function! g:Get_visual_selection() abort
  let [lnum1, col1] = getpos("'<'")[1:2]
  let [lnum2, col2] = getpos("'>'")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2-(&selection=='inclusive'?1:2)]
  let lines[0] = lines[0][col1-1:]
  return join(lines, "\n")
endfunction

function! tmux#sendselection() abort
  let text = g:Get_visual_selection()
  call tmux#sendcode(text)
endfunction

command! TmuxREPLSendLine call tmux#sendcode(getline(".") . "\n")
command! TmuxREPLSendFile call tmux#sendfile()
command! -range TmuxREPLSendSelection call tmux#sendselection()
nnoremap <silent> zl :TmuxREPLSendLine<CR>
nnoremap <silent> zL :TmuxREPLSendFile<CR>
vnoremap <silent> zl :TmuxREPLSendSelection<CR>
