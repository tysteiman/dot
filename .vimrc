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
set termguicolors
set number

inoremap jk <esc>

nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <leader>q :bnext<cr>
nnoremap <leader>a :bprevious<cr>

call plug#begin()

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  Plug 'sheerun/vim-polyglot'

  Plug 'joshdick/onedark.vim'

  Plug 'vim-airline/vim-airline'

call plug#end()

nnoremap <c-p> :FZF<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

color onedark
