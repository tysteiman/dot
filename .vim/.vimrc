"set t_Co=256
set background=dark
syntax on
set number
set hlsearch
set nocompatible
set ai
set history=700
set wildmenu
set ruler
set cmdheight=1
set hid
set ignorecase
set smartcase
set incsearch
set lazyredraw
set magic
set t_vb =
set tm=500
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set wrap
set noswapfile
set laststatus=2
set autoread
filetype indent on

inoremap <c-\>if () {<Enter>}<Esc>bbf)i
inoremap <c-\>e else {<Enter>}<Esc>O
inoremap <c-\>r if<Enter>else<Enter>end<Esc>kka<space>
inoremap <c-\>f for($i = 0; $i < lessthan; $i++){<Enter>}<Esc>k0f<wviw

nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
noremap = dd
noremap - ddp
noremap _ ddkP
noremap <silent><leader>2 :NumbersToggle<CR>
noremap <silent><leader>a :spellr<CR>
noremap <silent><leader>b :TagbarToggle<CR>
noremap <leader>C :Econtroller <CR>
noremap <leader>g :Gst <CR>
noremap <leader>k :Rake <CR>
noremap <leader>l :/\%>80v.\+<CR>
noremap <leader>M :Emodel <CR>
noremap <silent><leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
noremap <silent><leader>r :AirlineRefresh<CR>
noremap <silent><leader>s :set nospell<CR>
noremap <silent><leader>t :tselect<CR>
noremap <leader>V :Eview <CR>
noremap <leader>w :StripWhitespace<CR>
nnoremap <leader>sop :source %<CR>

"Pathogen
execute pathogen#infect()

noremap <silent><C-n> :NERDTreeToggle<CR>

"setglobal spell spelllang=en_us
"set spell

color jellybeans

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


""" Quick spell fix
function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<CR>

""" Move md element to top of paragraph
nnoremap <leader>mm :normal! kmmjdd{p`m<CR>

""" Make line md first header
nnoremap <leader>u1 :normal! yypVr=<CR>
""" Make line md second header
nnoremap <leader>u2 :normal! yypVr-<CR>
""" Make line md third header
nnoremap <leader>u3 :normal! I###<space><CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

