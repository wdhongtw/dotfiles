" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
" set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

filetype on
filetype plugin on
filetype indent on
" Set extension for markdown file
autocmd BufNewFile,BufRead *.md  set filetype=markdown

syntax on

" ==== Remap ====
" Split navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-w> <C-w><C-w>
" Disable search highlight, a dirty hack
"execute "set <M-u>=\eu"
"nnoremap <M-u> :noh<CR>

" ==== Spaces & Tabs ====
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
autocmd FileType make set noexpandtab

" ==== UI Config ====
set showcmd
set number
set relativenumber
set background=dark
set cursorline

"highlight clear StatusLine
"highlight clear ModeMsg
"autocmd InsertEnter * highlight StatusLine ctermfg=Red
"autocmd InsertLeave * highlight clear StatusLine
"autocmd InsertEnter * highlight ModeMsg ctermfg=Red
"autocmd InsertLeave * highlight clear ModeMsg

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
"autocmd BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+')
"autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\s\+$')
"autocmd BufWinLeave * call matchdelete(w:m1)
"autocmd BufWinLeave * call matchdelete(w:m2)

set textwidth=80
set formatoptions=c,q,r,t
" c     Auto-wrap comments using textwidth, inserting the
"       current comment leader automatically.
" q     Allow formatting of comments with "gq".
" r     Automatically insert the current comment leader
"       after hitting <Enter> in Insert mode.
" t     Auto-wrap text using textwidth (does not apply to comments)

" Enable folding feature
set nofoldenable
set foldmethod=syntax
autocmd FileType python set foldmethod=indent
autocmd FileType xml set foldmethod=indent

" Functions
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
