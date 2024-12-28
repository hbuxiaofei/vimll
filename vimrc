source ~/.vim/bundles.vim

" show line number
set number

" search
set hlsearch
set ignorecase
set smartcase
set incsearch

" indentation
set autoindent
set smartindent     " smart indent
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set expandtab       " use space when <Tab>
set colorcolumn=80
set backspace=indent,eol,start


" encoding dectection
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set langmenu=zh_CN.UTF-8

" use unix as the standard file tpe
set ffs=unix,dos,mac

" enable syntax hightlight and completion
syntax on
set completeopt=menu

" hightlight current line
set cursorline

" colorscheme
colorscheme molokai
set t_Co=256

" remain screen after exsit
set t_ti= t_te=

" always show the status line - use 2 lines for the status bar
set laststatus=2

" golang
let g:go_version_warning = 0

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 0

" tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_sort = 0
let g:tagbar_compact = 1
nmap <F5> :TagbarToggle<cr>

" nerdtree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <silent> <F7> :call LeevimNERDTreeToggle()<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
nmap <silent> <leader>+ :call LeevimAirlineBufferClose()<CR>

" ctrlp
let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_match_window = 'min:1,max:15,results:100'

" ag.vim
let g:ag_prg = "rg --column -e"
noremap <Leader>fa :<C-U><C-R>=printf("Ag \"%s\"", expand("<cword>"))<CR>

" indentLine
let g:indentLine_enable = 1
let g:indentLine_char = '¦'
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_term = 239

" nerdcommenter
let g:NERDSpaceDelims = 1

" doxygentoolkit
let g:DoxygenToolkit_briefTag_funcName = "yes"

function! ReplaceTab()
	if !&binary && &filetype != 'diff'
		:%ret! 4
	endif
endfunction

" remove unwanted whitespace
" https://github.com/spf13/spf13-vim.git
function! StripTrailingWhitespace()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
autocmd BufWritePre * call StripTrailingWhitespace()

autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if has("cscope") && filereadable("/usr/bin/cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

nmap <F3> :cp<cr>
nmap <F4> :cn<cr>
nmap <F6> :call AutoloadcsQuickfixToggle()<cr>
nmap <F8> :call LeeCtagsCscope()<cr>
