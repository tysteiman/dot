syntax on

set nonumber
set noswapfile
set nowrap
set incsearch
set hlsearch
set ignorecase
set smarttab
set laststatus=2
set shiftwidth=4
set tabstop=4
set softtabstop=4
set number
set cursorline

inoremap jk <esc>

nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <leader>q :bnext<cr>
nnoremap <leader>a :bprevious<cr>
nnoremap <leader>vv :e $MYVIMRC<cr>