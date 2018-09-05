source ~/.vim/bundles.vim

set number

" search
set hlsearch
set ignorecase
set smartcase

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set expandtab       " use space when <Tab>


" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable syntax hightlight and completion
syntax on


" NeoComplCache 
" 在系统启动的时候启动
let g:neocomplcache_enable_at_startup = 1
" 提示的时候默认选择地一个
let g:neocomplcache_enable_auto_select = 1


" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1


" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Colorscheme
set t_Co=256
colorscheme molokai

" Keybindings for plugin toggle
nmap <F6> :NERDTreeToggle<cr>
nmap <F7> :TagbarToggle<cr>

