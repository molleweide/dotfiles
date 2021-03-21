" " map leader key to comma
" let mapleader = ","
" let g:mapleader = ","

" remap ESC to jk
" works well w/qwerty and colemak
inoremap zm <esc>

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

<<<<<<< HEAD:nvim/layers/vim/config.vim
" remap : to ;
nnoremap ; :
nnoremap : ;

" background
inoremap <C-Z> <Esc><C-Z>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Mappings to move lines
" alt+j/k to move up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" load aliases
if exists('s:loaded_vimafter')
  silent doautocmd VimAfter VimEnter *
else
  let s:loaded_vimafter = 1
  augroup VimAfter
    autocmd!
    autocmd VimEnter * source ~/.config/nvim/aliases.vim
  augroup END
endif

" Remove arrow keys in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove arrow keys in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove arrow keys in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

=======
>>>>>>> origin/mollw_prepull_upstream:nvim/layers/molleweide/config.vim
"(k)eybindings
nmap <silent> ,knr :e ~/.dotfiles/notes/RNDM.md<CR>
nmap <silent> ,knt :e ~/.dotfiles/notes/TODO.md<CR>
nmap <silent> ,kv :e ~/.dotfiles/nvim/layers/molleweide/config.vim<CR>
nmap <silent> ,kV :e ~/.dotfiles/notes/build-nvim.md<CR>
nmap <silent> ,kt :e ~/.dotfiles/tmux.conf<CR>
nmap <silent> ,kzz :e ~/.dotfiles/zshrc<CR>
nmap <silent> ,kza :e ~/.dotfiles/zsh/custom/aliases.zsh<CR>
nmap <silent> ,kze :e ~/.dotfiles/zsh/custom/exports.zsh<CR>
nmap <silent> ,ky :e ~/.dotfiles/yabairc<CR>
nmap <silent> ,ks :e ~/.dotfiles/skhdrc<CR>
nmap <silent> ,kr :e ~/.dotfiles/installers/reaper<CR>
nmap <silent> ,kr :e ~/.dotfiles/installers/reaper<CR>
" add command to oh my zsh
nmap <silent> ,knr :e ~/.dotfiles/notes/reaper.md<CR>

" colemak layout insert mode
set keymap=INSERT_COLEMAK
set iminsert=1
set imsearch=0

" re-indent file
map <leader>i mzgg=G`z<CR>

" Tab through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Close buffer
nmap <leader>x :bd<CR>


" TODO
"
"   option-space to go down
"   optio-shift-space go up
"
" "   <Space> - PageDown
" "   -       - PageUp
" noremap <Space> <PageDown>
" noremap - <PageUp>

" " Easier copy/paste
" vnoremap p "_dP
" nmap <leader>y <Plug>SystemCopy
" xmap <leader>y <Plug>SystemCopy
" nmap <leader>p <Plug>SystemPaste
" nmap <leader>yy <Plug>SystemCopyLine
" tnoremap <Esc> <C-\><C-n>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" https://vim.fandom.com/wiki/Search_and_replace_in_multiple_buffers
"   vim fandom > search and replace function.
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>hh :%s///<left><left>
map <leader>hH :%s/\<\>//<left><left><left><left>
map <leader>hc :%s/\[\]/\\cite{}/gc<left><left><left><left><left><left><left><left><left><left><left><left><left><left>
map <leader>hf :%s/\[
" nmap <silent> <leader>, :nohlsearch<CR>

" quicker save
nnoremap <leader>c :w<CR>

" space on control L
inoremap <C-l> <Space>
cnoremap <C-l> <Space>

"""""""""""""""""""""""""""
" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
" use the above to map Alt-keys
" maybe use normal mode for movint splits around?
" nnoremap ˙
" nnoremap ∆
" nnoremap ˚
" nnoremap ¬

inoremap ˙ <Left>
" inoremap ∆
" inoremap ˚
inoremap ¬ <Right>

" vnoremap ˙
" vnoremap ∆
" vnoremap ˚
" vnoremap ¬

cnoremap ˙ <Left>
" cnoremap ∆
" cnoremap ˚
cnoremap ¬ <Right>
"""""""""""""""""""""""""""

" create custom command to close help
:command! H :helpc

" convert inner word to CAPITAL letters
nnoremap <leader>u viwUe
nnoremap <leader>U viwue

" " Move vertically by visual line
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk
" nnoremap gj j
" nnoremap gk k


" " === Emmet === "
" " let g:user_emmet_expandabbr_key = '<C-e>,'
" let g:user_emmet_expandabbr_key = '<C-e>,'

