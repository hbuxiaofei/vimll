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
Bundle 'Yggdroot/indentLine'

filetype plugin indent on     " required!

