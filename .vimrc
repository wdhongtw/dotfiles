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
call matchadd('ErrorMsg', '\%>80v.\+')
call matchadd('ErrorMsg', '\s\+$')

set textwidth=80
set formatoptions=c,q,r,t

" Enable folding feature
set nofoldenable
set foldmethod=syntax
nnoremap <S-j> zj
nnoremap <S-k> zk

" Functions
:command! Tab2Space execute '%s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! Space2Tab execute '%s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
:command! RemoveTWS execute '%s/\s\+$//e'

" Tab navigation
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-PageUp> :tabprevious<CR>
nnoremap <C-PageDown> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>

" Use .vim/swapfiles to keeps .swp files
if !isdirectory($HOME . "/.vim/swap")
    call mkdir($HOME . "/.vim/swap", "p")
endif
set directory=~/.vim/swap//

" Source other config files from .vimrc.d
runtime! vimrc.d/*.vim
