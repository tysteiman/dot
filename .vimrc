set nocompatible              " be iMproved, required"
filetype off                  " required"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'StanAngeloff/php.vim'
Plugin 'mattn/emmet-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mxw/vim-jsx'
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()            " required
filetype plugin indent on    " required

set foldlevelstart=0
syntax on
set hlsearch
set foldmethod=marker
set ai
set ignorecase
set smartcase
set incsearch
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set lbr
set nowrap
set noswapfile

color desert

nnoremap <leader>vv :e $MYVIMRC<cr>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
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
