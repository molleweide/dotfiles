set completeopt=menu,preview

" let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

let g:deoplete#auto_completion_start_length = 2

" complete file names from the buffer's path
let g:deoplete#file#enable_buffer_path = 1

" in ms
let g:deoplete#auto_complete_delay = 20
let g:deoplete#auto_refresh_delay = 150

" 10mb limit for ctags
let deoplete#tag#cache_limit_size = 10000000

let g:deoplete#sources = {}
let g:deoplete#sources._ = [
  \ 'around',
  \ 'buffer',
  \ 'tag',
  \ 'member',
  \ 'file',
  \ ]

call deoplete#custom#set('buffer', 'rank', 130)
call deoplete#custom#set('tag', 'rank', 120)
call deoplete#custom#set('member', 'rank', 110)
call deoplete#custom#set('file', 'rank', 100)

" when completion is visible, map Tab to cycle through choices
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" select with Enter
" inoremap <expr> <TAB> pumvisible() ? deoplete#close_popup() : "\<TAB>"

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
      echo "Closing popup"
      call deoplete#close_popup()
      echo "returning a thing"
      return ""
        " return "\<CR>"
    endif
endfunction

" fix vim-endwise + ultisnips interaction
let g:endwise_no_mappings = 1
" inoremap <expr> <CR> pumvisible() ? deoplete#close_popup() : "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"

let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
