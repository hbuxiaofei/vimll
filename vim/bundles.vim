set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'll.vim'
" Bundle 'Shougo/neocomplcache'
Bundle 'vim-airline/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'rking/ag.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'lfv89/vim-interestingwords'
Bundle 'MattesGroeger/vim-bookmarks'

" 细垂直线展示代码缩进
Bundle 'Yggdroot/indentLine'

" 特定区块进行注释/反注释
Bundle 'scrooloose/nerdcommenter'

" Bundle 'vim-scripts/DoxygenToolkit.vim'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'fatih/vim-go'
Bundle 'vim-scripts/DrawIt'
Bundle 'octol/vim-cpp-enhanced-highlight'

filetype plugin indent on     " required!

