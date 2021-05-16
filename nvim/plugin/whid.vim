if exists('g:loaded_whid') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

hi def link WhidHeader      Number
hi def link WhidSubHeader   Identifier
" hi WhidCursorLine ctermbg=238 cterm=none

command! Whid lua require'whid'.whid()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_whid = 1
