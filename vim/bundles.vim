set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'll.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'vim-airline/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'lfv89/vim-interestingwords'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'fatih/vim-go'
Bundle 'vim-scripts/DrawIt'
Bundle 'aklt/plantuml-syntax'
Bundle 'weirongxu/plantuml-previewer.vim'

filetype plugin indent on     " required!

