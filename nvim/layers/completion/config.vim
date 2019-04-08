" debugger enable
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']

" configure noshowmode so echodoc.vim isn't overwritten by the -- INSERT --
" text
set noshowmode

" Use tab and shift+tab to navigate forward/back on completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use enter to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
