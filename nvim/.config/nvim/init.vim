"===================================================================================
" vim-plug: Vim plugin manager
"===================================================================================

call plug#begin('~/.config/nvim/plugged')

" Sidebar
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Color schemes
Plug 'tomasr/molokai'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'othree/html5.vim', { 'for': ['html', 'xhtml'] }
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xhtml'] }
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss', 'less'] }
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }


" Tools
Plug 'Shougo/deoplete.nvim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs'
Plug 'matze/vim-move'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chemzqm/mycomment.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


"===================================================================================
" Basic settings
"===================================================================================
set shell=/bin/zsh
set number
set laststatus=2
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
autocmd FileType css,javascript,javascript.jsx,snippets setlocal shiftwidth=2 softtabstop=2 tabstop=2


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


"===================================================================================
" Airline
"===================================================================================
let g:airline_theme='distinguished'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_left_sep = '░'
let g:airline_right_sep = '░'


"===================================================================================
" CtrlP
"===================================================================================
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

"let g:ctrlp_working_path_mode='r'
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


"===================================================================================
" Deoplete & UltiSnips
"===================================================================================
set completeopt=longest,noselect,noinsert,menuone
" let g:deoplete#disable_auto_complete = 1
let g:deoplete#enable_at_startup=1
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

" Next menu item, expand snippet, jump to next placeholder or insert literal tab
let g:UltiSnipsJumpForwardTrigger="<NOP>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrJumpForwardOrReturnTab()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<TAB>"
    endif
endfunction
inoremap <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ "<C-R>=ExpandSnippetOrJumpForwardOrReturnTab()<CR>"

" jump to next placeholder otherwise do nothing
snoremap <buffer> <silent> <TAB>
    \ <ESC>:call UltiSnips#JumpForwards()<CR>

" previous menu item, jump to previous placeholder or do nothing
let g:UltiSnipsJumpBackwordTrigger = "<NOP>"
inoremap <expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ "<C-R>=UltiSnips#JumpBackwards()<CR>"

" jump to previous placeholder otherwise do nothing
snoremap <buffer> <silent> <S-TAB>
    \ <ESC>:call UltiSnips#JumpBackwards()<CR>

" expand snippet, close menu or insert newline
let g:UltiSnipsExpandTrigger = "<NOP>"
let g:ulti_expand_or_jump_res = 0
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrReturnEmptyString()<CR>
function! s:ExpandSnippetOrReturnEmptyString()
    if pumvisible()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<C-y>\<CR>"
    endif
    else
        return "\<CR>"
endfunction

" inoremap <BS>
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"


"===================================================================================
" Surround
"===================================================================================
map <C-s>" ysiw"eea
imap <C-s>" <Esc><C-s>"
map <C-s>' ysiw'eea
imap <C-s>' <Esc><C-s>'


"===================================================================================
" Syntastic
"===================================================================================
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
let g:syntastic_loc_list_height=10
let g:syntastic_check_on_open=0
let g:syntastic_auto_loc_list=1
let g:syntastic_debug=0
autocmd VimEnter * SyntasticToggleMode
map <F3> :SyntasticToggleMode<CR>


"===================================================================================
" Tern
"===================================================================================
let g:tern_map_prefix='<leader>'
let g:tern_map_keys=1
let g:tern_show_argument_hints=0


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
colorscheme molokai
let g:used_javascript_libs = 'jquery,underscore,angularjs'


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

