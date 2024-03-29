syntax on

set noswapfile
set nowrap
set incsearch
set hlsearch
set ignorecase
set smarttab
set expandtab
set laststatus=0
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set path+=**
set path-=/usr/include
set wildmenu
set norelativenumber
set nonumber
set autoread

" What is this?
set rtp+=/opt/homebrew/opt/fzf

let mapleader=" "

nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

nnoremap gh 0
nnoremap gl $
nnoremap gi ^
nnoremap gs ^
nnoremap ge G

" Format current file with Prettier
nnoremap <leader>P :%!prettier --config .prettierrc %<CR>

" Set syntax fold method for navigating JSON files
nnoremap <leader>F :set foldmethod=syntax<CR>

inoremap jk <esc>

function Set_4_Spaces()
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal softtabstop=4
endfunction

au Filetype php call Set_4_Spaces()
au Filetype java call Set_4_Spaces()
