set completeopt=menu,noinsert

" let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

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
  \ 'around',
  \ 'buffer',
  \ 'tag',
  \ 'member',
  \ 'file',
  \ ]

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#sources['javascript.jsx'] = ['file', 'tag', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

call deoplete#custom#set('buffer', 'rank', 130)
call deoplete#custom#set('tag', 'rank', 120)
call deoplete#custom#set('member', 'rank', 110)
call deoplete#custom#set('file', 'rank', 100)

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

function! HandleTab()
  if pumvisible()
    return "\<C-n>"
  else
    return "\<Tab>"
  end
endfunction

function! HandleShiftTab()
  if pumvisible()
    return "\<C-p>"
  else
    return "\<S-Tab>"
  end
endfunction

" when completion is visible, map Tab to cycle through choices
inoremap <expr> <Tab> HandleTab()
inoremap <expr> <S-Tab> HandleShiftTab()

" <CR>: close popup on Enter
" https://github.com/Shougo/deoplete.nvim/issues/83

function! HandleEnter()
  if pumvisible()
    return deoplete#close_popup()
  else
    return "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"
  endif
endfunction

let g:endwise_no_mappings = 1
inoremap <expr> <CR> HandleEnter()

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
