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
    let s:nerdtree_buffer_number = buffer_number()
  else
    exec "NERDTreeFind"
    let s:nerdtree_buffer_number = 0
  endif
endfunction

function! LeevimAirlineBufferClose()
  let l:buffer_cur_number = buffer_number()
  if g:NERDTree.IsOpen()
    if l:buffer_cur_number == s:nerdtree_buffer_number
      return
    endif
  endif
  exe "bn"
  exe "bd " . l:buffer_cur_number
endfunction
