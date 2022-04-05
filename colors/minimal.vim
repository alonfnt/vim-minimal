" Author:   Albert Alonso <alonfnt@protonmail.com>
"
" Note:     Based on the off colorscheme:
"           https://github.com/pbrisbin/vim-colors-off
"
" Usage:    colorscheme minimal
"
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='minimal'

let s:black           = { "gui": "#000000", "cterm": "0"   }
let s:white           = { "gui": "#ffffff", "cterm": "231"  }

let s:light_black     = { "gui": "#1b1b1b", "cterm": "8"   }
let s:lighter_black   = { "gui": "#383838", "cterm": "240" }
let s:subtle_black    = { "gui": "#303030", "cterm": "236" }

let s:medium_gray     = { "gui": "#545454", "cterm": "243" }
let s:light_gray      = { "gui": "#717171", "cterm": "249" }
let s:lighter_gray    = { "gui": "#8d8d8d", "cterm": "251" }
let s:subtle_gray     = { "gui": "#aaaaaa", "cterm": "250" }

let s:red             = { "gui": "#ce2029", "cterm": "1"   }
let s:orange          = { "gui": "#ff7900", "cterm": "167" }
let s:blue            = { "gui": "#1c39bb", "cterm": "12"  }
let s:yellow          = { "gui": "#ffb800", "cterm": "11"  }
let s:green           = { "gui": "#007d32", "cterm": "2"   }

let s:bg              = s:white
let s:bg_subtle       = s:subtle_gray
let s:bg_subtle_comment = s:subtle_gray
let s:bg_very_subtle  = s:lighter_gray
let s:norm            = s:black
let s:norm_subtle     = s:lighter_black

function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:lighter_black})
call s:h("Cursor",        {"bg": s:blue, "fg": s:bg })
call s:h("Comment",       {"fg": s:blue})
call s:h("Constant",      {"fg": s:lighter_black})
call s:h("String",        {"fg": s:medium_gray})
call s:h("Identifier",    {"fg": s:norm})
call s:h("Statement",     {"fg": s:red})
call s:h("Type",          {"fg": s:norm_subtle})

hi! link Character        Normal
hi! link Number           Normal
hi! link Boolean          Normal
hi! link Float            Normal

hi! link String           String

hi! link Function         Identifier

hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Operator         Statement
hi! link Keyword          Statement
hi! link Exception        Statement

hi! link PreProc          Statement
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

hi! link Special          Special
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:white, "bg": s:red, "cterm": "bold"})
call s:h("Todo",          {"fg": s:white, "bg": s:green, "gui": "bold", "cterm": "bold"})
call s:h("SpecialKey",    {"fg": s:green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:blue})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:light_black})
call s:h("Search",        {"bg": s:yellow, "fg": s:bg})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:blue, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:orange})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:blue})
call s:h("Visual",        {"bg": s:blue, "fg": s:bg})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:red})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:yellow})
call s:h("DiffText",      {"fg": s:blue})
call s:h("SignColumn",    {"fg": s:green})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:red})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:green})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:red})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:green})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:green})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:red})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:green})
endif

call s:h("Pmenu",         {"fg": s:bg, "bg": s:orange})
call s:h("PmenuSel",      {"fg": s:bg, "bg": s:blue})
call s:h("PmenuSbar",     {"fg": s:bg, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:bg, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:blue, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

hi link diffRemoved       DiffDelete
hi link diffAdded         DiffAdd

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

" Fuzzy Search, Telescope & CtrlP
hi! CtrlPMatch                   ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE cterm=NONE gui=bold
hi! TelescopeMatching            guifg=NONE guibg=NONE ctermbg=NONE
highlight TelescopeSelection     guifg=NONE gui=bold guibg=#303030
