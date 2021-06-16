" molleweide personal bindings
"
" - rebind Q >> to ???
"    i can always reach ex mode by `gQ`


" remap ESC to jk
" works well w/qwerty and colemak
inoremap zm <esc>

"(v)im (r)eload
" nmap <silent> ,vr :so %<CR>
nmap <silent> <leader>vr :source $MYVIMRC<CR>

" Mappings to move lines
" alt+j/k to move up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ================ Kmonad workarounds ==========================

" nnoremap <silent> <Leader>1 <C-!>
" nnoremap <silent> <Leader>2 <C-@>
" nnoremap <silent> <Leader>3 <C-#>
" nnoremap <silent> <Leader>4 <C-$>
" nnoremap <silent> <Leader>5 <C-%>
nnoremap <silent> <Leader>6 <C-^>
" nnoremap <silent> <Leader>7 <C-&>
" nnoremap <silent> <Leader>8 <C-*>
" nnoremap <silent> <Leader>9 <C-(>
" nnoremap <silent> <Leader>0 <C-)>



" ================ Aliases ==========================

nnoremap <silent> <Leader>ki :e ~/.dotfiles/nvim/init.vim<CR>
nnoremap <silent> <Leader>knR :e ~/notes/RNDM.md<CR>
nnoremap <silent> <Leader>knt :e ~/notes/TODO.md<CR>
nnoremap <silent> <Leader>knf :e ~/notes/tfab.md<CR>
nnoremap <silent> <Leader>kv :e ~/.dotfiles/nvim/layers/molleweide/config.vim<CR>
nnoremap <silent> <Leader>kV :e ~/notes/build-nvim.md<CR>
nnoremap <silent> <Leader>kt :e ~/.dotfiles/tmux.conf<CR>
nnoremap <silent> <Leader>kzz :e ~/.dotfiles/zshrc<CR>
nnoremap <silent> <Leader>kza :e ~/.dotfiles/zsh/custom/aliases.zsh<CR>
nnoremap <silent> <Leader>kze :e ~/.dotfiles/zsh/custom/exports.zsh<CR>
nnoremap <silent> <Leader>ky :e ~/.dotfiles/yabairc<CR>
nnoremap <silent> <Leader>ks :e ~/.dotfiles/skhdrc<CR>
nnoremap <silent> <Leader>kg :view ~/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh<CR>

" =============== aliases: keys  ====================

nnoremap <silent> <Leader>kM :view ~/code/kmonad/keymap/tutorial.kbd<CR>
nnoremap <silent> <Leader>kk :e ~/.dotfiles/tmuxinator/keys.yml<CR>
nnoremap <silent> <Leader>km :e ~/code/kmonad/keymap/user/molleweide/mbp.kbd<CR>
nnoremap <silent> <Leader>kqb :e ~/code/qmk_firmware/keyboards/ergodox_ez/keymaps/myergo/layers/base.h<CR>

" =============== aliases: reaper  ====================

nnoremap <silent> <Leader>knr :e ~/notes/reaper.md<CR>
nnoremap <silent> <Leader>krr :e ~/.dotfiles/installers/reaper<CR>

nnoremap <silent> <Leader>Rg :e ~/REAPER/app/reaper-6.23.0/Scripts/reaper-keys/definitions/defaults/global.lua<CR>
nnoremap <silent> <Leader>Ra :e ~/REAPER/app/reaper-6.23.0/Scripts/reaper-keys/definitions/defaults/main.lua<CR>
nnoremap <silent> <Leader>Rm :e ~/REAPER/app/reaper-6.23.0/Scripts/reaper-keys/definitions/defaults/midi.lua<CR>

"

" colemak layout insert mode
set keymap=INSERT_COLEMAK
set iminsert=1
set imsearch=0

" re-indent file
map <leader>,i mzgg=G`z<CR>

" =============== Tab through butters ===============
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
" restore jump forwards command that is tied to <Tab>
nnoremap <Leader>i <C-i>

" Close buffer
nmap <leader>x :bd<CR>


" TODO
"
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

" quicker save
nnoremap <leader>cc :w<CR>
nnoremap <leader>. :w<CR>
nnoremap cx :w<CR>

" space on control L
inoremap <C-l> <Space>
cnoremap <C-l> <Space>

" convert inner word to CAPITAL letters
nnoremap <leader>u viwUe
nnoremap <leader>U viwue

" =============== Plugin Test ===============
" test plugin `Whid`
nnoremap <leader>W :Whid<CR>


" =============== help ====================

" create custom command to close help
:command! H :helpc



" help for word under cursor
"   how can I move this to which key?
nnoremap <leader>H "zyiw:h <C-r>z<CR>

" =============== other ====================


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

set noruler
set cursorline " highlight cursor line and column
set cursorcolumn

" ======== cyclist | listchars ========
nmap <leader>cn <Plug>CyclistNext
nmap <leader>cp <Plug>CyclistPrev

call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

call cyclist#add_listchar_option_set('busy', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })


" ======== snippets  ========
nnoremap <leader>S :Snippets<CR>
nnoremap <leader>E :UltiSnipsEdit<CR>
