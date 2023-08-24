syntax on

set noswapfile
set nowrap
set incsearch
set hlsearch
set ignorecase
set smarttab
set expandtab
set laststatus=2
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set path+=**
set path-=/usr/include
set wildmenu
set relativenumber
set number

nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

nnoremap gh 0
nnoremap gl $
nnoremap gi ^

let mapleader=" "

" nnoremap <leader>tn :tabnew<cr>
" nnoremap <leader>tm :tabmove
" nnoremap <leader>tc :tabclose<cr>
" nnoremap <leader>to :tabonly<cr>

inoremap jk <esc>

function Set_2_Spaces()
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
endfunction

au Filetype ruby call Set_2_Spaces()
au Filetype yaml call Set_2_Spaces()
