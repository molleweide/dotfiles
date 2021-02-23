runtime layers/navigation/settings/ack.vim
runtime layers/navigation/settings/fzf.vim
runtime layers/navigation/settings/leader-guide.vim

let g:vimfiler_as_default_explorer = 1

call vimfiler#custom#profile('default', 'context', {
  \ 'safe': 0
  \ })

" bind the minus key to show the file explorer in the dir of the current open
" buffer's file
nnoremap - :VimFilerBufferDir<CR>

map <leader>r :Ranger<CR>
