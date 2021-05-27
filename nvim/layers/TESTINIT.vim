" use vim settings, rather then vi settings (much better!).
" this must be first, because it changes other options as a side effect.
set nocompatible

" =============== character fixes ====================

scriptencoding utf-8
set encoding=utf-8

" ================ general config ====================

"Clear current search highlight by hitting g + /
nmap <silent> g/ :nohlsearch<CR>


" ================ Turn Off Swap Files ==============

set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.

" ================ Indentation ======================

set nowrap       " Don't wrap lines
set linebreak    " Wrap lines at convenient points

" ================ Scrolling ========================

let mapleader=","
let g:mapleader=","

" =============== mouse =====================
set mouse=n

" =============== python ====================

let g:python_host_prog = $HOME . '/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/py3neovim/bin/python'

" =============== node.js ===================

let g:latest_node_path = $HOME . '/.nodenv/versions/15.7.0/bin/node'
let g:node_host_prog = g:latest_node_path
let g:coc_node_path = g:latest_node_path

" ============== yank ======================

" highlights yanked text for a little extra visual feedback
" so we don't need to rely on visual mode as much, try yip or y4y
augroup highlight_yank
  if has("nvim-0.5")
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  endif
augroup END

" ================ Editing ==========================

" function to source a file if it exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" =============== Cursor shapes =====================

" TODO this doesn't work in neovim
let &t_SI = "\<esc>[5 q" " I beam cursor for insert mode
let &t_EI = "\<esc>[2 q" " block cursor for normal mode
let &t_SR = "\<esc>[3 q" " underline cursor for replace mode

" ================ Plugins ==========================

" Vimscript
Plug 'tpope/vim-scriptease'

" Load private Stripe overlay packages
call SourceIfExists('~/.config/nvim/layers/private/packages.vim')

call plug#end()


" ================ Theme ========================

" highlight hex colors in these file types
au BufNewFile,BufRead *.css,*.html,*.htm,*.sass,*.scss :ColorHighlight!

" =============== Tmux =========================

let g:tmux_resizer_no_mappings = 0


" ============== File browser =================
"
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_as_default_explorer = 1
let g:vimshell_force_overwrite_statusline = 0

call vimfiler#custom#profile('default', 'context', {
  \ 'safe': 0
  \ })

" bind the minus key to show the file explorer in the dir of the current open
" buffer's file
nnoremap - :VimFilerBufferDir<CR>

nnoremap <leader>r :Ranger<CR>



" ============= ripgrep ======================

let g:ackprg = 'rg --vimgrep --no-heading'

cnoreabbrev Ack Ack!

nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>A :Ack!<CR>


" =============== FZF =======================

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_sink = 'e'

" floating window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! g:FzfFilesSource()
  let l:base = fnamemodify(expand('%'), ':h:.:S')
  let l:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'

  let l:source_command = "rg --files --hidden --glob '!{node_modules/*,.git/*}'"

  if base == '.'
    return l:source_command
  else
    return printf('%s | %s %s', l:source_command, l:proximity_sort_path, expand('%'))
  endif
endfunction

let g:fzf_preview_cmd = g:plug_home . "/fzf.vim/bin/preview.sh {}"

noremap <C-b> :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>

noremap <C-p> :call fzf#vim#files('', { 'source': g:FzfFilesSource(),
      \ 'options': [
      \   '--tiebreak=index', '--preview', g:fzf_preview_cmd
      \  ]})<CR>


" ================= vim-test =====================

nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

let g:test#preserve_screen = 1
let test#neovim#term_position = "vert"
let test#vim#term_position = "vert"

let g:test#javascript#mocha#file_pattern = '\v.*_test\.(js|jsx|ts|tsx)$'

if exists('$TMUX')
  " Use tmux to kick off tests if we are in tmux currently
  let test#strategy = 'vimux'
else
  " Fallback to using terminal split
  let test#strategy = "neovim"
endif

let test#enabled_runners = ["lua#busted", "ruby#rspec"]

let test#custom_runners = {}
let test#custom_runners['ruby'] = ['rspec']
let test#custom_runners['lua'] = ['busted']


" ================= Editing plugins ==============

let splitjoin_ruby_curly_braces = 0
let splitjoin_ruby_hanging_args = 0

" vim-signature
" highlight marks dynamically based on vim-gitgutter's status
let g:SignatureMarkTextHLDynamic = 1


" =============== version control ================

" Every time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with
" fugitive buffers. This prevents this from becomming an issue:
autocmd BufReadPost fugitive://* set bufhidden=delete

vnoremap <leader>g :GBrowse!<CR>

nnoremap <space>gb :Gblame<CR>
nnoremap <space>gs :Gstatus<CR>

" Map git-messenger
let g:git_messenger_no_default_mappings = v:true
nmap <space>gm <Plug>(git-messenger)

" ==================== LSP ======================

set completeopt=menu,menuone,noselect

call luaeval('require("lspservers")')

" nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" nnoremap <silent>K :Lspsaga hover_doc<CR>

nnoremap <silent><space>la :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent> <space>l0  <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <space>ld  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <space>li  :LspInfo<CR>
nnoremap <silent> <space>lh  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <space>lD  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <space>ln  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <space>lr  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>lt  <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <space>lw  <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" =================== ALE =======================

" ALE config
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_options = ''
let g:ale_javascript_eslint_use_global = 1

let g:ale_ruby_rubocop_executable = 'rubocop-daemon-wrapper'

let g:ale_ruby_rubocop_options = '--display-cop-names'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'javascript.jsx': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescript.tsx': ['eslint'],
\ 'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'javascript.jsx': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescript.tsx': ['eslint'],
\ 'ruby': ['rubocop'],
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_disable_lsp = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "      "

nnoremap <silent> gj :ALENext<cr>
nnoremap <silent> gk :ALEPrevious<cr>

" =================== Ruby =====================

function! FlipBindingPry()
  if getline('.') =~? "^\s*require 'pry'; binding\.pry\s*$"
    normal dd
  else
    normal orequire 'pry'; binding.pry
  endif

  write
endfunction

nnoremap <leader>d :call FlipBindingPry()<CR>

" ================== treesitter =================

lua <<LUA
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
LUA

" ================== status line ================
call luaeval('require("statusline")')

" ================== snippets ==================

" inoremap <silent><expr> <CR>      compe#confirm('<CR>')

let g:UltiSnipsExpandTrigger = "<nop>"
call luaeval('require("custom_snippets")')

" ================= which key ==================
call luaeval('require("which-key")')

" ================= Stripe ======================

" Load Stripe-specific private config
call SourceIfExists('~/.config/nvim/layers/private/config.vim')

" ================= Private ======================

" Load molleweide configs
call SourceIfExists('~/.config/nvim/layers/molleweide/config.vim')


