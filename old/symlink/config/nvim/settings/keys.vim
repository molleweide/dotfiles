" ============================================================================ "
" ===                           MY KEY MAPPINGS                            === "
" ============================================================================ "

" Remap leader key to ,
let g:mapleader=','
" add ZR for quit and save instead of having it on ZZ.

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" // COLEMAK
" connect colemak keymap ONLY to insert mode.
set keymap=INSERT_COLEMAK
set iminsert=1
set imsearch=0

" // CAPSLOCK AUTO
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
" for c in range(char2nr('A'), char2nr('Z'))
"   execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
"   execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
" endfor
"
" " Kill the capslock when leaving insert mode.
" autocmd InsertLeave * set iminsert=0
nnoremap  <F2> :e ~/.config/nvim/init.vim<CR>
nnoremap  <F3> :e ~/.config/nvim/settings/general.vim<CR>
nnoremap  <F4> :e ~/.config/nvim/settings/keys.vim<CR>
nnoremap  <F5> :e ~/.zshrc<CR>
nnoremap  <F6> :e ~/.tmux.conf<CR>
nnoremap  <F7> :w<CR>:so $MYVIMRC<CR>
nnoremap  <F8> :e ~/.config/nvim/settings/setup.vim<CR>
" :map      <F4> GoDate: <Esc>:read !date<CR>kJ

" re-indent file
map <leader>i mzgg=G`z<CR>

" Tab through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

"   <Space> - PageDown
"   -       - PageUp
noremap <Space> <PageDown>
noremap - <PageUp>

" Qui ck window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Easier copy/paste
vnoremap p "_dP
nmap <leader>y <Plug>SystemCopy
xmap <leader>y <Plug>SystemCopy
nmap <leader>p <Plug>SystemPaste
nmap <leader>yy <Plug>SystemCopyLine
tnoremap <Esc> <C-\><C-n>

" Close buffer
nmap <leader>x :bd<CR>

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
nmap <silent> <leader>, :nohlsearch<CR>

" quicker save
nnoremap <leader>c :w<CR>

" space on control L
inoremap <C-l> <Space>
cnoremap <C-l> <Space>

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

" create custom command to close help
:command! H :helpc

" convert inner word to CAPITAL letters
nnoremap <leader>u viwUe


" Move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k


"###
" ============================================================================ "
" ===                        PLUGIN KEY MAPPINGS                           === "
" ============================================================================ "

" LeaderF
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_ShortcutF = "<leader>ff"
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" noremap <leader>fr :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>


" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>s :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
        \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
        \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
        \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
        \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
        \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
        \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
        \ denite#do_map('do_action', 'split')
endfunction

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" === coc.nvim === "
"   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"" Bind :Prettier to cocs prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"" Or use `complete_info` if your vim support it, like:
"" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Create mappings for function text object, requires document symbols feature of languageserver.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Format selected region
"vmap <leader>=  <Plug>(coc-format-selected)
"nmap <leader>=  <Plug>(coc-format-selected)

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader><space> :StripWhitespace<CR>

" === Search shorcuts === "

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
let g:EasyMotion_do_mapping = 0
nmap <leader>W <Plug>(easymotion-overwin-line)
map <leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>
" === ranger ==="
map <leader>r :Ranger<CR>

" === Git Gutter ==="
nnoremap <leader>g :GitGutterToggle<CR>


" === Tabular ==="
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a* :Tabularize /<\*><CR>

" === Emmet === "
" let g:user_emmet_expandabbr_key = '<C-e>,'
let g:user_emmet_expandabbr_key = '<C-e>,'

"" === vim closer === "
" let b:closer = 1





