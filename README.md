# The LeeLei vimrc configuration

This is a distribution of vim plugins for CentOS8.x or later, supporting language c, c++, python, golang  and shell.

## How to install

```shell
# ./install.sh
```

## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `/`, so whenever you see `<leader>` it means `/`.

### Key Maps
```shell
nmap <F3> :cp<cr>
nmap <F4> :cn<cr>

nmap <F5> :TagbarToggle<cr>
nmap <F6> :call AutoloadcsQuickfixToggle()<cr>
nmap <F7> :NERDTreeToggle<cr>
nmap <F8> :call LeeCtagsCscope()<cr>  :Create ctags and cscope.out files

<C-p>  :List files
<C-]>  :Go to function define, for c, c++ or golang
<C-t>  :Go back position of stack, for c, c++ or golang
<C-l>  :Code completion only for golang
```

### Leaders
```shell
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
nmap <Leader>+ :bd<cr>

nmap <leader>cc :NERDComYankComment<cr>
nmap <leader>cs :NERDComSexyComment<cr>
nmap <leader>cu :NERDComUncommentLine<cr>

nmap <leader>m :MarkSet<cr>
nmap <leader>M :MarkClear<cr>
```

## Jedi-vim
```shell
<leader>g :Goto assignments (typical goto function)
<leader>d :Goto definitions (follow identifier as far as possible, includes imports and statements)
K         :Show Documentation/Pydoc (shows a popup with assignments)
<leader>r :Renaming
<leader>n :Usages (shows all the usages of a name)
Open module, e.g. :Pyimport os (opens the os module)
```

### Cscope
```shell
<C-\>s  : Find this C symbol
<C-\>t  : Find this text string
<C-\>g  : Find this global definition
<C-\>d  : Find functions called by this function
<C-\>c  : Find functions calling this function
```

### Command
```shell
Dox       : Add comment for function
DoxAuthor : Add comment for source file
DoxLic    ：Add license for source file
```
