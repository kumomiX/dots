"        __
" __  __/\_\    ___ ___   _ __  ___
"/\ \/\ \/\ \ /' __` __`\/\`'__/'___\
"\ \ \_/ \ \ \/\ \/\ \/\ \ \ \/\ \__/
" \ \___/ \ \_\ \_\ \_\ \_\ \_\ \____\
"  \/__/   \/_/\/_/\/_/\/_/\/_/\/____/
"

call plug#begin('~/.vim/bundle')
Plug 'mhinz/vim-startify'
Plug 'keith/investigate.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'mattn/emmet-vim',           { 'for': ['html','xhtml','css','sass','scss','less','javascript','javascript.jsx'] }
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'francoiscabrol/ranger.vim'
Plug 'isRuslan/vim-es6',          { 'for': ['javascript','javascript.jsx'] }
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'dylanaraps/wal.vim'
Plug 'styled-components/vim-styled-components'
call plug#end()

filetype on
syntax on
set clipboard=unnamedplus
set showmatch
set hidden
set history=100
set hlsearch
set clipboard=unnamedplus
set visualbell
set t_Co=16
"colorscheme term " default colorscheme
colorscheme wal
"set background=dark
"set termguicolors
highlight clear SignColumn
let mapleader = " "

"splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow

"lines
set number
set nu
set nuw=4
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

"auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"stop c from yanking
nnoremap c "_c
nnoremap C "_C

"auto indent
filetype indent on
set nowrap
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
autocmd BufWritePre * :%s/\s\+$//e

"indentLine
let g:indentLine_char = '|'

"look up documetation
nnoremap <F1> :call investigate#Investigate()<CR>

"tab for neocomplete
let g:neocomplete#enable_at_startup = 1 "enable at startup
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"inoremap <expr><Space> pumvisible() ? "\<C-n>" : "\<Space>"
inoremap <Nul> <C-n>

"emmet j-k instead of c-y
au FileType html,css,sass,scss,less,javascript,javascript.jsx imap <expr><F4> emmet#expandAbbrIntelligent("\<tab>")
au FileType html,css,sass,scss,less,javascript,javascript.jsx imap <expr>jk   emmet#expandAbbrIntelligent("\<tab>")
au FileType html                    imap <C-\>      <CR><CR><Esc>ki<Tab>
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'javascript.jsx': {
\      'extends': 'jsx',
\  }
\}

"ALE config
let g:ale_linters = {'javascript': ['eslint'],
\                    'javascript.jsx': ['eslint']
\}
let g:ale_fixers = {
\   'javascript':['prettier'],
\   'javascript.jsx':['prettier'],
\   'typescript':['prettier'],
\         'less':['prettier'],
\         'scss':['prettier'],
\          'css':['prettier'],
\         'json':['prettier'],
\      'graphql':['prettier'],
\     'markdown':['prettier']
\}
let g:ale_javascript_prettier_use_global = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '!'
let g:ale_sign_warning = '~'
let g:ale_enabled = 0
let g:ale_javascript_prettier_eslint_options = '--single-quote --trailing-comma es5 --no-semi'
nmap <F3> <Plug>(ale_toggle)

"node build system bind
nnoremap <F8> :!node "%"<CR>
noremap <silent> <C-S> :update<CR>

"snippets
let g:UltiSnipsUsePythonVersion = 3

"ranger remaps
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>

"easymotion
"let g:EasyMotion_move_highlight = 0

"CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
