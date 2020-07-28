" ==========================================================
" .config/nvim/init.vim
"
" NeoVIM Theme by Vix
"
" You are allowed to copy, edit and use it in your repo
" ==========================================================

filetype plugin indent on
syntax enable

set encoding=UTF-8
set guifont="Inconsolata Nerd Font 11"
set laststatus=2
set clipboard=unnamedplus

" Format code keybind Alt + Ctrl + F
map <A-C-f> gg=G<C-o><C-o>

" Line numbers, disable swap files, custom indentation, mouse input support
set number
set numberwidth=5
set ruler
set noswapfile
set mouse=a

" Indentation
set smarttab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ignorecase

" Use if you want to run vim in a terminal
set termguicolors
" Set dark for black background
set background=light

" Installs vim-plug for first time use
if ! filereadable(system('echo -n "$HOME/.config/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins"
    silent !mkdir -p $HOME/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $HOME/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Load vim-plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'fneu/breezy'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Disabled by default
let g:gitgutter_enabled=0
" Thin vertical indent lines customization
let g:indentLine_enabled = 1
" Use colorscheme conceal color 1 for no
let g:indentLine_setColors = 1
" Highlight color for indentation character
let g:indentLine_color_gui = '#31363b' " Use for brighter color #41474e
" Single indent character
let g:indentLine_char = '¦'
" Multiple characters for indentation (disabled)
" let g:indentLine_char_list = ['|','¦', '┆', '┊']

" Plugin keybinds
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NerdTreeFind<CR>
map <C-d> :GitGutterToggle<CR>

" Nerdtree start on empty window with no file in the editor
autocmd StdinReadPre * let s:std_in=1
" Open nerdtree on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Disable indent lines in nerdtree
autocmd BufEnter NERD_tree* :IndentLinesDisable
" Close vim if nerdtree is the only window left open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Removes clutter '?' for help
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
" Default nerdtree statusline
let NERDTreeStatusline = "%{exists('b:NERDTree')?b:NERDTree.root.path.str():''}"
" Disable nerdtree expandable icons
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

function NERDTreeHighlightFile(extension, fg, guifg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermfg='. a:fg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

augroup nerdtree
    call NERDTreeHighlightFile('config', 'none', '#fdbc4b')
    call NERDTreeHighlightFile('conf', 'none', '#fdbc4b')
    call NERDTreeHighlightFile('json', 'none', '#fdbc4b')
    call NERDTreeHighlightFile('properties', 'none', '#fdbc4b')
    call NERDTreeHighlightFile('rc', 'none', '#fdbc4b')
    call NERDTreeHighlightFile('ignore', 'none', '#fdbc4b')
    call NERDTreeHighlightFile('yml', 'none', '#783228')
    call NERDTreeHighlightFile('yaml', 'none', '#783228')
    call NERDTreeHighlightFile('md', 'none', '#8e44ad')
    call NERDTreeHighlightFile('html', 'none', '#f67400')
    call NERDTreeHighlightFile('hbs', 'none', '#ff5f5f')
    call NERDTreeHighlightFile('css', 'none', '#3daee9')
    call NERDTreeHighlightFile('js', 'none', '#b65619')
    call NERDTreeHighlightFile('php', 'none', '#1b668f')
    call NERDTreeHighlightFile('log', 'none', '#585858')
    call NERDTreeHighlightFile('sh', 'none', '#1d99f3')
    call NERDTreeHighlightFile('xml', 'none', '#1cdc9a')
    call NERDTreeHighlightFile('java', 'none', '#9b59b6')
augroup END

" Define colorscheme
colorscheme breezy

" Refined python highlight see for more https://github.com/fneu/breezy#refined-python-highlighting
" let python_highlight_all=1

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'breezy'

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Enable buffer names on the top of your vim window
let g:airline#extensions#tabline#enabled = 1
" Changes how your tabline shows the file path/name options:
" 'default', 'unique_tail', 'unique_tail_improved', 'short_path', 'foo'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Disables annoying trailing tab in the powerline for whitespaces
let g:airline#extensions#whitespace#enabled = 0

call plug#end()

" Delete trailing
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
