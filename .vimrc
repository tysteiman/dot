set nocompatible              " be iMproved, required"
filetype off                  " required"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'StanAngeloff/php.vim'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mxw/vim-jsx'
Plugin 'jlanzarotta/bufexplorer'

" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" to ignore plugin indent changes, instead use:
"filetype plugin on
"
" brief help
" :pluginlist       - lists configured plugins
" :plugininstall    - installs plugins; append `!` to update or just :pluginupdate
" :pluginsearch foo - searches for foo; append `!` to refresh local cache
" :pluginclean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for faq
" put your non-plugin stuff after this line

set foldlevelstart=0
syntax on
set nonumber
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
set shiftwidth=4
set tabstop=4
set softtabstop=4
set lbr
set tw=500
set nowrap
set noswapfile
set laststatus=2
set autoread

" color jellybeans
color desert

nnoremap <leader>vv :e $MYVIMRC<cr>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <leader>1 :on<cr>
nnoremap <leader>r 5<C-w>>
nnoremap <leader>l 5<C-w><
nnoremap <leader>w :StripWhitespace<cr>

inoremap jk <esc>

"" Open some files with only 2 tabs
autocmd BufReadPost,BufNewFile *.rb execute "call SetCustomTabWidth()"
autocmd BufReadPost,BufNewFile *.rake execute "call SetCustomTabWidth()"
autocmd BufReadPost,BufNewFile *.yml execute "call SetCustomTabWidth()"
autocmd BufReadPost,BufNewFile Gemfile execute "call SetCustomTabWidth()"

"" Generic function for converting tab spaces to only 2 instead of default 4.
fu! SetCustomTabWidth()
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
endfu

"" Insert php tags when opening a new PHP file
autocmd BufNewFile *.php execute "normal! i<?php\<enter>\<enter>"
