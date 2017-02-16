" Plugins {{{

" Vundle {{{

set nocompatible              " be iMproved, required"
filetype off                  " required"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Packages {{{

Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'slim-template/vim-slim'
Plugin 'sk1418/last256'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ntpeters/vim-better-whitespace'

" }}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}

" Airline {{{

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" }}}

" }}}
" Sets {{{

set t_Co=256
set guifont=Monaco:h14
set background=dark
set foldlevelstart=0
syntax on
set number
set magic
set hlsearch
set foldmethod=marker
set ai
set history=700
set ruler
set cmdheight=1
set hid
set ignorecase
set smartcase
set incsearch
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set tw=500
set wrap
set noswapfile
set laststatus=2
set autoread
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
color last256
let g:airline_theme='term'

" }}}
" Remaps {{{

nnoremap <leader>vv :e $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>bd :bufdo bd<cr>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>w :StripWhitespace<cr>
nnoremap <leader>1 :on<cr>
nnoremap <leader>c :e %:h
inoremap jk <esc>

" }}}
