filetype plugin indent on
syntax enable

" Line numbers, disable swap files, custom indentation, mouse input support
set number
set numberwidth=5
set ruler
set list
set noswapfile
set mouse=a

" Indentation
set smarttab
set autoindent
set shiftwidth=2
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set ignorecase

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle with Ctrl + n
map <C-n> :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1

" Breezy
set termguicolors
set background=light
colorscheme breezy
let python_highlight_all=1

Plug 'fneu/breezy'

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'breezy'

" Enable buffer names on the top of the terminal
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#whitespace#enabled = 0

let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

call plug#end()

" Delete trailing
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
