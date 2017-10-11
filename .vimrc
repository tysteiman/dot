set nocompatible              " be iMproved, required"
filetype off                  " required"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'slim-template/vim-slim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'pangloss/vim-javascript'
Plugin 'StanAngeloff/php.vim'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'nanotech/jellybeans.vim'
Plugin 'ericbn/vim-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'

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

set guifont=menlo:h13
set t_Co=256
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
set shiftwidth=4
set tabstop=4
set softtabstop=4
set lbr
set tw=500
set nowrap
set noswapfile
set laststatus=2
set autoread
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set spell
color solarized

nnoremap <leader>vv :e $MYVIMRC<cr>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>1 :on<cr>
nnoremap <leader>bb :b#<cr>
nnoremap <leader>g :Gst<cr>
nnoremap <leader>pr :CtrlPClearAllCaches<cr>
nnoremap <leader>ff :copen<cr>
nnoremap <leader>fc :cclose<cr>
nnoremap <leader>cc :noh<cr>
nnoremap <leader>r :TagbarToggle<cr>
nnoremap <leader>s mm]s1z=`m
inoremap jk <esc>

"" Open some files with only 2 tabs
autocmd BufReadPost,BufNewFile *.rb execute "call SetCustomTabWidth()"
autocmd BufReadPost,BufNewFile *.rake execute "call SetCustomTabWidth()"
autocmd BufReadPost,BufNewFile Gemfile execute "call SetCustomTabWidth()"

"" Generic function for converting tab spaces to only 2 instead of default 4.
fu! SetCustomTabWidth()
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
endfu

"" Insert php tags when opening a new PHP file
autocmd BufNewFile *.php execute "normal! i<?php\<enter>\<enter>"
