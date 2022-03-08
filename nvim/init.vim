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
set relativenumber
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
nnoremap <leader>bb :Git blame<cr>
nnoremap <leader>gg :Git<cr>

call plug#begin()

  " Plug 'junegunn/fzf.vim'
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'sheerun/vim-polyglot'

  Plug 'joshdick/onedark.vim'

  Plug 'vim-airline/vim-airline'

  Plug 'airblade/vim-gitgutter'

  Plug 'tpope/vim-fugitive'

  Plug 'mattn/emmet-vim'

  Plug 'ntpeters/vim-better-whitespace'

  Plug 'prettier/vim-prettier'

call plug#end()

" nnoremap <c-p> :Files<cr>
" nnoremap <leader>fg :Rg<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Prettier
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

color onedark
