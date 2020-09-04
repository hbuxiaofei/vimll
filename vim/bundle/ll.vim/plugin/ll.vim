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

if ((filereadable("Kconfig"))&&(filereadable("Makefile")))
    au! BufRead *.c,*.cpp |
        set tabstop=8 |
        set softtabstop=8 |
        set shiftwidth=8 |
        set noexpandtab
endif

function! LeeCtagsCscope()
    if $filetype == 'go'
        :silent !find . -name "*.go" >> cscope.files
    elseif &filetype == 'python'
        :silent !find . -name "*.py" >> cscope.files
    endif
    :silent !ctags -R --fields=+lS && cscope -Rbqk
endfunction
