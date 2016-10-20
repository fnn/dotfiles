"===================================================================================
" vim-plug: Vim plugin manager
"===================================================================================

call plug#begin('~/.config/nvim/plugged')

" Sidebar
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Color schemes
Plug 'josuegaleas/jay'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'othree/html5.vim', { 'for': ['html', 'xhtml'] }
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xhtml'] }
Plug 'othree/yajs.vim'
Plug 'elzr/vim-json'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }
Plug 'hdima/python-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mhartington/vim-angular2-snippets'

"Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mhartington/deoplete-typescript', { 'for': ['typescript'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
Plug 'othree/csscomplete.vim', { 'for': ['css', 'sass', 'scss', 'less'] }

" Tools
Plug 'matze/vim-move'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
"Plug 'Yggdroot/indentLine' " Causes lags while scrolling
Plug 'chemzqm/mycomment.vim'
Plug 'tpope/vim-fugitive'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()


"===================================================================================
" Basic settings
"===================================================================================
set shell=/bin/zsh
set laststatus=2
set relativenumber
set showmode
set hidden
set autoread
set clipboard+=unnamed
set history=4096
set mouse=a
set scrolloff=10
set cursorline
let mapleader=','


"===================================================================================
" Navigation
"===================================================================================
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>


"===================================================================================
" Indent
"===================================================================================
set expandtab
set shiftwidth=0
set softtabstop=-1
set tabstop=4
autocmd FileType html,xhtml,ruby,coffee,sass,scss,haml,slim,vim,yaml,crystal setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css,javascript,javascript.jsx,typescript,snippets setlocal shiftwidth=2 softtabstop=2 tabstop=2

"let g:indentLine_color_term = 239
"let g:indentLine_char = '│'


"===================================================================================
" Search
"===================================================================================
set ignorecase
set smartcase
set incsearch
set wrapscan
set nohlsearch


"===================================================================================
" NERDTree Config
"===================================================================================
map <F2> :NERDTreeToggle<CR>

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 35
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

let NERDTreeIgnore = ['.git$', 'node_modules']

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" close vim if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"===================================================================================
" Airline
"===================================================================================
let g:airline_theme='distinguished'
let g:airline_powerline_fonts=0
let g:airline_extensions=['tabline']
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_left_sep = '░'
let g:airline_right_sep = '░'


"===================================================================================
" FZF
"===================================================================================
let g:fzf_layout = { 'window:': 'enew' }

map <leader>p :Files<cr>


"===================================================================================
" Deoplete & UltiSnips
"===================================================================================
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
"let g:deoplete#disable_auto_complete=1
 
let g:deoplete#omni#functions={}
let g:deoplete#omni#functions.javascript=[
  \ 'jspc#omni'
\]
let g:deoplete#omni#functions.css='csscomplete#CompleteCSS'

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'file', 'neosnippet']

inoremap <expr><TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
imap <expr><c-j> neosnippet#expandable_or_jumpable() ?
		\ "\<Plug>(neosnippet_expand_or_jump)" : ""

"autocmd MyAutoCmd CompleteDone * pclose!


"===================================================================================
" Neomake
"===================================================================================
"sudo pip2/pip3 install vulture -U
"sudo pip2/pip3 install flake8 -U
let g:neomake_python_enabled_makers=['flake8', 'vulture']

" run on every write
"autocmd! BufWritePost * Neomake


"===================================================================================
" Tern
"===================================================================================



"===================================================================================
" Buffer
"===================================================================================
nmap <C-t> :enew<cr>                        " new buffer
nmap <C-h> :bprevious<cr>                   " move to next buffer
nmap <C-l> :bnext<cr>                       " move to previous buffer
nmap <leader>bw :bp <BAR> bd #<cr>
nmap <leader>bl :ls<cr>


"===================================================================================
" Color und highlightning settings
"===================================================================================
syntax on
colorscheme jay
let g:used_javascript_libs = 'jquery,underscore,angularjs'
let python_highlight_all = 1


"===================================================================================
" Folding
"===================================================================================
set foldmethod=syntax
set foldlevelstart=20
let javascript_fold=1


"===================================================================================
" Spelling
"===================================================================================
map <F4> :setlocal spell! spelllang=en_u<CR>
hi clear SpellBad
hi SpellBad cterm=underline


let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
filetype indent on
filetype plugin on
au BufRead /tmp/mutt-* set tw=72

