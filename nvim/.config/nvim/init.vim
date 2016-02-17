"=============================
" vim-plug: Vim plugin manager
" ============================

call plug#begin('~/.config/nvim/plugged')

" Sidebar
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Color schemes
Plug 'trusktr/seti.vim'
Plug 'tomasr/molokai'

" Statusbar
Plug 'bling/vim-airline'

" Syntax
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'rstacruz/sparkup', { 'for': ['html', 'xhtml'] }
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }
Plug 'honza/dockerfile.vim'
Plug 'lervag/vimtex'
Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'

" Tools
Plug 'matze/vim-move'
Plug 'burnettk/vim-angular'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'airblade/vim-gitgutter'
Plug 'KabbAmine/vCoolor.vim', { 'on': 'VCoolor' }



Plug 'matthewsimo/angular-vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

"==========================================
" Basic settings
"==========================================
set shell=/bin/zsh
set number
set laststatus=2
set showmode
set hidden
set autoread
set clipboard+=unnamed
set history=4096
set mouse=a
set scrolloff=5
let mapleader=','


"==========================================
" Navigation
"==========================================
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>


"==========================================
" Indent
"==========================================
set expandtab
set shiftwidth=0
set softtabstop=-1
set tabstop=4
autocmd FileType html,xhtml,ruby,coffee,sass,scss,haml,slim,vim,yaml,crystal setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css,javascript,javascript.jsx,snippets setlocal shiftwidth=4 softtabstop=4 tabstop=4

" indentLine
let g:indentLine_char = '┆'


"==========================================
" Search
"==========================================
set ignorecase
set smartcase
set incsearch
set wrapscan
set nohlsearch


"=============================
" NERDTree Config
" ============================
map <F2> :NERDTreeToggle<CR>

let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeDirArrowExpandable = '├'
let g:NERDTreeDirArrowCollapsible = '└'

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


"=============================
" Airline Config
" ============================
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'


"=================================================
" CtrlP
"=================================================
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

"let g:ctrlp_working_path_mode='r'
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


"=================================================
" Ultisnips & YCM
"=================================================
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']


set completeopt=longest,noselect,noinsert,menuone
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"=============================
" Surround
" ============================
map <C-s>" ysiw"eea
imap <C-s>" <Esc><C-s>"
map <C-s>' ysiw'eea
imap <C-s>' <Esc><C-s>'


"=================================================
" Syntastic
"=================================================
function s:find_jshintrc(dir)
    let l:found = globpath(a:dir, '.jshintrc')
    if filereadable(l:found)
        return l:found
    endif

    let l:parent = fnamemodify(a:dir, ':h')
    if l:parent != a:dir
        return s:find_jshintrc(l:parent)
    endif

    return "~/.jshintrc"
endfunction

function UpdateJsHintConf()
    let l:dir = expand('%:p:h')
    let l:jshintrc = s:find_jshintrc(l:dir)
    let g:syntastic_javascript_jshint_args = l:jshintrc
endfunction

au BufEnter * call UpdateJsHintConf()
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=6
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_debug = 0


"=================================================
" Buffer
"=================================================
nmap <C-t> :enew<cr>                        " new buffer
nmap <C-h> :bprevious<cr>                   " move to next buffer
nmap <C-l> :bnext<cr>                       " move to previous buffer
nmap <leader>bq :bp <BAR> bd #<cr>
nmap <leader>bl :ls<cr>


"=================================================
" Color und highlightning settings
"=================================================
syntax on
colorscheme molokai


"=================================================
" Color und highlightning settings
"=================================================
set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=1                             " Start folding automatically from level 1
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators



let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
filetype indent on
filetype plugin on
au BufRead /tmp/mutt-* set tw=72


