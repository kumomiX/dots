"        __
" __  __/\_\    ___ ___   _ __  ___
"/\ \/\ \/\ \ /' __` __`\/\`'__/'___\
"\ \ \_/ \ \ \/\ \/\ \/\ \ \ \/\ \__/
" \ \___/ \ \_\ \_\ \_\ \_\ \_\ \____\
"  \/__/   \/_/\/_/\/_/\/_/\/_/\/____/
"



call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
  map <C-b> :NERDTreeToggle<CR>
  nnoremap <Leader>b :NERDTreeFind<CR>
  autocmd StdinReadPre * let s:std_in=1
  " open nerdtree when starting vim with no argv
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " close when opening a file
  let NERDTreeQuitOnOpen = 0
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeMinimalUI = 1
  let g:NERDTreeStatusline = -1
  :autocmd FileType nerdtree nmap <buffer> O go

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_completion_start_length = 3
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'


Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'ddrscott/vim-side-search'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'

Plug 'isRuslan/vim-es6',          { 'for': ['javascript','javascript.jsx'] }
Plug 'mattn/emmet-vim',           { 'for': ['html','xhtml','css','sass','scss','less','javascript','javascript.jsx'] }
Plug 'styled-components/vim-styled-components'
Plug 'mxw/vim-jsx'
call plug#end()

set list
filetype indent on
set number
set relativenumber
set laststatus=2
set nowrap
set noshowmode
set cursorline
set listchars=tab:│\ ,nbsp:␣,trail:∙,extends:,precedes:
set fillchars=vert:\│
set scrolloff=12
set ignorecase
set smartcase
set sidescroll=40
set incsearch
set hlsearch
set undofile
set undodir=~/.vim/undodir
set path+=**
set inccommand=split
set backspace=indent,eol,start
set hidden
set wildmenu

set nobackup
set nowritebackup
set noswapfile " get rid of swapfiles everywhere
set dir=/tmpset

augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END


augroup highlight_follows_vim
    autocmd!
    autocmd FocusGained * set cursorline
    autocmd FocusLost * set nocursorline
 augroup END



"filetype on
"syntax on
"set listchars=tab:│\ ,nbsp:␣,trail:∙,extends:,precedes:
"set fillchars=vert:\│
"set clipboard+=unnamedplus
"set showmatch
"set hidden
"set history=100
"set hlsearch
"set clipboard=unnamedplus
"set visualbell
"set t_Co=16
colorscheme agila
"highlight clear SignColumn
let mapleader = " "

"snippets
imap jk  <Plug>(neosnippet_expand_or_jump)
"smap jk  <Plug>(neosnippet_expand_or_jump)
"xmap jk  <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
" SuperTab like snippets' behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"splits
nnoremap <M-j> <C-W><C-J>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-l> <C-W><C-L>
nnoremap <M-h> <C-W><C-H>
set splitbelow
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"highlight clear VertSplit

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



"emmet j-k instead of c-y
au FileType html,css,sass,scss,less,javascript,javascript.jsx imap <expr><C-k>  emmet#expandAbbrIntelligent("\<tab>")
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
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'
nmap <F3> <Plug>(ale_toggle)

"node build system bind
nnoremap <F8> :!node "%"<CR>
noremap <silent> <C-S> :update<CR>

"ranger remaps
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>

"easymotion
"let g:EasyMotion_move_highlight = 0

"CtrlP
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif


" SideSearch current word and return to original window
nnoremap <Leader>s :SideSearch <C-r><C-w><CR> | wincmd p

" Distractio free
nnoremap <F11> :Goyo <CR>

"Create new dir if it doesnt exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if has('nvim')
    call deoplete#disable()
  endif
  if !has('nvim')
    exe 'NeoCompleteDisable'
  endif
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if has('nvim')
    call deoplete#enable()
  endif
  if !has('nvim')
    exe 'NeoCompleteEnable'
  endif
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" statusline {{{

let g:currentmode={
    \ 'n'  : 'NORMAL ',
    \ 'no' : 'N·OPERATOR PENDING ',
    \ 'v'  : 'VISUAL ',
    \ 'V'  : 'V·LINE ',
    \ '' : 'V·BLOCK ',
    \ 's'  : 'SELECT ',
    \ 'S'  : 'S·LINE ',
    \ '' : 'S·BLOCK ',
    \ 'i'  : 'INSERT ',
    \ 'R'  : 'REPLACE ',
    \ 'Rv' : 'V·REPLACE ',
    \ 'c'  : 'COMMAND ',
    \ 'cv' : 'VIM EX ',
    \ 'ce' : 'EX ',
    \ 'r'  : 'PROMPT ',
    \ 'rm' : 'MORE ',
    \ 'r?' : 'CONFIRM ',
    \ '!'  : 'SHELL ',
    \ 't'  : 'TERMINAL '}


set statusline=
set statusline+=%#PrimaryBlock#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#SecondaryBlock#
set statusline+=%{StatuslineGit()}
set statusline+=%#TeritaryBlock#
set statusline+=\ %f\
set statusline+=%M\
set statusline+=%#Blanks#
set statusline+=%=
set statusline+=%#SecondaryBlock#
set statusline+=\ %Y\
set statusline+=%#PrimaryBlock#
set statusline+=\ %P\

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" }}}

