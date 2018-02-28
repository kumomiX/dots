"        __
" __  __/\_\    ___ ___   _ __  ___
"/\ \/\ \/\ \ /' __` __`\/\`'__/'___\
"\ \ \_/ \ \ \/\ \/\ \/\ \ \ \/\ \__/
" \ \___/ \ \_\ \_\ \_\ \_\ \_\ \____\
"  \/__/   \/_/\/_/\/_/\/_/\/_/\/____/


" vim-plugs {{{

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
  map <C-b> :NERDTreeToggle<CR> nnoremap <Leader>b :NERDTreeFind<CR> " open nerdtree when starting vim with no argv
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
  imap jk  <Plug>(neosnippet_expand_or_jump)
  let g:neosnippet#enable_snipmate_compatibility = 1
  " SuperTab like snippets' behavior.
  imap <expr><TAB>
   \ pumvisible() ? "\<C-n>" :
   \ neosnippet#expandable_or_jumpable() ?
   \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
   \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

Plug 'w0rp/ale'
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

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'kien/ctrlp.vim'
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

Plug 'ddrscott/vim-side-search'
  " SideSearch current word and return to original window
  nnoremap <Leader>s :SideSearch <C-r><C-w><CR> | wincmd p

Plug 'terryma/vim-multiple-cursors'
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

Plug 'junegunn/goyo.vim'
  " Distraction free
  nnoremap <F11> :Goyo <CR>

Plug 'mattn/emmet-vim',           { 'for': ['html','xhtml','css','sass','scss','less','javascript','javascript.jsx'] }
  au FileType html,css,sass,scss,less,javascript,javascript.jsx imap <expr><C-k>  emmet#expandAbbrIntelligent("\<tab>")
  let g:user_emmet_settings = {
  \  'javascript' : {
  \      'extends' : 'jsx',
  \  },
  \  'javascript.jsx': {
  \      'extends': 'jsx',
  \  }
  \}

Plug 'jiangmiao/auto-pairs'
Plug 'dylanaraps/wal.vim'
"Plug 'isRuslan/vim-es6',          { 'for': ['javascript','javascript.jsx'] }
Plug 'styled-components/vim-styled-components'
Plug 'mxw/vim-jsx'
call plug#end()
" }}}

" general settings {{{

set nobackup
set nowritebackup
set noswapfile " get rid of swapfiles everywhere
set dir=/tmpset

syntax on

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
set sidescroll=40
set ignorecase
set smartcase
set incsearch
set hlsearch
set undofile
set undodir=~/.vim/undodir
set path+=**
set inccommand=split
set backspace=indent,eol,start
set hidden
set wildmenu
set clipboard+=unnamedplus

set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
"autocmd BufWritePre * :%s/\s\+$//e "delete trailing spaces
colorscheme agila

let mapleader = " "
nnoremap c "_c
nnoremap C "_C

" }}}

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

"auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" splits
nnoremap <M-j> <C-W><C-J>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-l> <C-W><C-L>
nnoremap <M-h> <C-W><C-H>
set splitbelow
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"highlight clear VertSplit

"node build system bind
nnoremap <F8> :!node "%"<CR>
noremap <silent> <C-S> :update<CR>

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


" git gutter settings {{{
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '^'
let g:gitgutter_sign_modified_removed          = '#'
" }}}








































































































