syntax on

set nonumber
set noswapfile
set nowrap
set incsearch
set hlsearch
set ignorecase
set smarttab
set expandtab
set laststatus=0
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set path+=**
set wildmenu

nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

nnoremap gl $
nnoremap gh 0
nnoremap gi ^
nnoremap ge G

inoremap jk <esc>
