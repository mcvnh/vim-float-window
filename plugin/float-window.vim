function! OpenFloatTerm(...)
  let height = float2nr((&lines - 2) / 1.5)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns / 1.5)
  let col = float2nr((&columns - width) / 2)

  " Border Window
  let border_opts = {
    \ 'relative': 'editor',
    \ 'style': 'minimal',
    \ 'width': width + 4,
    \ 'height': height + 2,
    \ 'col': col - 2,
    \ 'row': row - 1,
    \ }

  let border_buf = nvim_create_buf(v:false, v:true)
  let s:border_win = nvim_open_win(border_buf, v:true, border_opts)

  " Main Window
  let opts = {
    \ 'relative': 'editor',
    \ 'style': 'minimal',
    \ 'width': width,
    \ 'height': height,
    \ 'col': col,
    \ 'row': row,
    \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif

  startinsert

  autocmd TermClose * ++once :bd! | call nvim_win_close(s:border_win, v:true)
endfunction
