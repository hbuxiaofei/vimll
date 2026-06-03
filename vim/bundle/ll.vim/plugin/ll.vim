" To force clearing the undo information
" From MANUAL of undo
function! LLvimWriteWithCleareUndo()
  let s:old_undolevels = &undolevels
  set undolevels=-1
  exe "normal a \<BS>\<Esc>"
  let &undolevels = s:old_undolevels
  unlet s:old_undolevels
  exe "w"
endfunction
com! -bar WW cal LLvimWriteWithCleareUndo()

autocmd BufNewFile *.sh,*.py exec ":call LeeAutoSetFileHead()"
function! LeeAutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/usr/bin/env bash")
    elseif &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
	call append(1, "\# -*- coding: utf-8 -*-")
    endif
    normal G
    normal o
    normal o
endfunction

if filereadable("Kconfig") && filereadable("Kbuild")
    autocmd BufReadPost *.c,*.cpp set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
endif

function! LeeCtagsCscope()
    if $filetype == 'go'
        :silent !find . -name "*.go" >> cscope.files
    elseif &filetype == 'python'
        :silent !find . -name "*.py" >> cscope.files
    endif
    :silent !ctags -R --fields=+lS && cscope -Rbqk
endfunction

let s:nerdtree_buffer_number = 0
function! LeevimNERDTreeToggle()
  if g:NERDTree.IsOpen()
    exec "NERDTreeToggle"
    let s:nerdtree_buffer_number = exists('*bufnr') ? bufnr('%') : bufnr()
  else
    exec "NERDTreeFind"
    let s:nerdtree_buffer_number = 0
  endif
endfunction

function! LeevimAirlineCloseBuffer()
  let l:listed_count = len(getbufinfo({'buflisted': 1}))

  if l:listed_count <= 1
    echo "Last buffer, keep it open."
    return
  endif

  let l:current = bufnr('%')

  if &filetype ==# 'nerdtree' || (exists('t:NERDTreeBufName') && bufname('%') == t:NERDTreeBufName)
    return
  endif

  let l:alternate = bufnr('#')
  if buflisted(l:alternate)
    buffer #
  else
    bnext
  endif
  execute 'silent! bwipeout ' . l:current

  if exists('g:airline_buflist_cache')
    unlet g:airline_buflist_cache
  endif
  if exists(':AirlineRefresh')
    execute 'AirlineRefresh'
  endif

  redraw!
endfunction

function! LeevimAirlineCloseOtherBuffers()
  let l:buffer_cur_number = bufnr('%')
  let l:nt_bufnr = -1
  if exists('t:NERDTreeBufName')
    let l:nt_bufnr = bufnr(t:NERDTreeBufName)
  endif

  for l:buf in getbufinfo()
    let l:bufnr = l:buf.bufnr
    if l:bufnr == l:buffer_cur_number
      continue
    endif

    if l:bufnr == l:nt_bufnr
      continue
    endif

    if l:buf.loaded || l:buf.listed
      silent! execute 'bwipeout! ' . l:bufnr
    endif
  endfor

  if exists('g:airline_buflist_cache')
    unlet g:airline_buflist_cache
  endif

  if exists(':AirlineRefresh')
    execute 'AirlineRefresh'
  endif

  redraw!
endfunction
