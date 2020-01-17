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
nmap <F8> :call LeeCtagsCscope()<cr>

<C-p>  : List files
<C-]>  : Go to function define, for c, c++ or golang
<C-t>  : Go back position of stack, for c, c++ or golang
<C-l>  : Code completion only for golang
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

nmap <leader>n   :Go to function define, only for python
```

### Cscope
```shell
<C-\>t  : Match string
<C-\>s  : Match symbol exclude comment
```

### Command
```shell
Dox       : Add comment for function
DoxAuthor : Add comment for source file
DoxLic    ：Add license for source file
```
