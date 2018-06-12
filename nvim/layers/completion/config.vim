set completeopt=menu,noinsert

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:deoplete#auto_completion_start_length = 3

" complete file names from the buffer's path
let g:deoplete#file#enable_buffer_path = 1

" in ms
let g:deoplete#auto_complete_delay = 75
let g:deoplete#auto_refresh_delay = 150

" 20mb limit for ctags
let deoplete#tag#cache_limit_size = 20000000

let g:deoplete#sources = {}
let g:deoplete#sources._ = [
  \ 'ultisnips',
  \ 'around',
  \ 'buffer',
  \ 'tag',
  \ 'member',
  \ 'file',
  \ ]

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'jspc#omni'
\]

let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'tag']

call deoplete#custom#set('ultisnips', 'rank', 150)
call deoplete#custom#set('buffer', 'rank', 130)
call deoplete#custom#set('tag', 'rank', 120)
call deoplete#custom#set('member', 'rank', 110)
call deoplete#custom#set('file', 'rank', 100)

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:endwise_no_mappings = 1

" https://github.com/simonweil/dotfiles/blob/master/nvimrc#L29-L85
let g:UltiSnipsExpandTrigger = '<NOP>'
let g:UltiSnipsJumpForwardTrigger = '<NOP>'
let g:UltiSnipsJumpBackwardTrigger = '<NOP>'
let g:SuperTabMappingForward = '<NOP>'
let g:SuperTabMappingBackward = '<NOP>'
" Don't unmap my mappings
let g:UltiSnipsMappingsToIgnore = [ "SmartTab", "SmartShiftTab" ]

" Make <CR> smart
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
  " First try to expand a snippet
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res
    " if successful, just return
    return ''
  elseif pumvisible()
    " if in completion menu - just close it and leave the cursor at the
    " end of the completion
    return deoplete#mappings#close_popup()
  else
    " otherwise, just do an "enter"
    return "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"
  endif
endfunction
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

" Enable tabbing and shift-tabbing through list of results
function! g:SmartTab()
  if pumvisible()
    return SuperTab("n")
  else
    call UltiSnips#JumpForwards()

    if g:ulti_jump_forwards_res == 0
      return SuperTab("n")
    endif

    return ''
  endif
endfunction
inoremap <silent> <tab> <C-R>=g:SmartTab()<cr>
snoremap <silent> <tab> <Esc>:call g:SmartTab()<cr>

function! g:SmartShiftTab()
  if pumvisible()
    return SuperTab("p")
  else
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res == 0
      return SuperTab("p")
    endif
    return ''
  endif
endfunction

inoremap <silent> <s-tab> <C-R>=g:SmartShiftTab()<cr>
snoremap <silent> <s-tab> <Esc>:call g:SmartShiftTab()<cr>

" let g:UltiSnipsExpandTrigger="<C-j>"

" let g:ulti_expand_or_jump_res = 0
" function ExpandSnippetOrCarriageReturn()
"     let snippet = UltiSnips#ExpandSnippetOrJump()
"     if g:ulti_expand_or_jump_res > 0
"         return snippet
"     else
"       echo "Closing popup"
"       call deoplete#close_popup()
"       echo "returning a thing"
"       return ""
"         " return "\<CR>"
"     endif
" endfunction

" " fix vim-endwise + ultisnips interaction
" let g:endwise_no_mappings = 1
" " inoremap <expr> <CR> pumvisible() ? deoplete#close_popup() : "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"
" inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"

" let g:UltiSnipsJumpForwardTrigger = "<C-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
