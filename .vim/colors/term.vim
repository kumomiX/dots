" Vim color file

set background=light
let g:colors_name="term"

"7 for search/return/highlights
"5 for comments/lines
"15 for fg
"2 for css props/strings/wrnings
"6 for vars

" Code
hi Folded       ctermfg=8    ctermbg=none
hi FoldColumn                ctermbg=none
hi NonText      ctermfg=8
hi SpecialKey   ctermfg=0
hi Statement    ctermfg=7
hi Comment      ctermfg=5
"css props
hi Type         ctermfg=4
"everything
hi Special      ctermfg=15
"strings
hi Constant     ctermfg=2
"vars
hi Identifier   ctermfg=6
"hi Normal       ctermfg=247

" Spell
hi SpellBad     ctermfg=9    ctermbg=none

" Highlight
hi Search       ctermfg=none   ctermbg=7
hi Visual       ctermfg=6    ctermbg=none cterm=reverse
hi MatchParen   ctermfg=6   ctermbg=none cterm=reverse
hi ColorColumn               ctermbg=0    cterm=none

" Lines
hi CursorLine                             cterm=none
hi CursorLineNr ctermfg=7
hi LineNr       ctermfg=8

" Splits
hi SignColumn                ctermbg=none
hi VertSplit    ctermfg=8                 cterm=none

" Status line / related
hi StatusLine   ctermfg=7    ctermbg=none cterm=none
hi StatusLineNC ctermfg=8                 cterm=none
hi WildMenu     ctermfg=15   ctermbg=0    cterm=none
hi ModeMsg      ctermfg=8    ctermbg=none cterm=none
hi User1        ctermfg=7    ctermbg=none cterm=none

" Tabs
hi TabLine      ctermfg=8    ctermbg=none cterm=none
hi TabLineFill  ctermfg=8    ctermbg=none cterm=none
hi TabLineSel   ctermfg=7    ctermbg=none cterm=none

" Vimdiff
hi DiffAdd      ctermfg=14   ctermbg=none
hi DiffChange   ctermfg=12   ctermbg=none
hi DiffDelete   ctermfg=10   ctermbg=none
hi DiffText     ctermfg=9    ctermbg=none

" Errors
hi Error        ctermfg=0    ctermbg=7
hi ErrorMsg     ctermfg=0    ctermbg=7
hi WarningMsg   ctermfg=0    ctermbg=2

" Spelling/syntastic
hi SpellBad     ctermfg=0    ctermbg=7
hi SpellCap     ctermfg=0    ctermbg=2

" Easy Motion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search
