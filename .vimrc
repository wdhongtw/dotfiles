" .vimrc

filetype on
filetype plugin on
filetype indent on
syntax on

" Set extension for markdown file
autocmd BufNewFile,BufRead *.md  set filetype=markdown

" ==== Remap ====
" Split navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-w> <C-w><C-w>

" ==== Spaces & Tabs ====
set tabstop=8
set shiftwidth=4
set expandtab
set smarttab
autocmd FileType c,cpp set shiftwidth=2
autocmd FileType html,css,javascript set shiftwidth=2
autocmd FileType java set shiftwidth=2
autocmd FileType sh set shiftwidth=2
autocmd FileType make set noexpandtab

" ==== UI Config ====
set showcmd
set number
set background=dark
set cursorline

" ==== Ruler & Status Line ====
set laststatus=1
set ruler
set rulerformat=%30(%-15.15(%f%m%)%10.10(%5.5l,%-4.4v%)%5.5(%P%)%)
set fillchars=stl:\ ,stlnc:\ ,fold:-

" ==== Searching ====
set hlsearch
set incsearch
set ignorecase
set smartcase

" ==== Others ====
set backspace=2
set scrolloff=2
set autoindent
autocmd FileType c set cindent

" Mark trailing space and line longer than 80 char
call matchadd('ErrorMsg', '\%>80v.\+')
call matchadd('ErrorMsg', '\s\+$')

set textwidth=80
set formatoptions=c,q,r,t

" Enable folding feature
set nofoldenable
set foldmethod=syntax
autocmd FileType java set foldmethod=indent
autocmd FileType javascript set foldmethod=indent
autocmd FileType python set foldmethod=indent
autocmd FileType sh set foldmethod=indent
autocmd FileType xml set foldmethod=indent
nnoremap <S-j> zj
nnoremap <S-k> zk

" Functions
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
