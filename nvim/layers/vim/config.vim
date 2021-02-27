" stop kicking me into this mode you fucking apes
set noexrc
set noex
set nosecure

" minimum width
set winwidth=100

" Put contents of unnamed register in OS X clipboard
set clipboard=unnamed

" map leader key to comma
let mapleader = ","
let g:mapleader = ","

" remap ESC to jk
" works well w/qwerty and colemak
inoremap zm <esc>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

"make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

"Clear current search highlight by hitting g + /
nmap <silent> g/ :nohlsearch<CR>

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" remap : to ;
nnoremap ; :

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

"(k)eybindings
nmap <silent> ,knr :e ~/.dotfiles/notes/RNDM.md<CR>
nmap <silent> ,knt :e ~/.dotfiles/notes/TODO.md<CR>
nmap <silent> ,kv :e ~/.dotfiles/nvim/layers/vim/config.vim<CR>
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
