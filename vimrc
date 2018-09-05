source ~/.vim/bundles.vim

" show line number
set number

" search
set hlsearch
set ignorecase
set smartcase

" indentation
set autoindent
set smartindent     " smart indent
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set expandtab       " use space when <Tab>


" encoding dectection
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set langmenu=zh_CN.UTF-8

" use unix as the standard file tpe
set ffs=unix,dos,mac

" enable syntax hightlight and completion
syntax on

" colorscheme
set t_Co=256
colorscheme molokai

" remain screen after exsit
set t_ti= t_te=

" always show the status line - use 2 lines for the status bar
set laststatus=2

" neoComplCache 
" 在系统启动的时候启动
let g:neocomplcache_enable_at_startup = 1
" 提示的时候默认选择地一个
let g:neocomplcache_enable_auto_select = 1


" tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_sort = 0
let g:tagbar_compact = 1


" nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"  remove unwanted whitespace
"  However, this has minor side-effects, such as influencing undo history 
"  and sometimes changing scroll position.
"  http://vim.wikia.com/wiki/Remove_unwanted_spaces
function StripTrailingWhitespace()
	if !&binary && &filetype != 'diff'
		normal mz
		normal Hmy
		%s/\s\+$//e
		normal 'yz<CR>
		normal `z
	endif
endfunction

" keybindings for plugin toggle
nmap <F6> :NERDTreeToggle<cr>
nmap <F7> :TagbarToggle<cr>

