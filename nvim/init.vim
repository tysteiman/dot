syntax on

set nonumber
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
set termguicolors
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
nnoremap <leader>vb :e ~/.bashrc<cr>
nnoremap <leader>vt :e ~/.tmux.conf<cr>

call plug#begin()

  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  Plug 'sheerun/vim-polyglot'

  Plug 'joshdick/onedark.vim'

  Plug 'vim-airline/vim-airline'

  Plug 'airblade/vim-gitgutter'

  Plug 'tpope/vim-fugitive'

  Plug 'mattn/emmet-vim'

  Plug 'ntpeters/vim-better-whitespace'

call plug#end()

nnoremap <c-p> :Files<cr>
nnoremap <leader>fg :Rg<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" let g:fzf_preview_window = ['right:50%', 'ctrl-/']

color onedark
