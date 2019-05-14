" .vimrc

filetype on
filetype plugin on
filetype indent on
syntax on

" ==== UI Config ====
set showcmd
set number
set background=dark
set cursorline

" ==== Ruler & Status Line ====
set laststatus=2
set ruler

" ==== Searching ====
set hlsearch
set incsearch
set ignorecase
set smartcase

" ==== Others ====
set backspace=2
set scrolloff=2
set autoindent

" Mark trailing space and line longer than 80 char
" Visual group have great default background color
au BufWinEnter * let w:m1=matchadd('Visual', '\%>80v.\+')
au BufWinEnter * let w:m2=matchadd('Visual', '\s\+$')

set formatoptions=c,q,r,t

" Enable folding feature
set nofoldenable
set foldmethod=syntax

" Functions
:command! Tab2Space execute '%s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! Space2Tab execute '%s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
:command! RemoveTWS execute '%s/\s\+$//e'

" Timeout stuffs
set ttimeoutlen=50

" Buffer navigation and options
set hidden

" Prepand .vimrc.d to runtimepath
set runtimepath^=~/.vimrc.d
