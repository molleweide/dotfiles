local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require 'config.utils'
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

local silent = { silent = true }
local noremap = { noremap = true }
local noresilent = { silent=true, noremap=true}

-- use vim settings, rather then vi settings (much better!).
-- this must be first, because it changes other options as a side effect.
vim.cmd 'set nocompatible'

-- =============== character fixes ====================

vim.cmd 'scriptencoding utf-8'
o.encoding="utf-8"

-- ================ general config ====================

o.shell="zsh"
o.backspace="indent,eol,start"  -- allow backspace in insert mode
o.history=1000                -- store lots of :cmdline history
o.showcmd=true                -- show incomplete cmds down the bottom
o.showmode=true               -- show current mode down the bottom
o.gcr="a:blinkon0"              -- disable cursor blink
o.visualbell=true             -- no sounds
o.autoread=true               -- reload files changed outside vim
o.ruler=true                  -- show ruler
o.undolevels=1000             -- undo levels
o.laststatus=2                -- fix status bar
o.guifont="Inconsolata-g for Powerline"
o.number=true
o.relativenumber=true
o.foldmethod=indent

-- this makes vim act like all other editors, buffers can
-- exist in the background without being in a window.
-- http://items.sjbach.com/319/configuring-vim-right
o.hidden=true

-- turn on syntax highlighting
opt('syntax', 'on')

-- highlight funky characters and whatnot
opt('list',true)
opt('listchars','tab:▸\\ ,trail:ـ,extends:➧,eol:¬')

-- stop kicking me into this mode you fucking apes
o.noexrc=true
o.noex=true
o.nosecure=true

-- minimum width
o.winwidth=100

-- Put contents of unnamed register in OS X clipboard
o.clipboard="unnamed"

-- remap ESC to jk
-- inoremap jk <esc>


-- Clear current search highlight by hitting g + /
map('n', 'g/', '<cmd>nohlsearch<cr>', silent)

-- ================ Turn Off Swap Files ==============

opt('noswapfile',true)
opt('nobackup',true)
opt('nowb',true)

-- ================ Persistent Undo ==================
-- Keep undo history across sessions, by storing in file.

vim.cmd([[
  augroup My_group
    autocmd!
    autocmd FileType c setlocal cindent
  augroup END
]])

-- if has('persistent_undo')
--   "silent !mkdir ~/.vim/backups > /dev/null 2>&1
--   set undodir=~/.vim/backups
--   set undofile
-- endif

-- ================ Indentation ======================

o.autoindent=true
o.smartindent=true
o.smarttab=true
o.shiftwidth=2
o.softtabstop=2
o.tabstop=2
o.expandtab=true

-- ??? are these necessary??
cmd([[
  filetype plugin on
  filetype indent on
  filetype plugin indent on
]])

--  Display tabs and trailing spaces visually
cmd([[
  set list listchars=tab:\ \ ,trail:·
]])

o.nowrap=true       -- Don't wrap lines
o.linebreak=true    -- Wrap lines at convenient points

-- ================ Scrolling ========================

o.scrolloff=4         -- Start scrolling when we're 4 lines away from margins
o.sidescrolloff=15
o.sidescroll=1

g.mapleader = [[,]]

-- =============== mouse =====================
o.mouse=n

-- =============== python ====================

g.python_host_prog = '~/.pyenv/versions/py2neovim/bin/python'
g.python3_host_prog = '~/.pyenv/versions/py3neovim/bin/python'

-- =============== node.js ===================

g.latest_node_path = '~/.nodenv/versions/15.7.0/bin/node'
g.node_host_prog = g.latest_node_path
g.coc_node_path = g.latest_node_path

-- ============== yank ======================

-- highlights yanked text for a little extra visual feedback
-- so we don't need to rely on visual mode as much, try yip or y4y

cmd([[
  augroup highlight_yank
    if has("nvim-0.5")
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    endif
  augroup END
]])

-- ================ Editing ==========================

-- color column
o.colorcolumn=81

-- Open splits to the right or below; more natural than the default
o.splitright=true
o.splitbelow=true

-- Create window splits easier. The default
-- way is Ctrl-w,v and Ctrl-w,s. I remap
-- this to vv and ss
map('n', 'vv', '<C-w>v', {silent=true,noremap=true})
map('n', 'ds', '<C-w>s', {silent=true,noremap=true})

-- make Y consistent with C and D
map('n', 'Y', 'y$', {noremap=true})
cmd([[
  function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
  endfunction
]])

-- remap : to ; and vice versa
map('n', ';', ':', {noremap=true})
map('n', ':', ';', {noremap=true})

-- background out of insert mode
map('i', '<C-Z>', '<Esc><C-Z>', {noremap=true})

-- Use sane regexes.
map('n', '/', '/\v', {noremap=true})
map('v', '/', '/\v', {noremap=true})

-- Load aliases for :vh -> :vertical h
cmd([[
  if exists('s:loaded_vimafter')
    silent doautocmd VimAfter VimEnter *
  else
    let s:loaded_vimafter = 1
    augroup VimAfter
      autocmd!
      autocmd VimEnter * source ~/.config/nvim/aliases.vim
    augroup END
  endif
]])

-- Remove arrow keys in Insert Mode
map('i', '<Down>',  '<Nop>')
map('i', '<Left>',  '<Nop>')
map('i', '<Right>', '<Nop>')
map('i', '<Up>',    '<Nop>')

-- Remove arrow keys in Normal Mode
map('n', '<Down>',  '<Nop>')
map('n', '<Left>',  '<Nop>')
map('n', '<Right>', '<Nop>')
map('n', '<Up>',    '<Nop>')

-- Remove arrow keys in Visual Mode
map('v', '<Down>',  '<Nop>')
map('v', '<Left>',  '<Nop>')
map('v', '<Right>', '<Nop>')
map('v', '<Up>',    '<Nop>')

-- wildignore
-- set wildignore+=node_modules/*,bower_components/*,vendor/bundle/*,tmp/*
opt('wildignore', 'node_modules/*,bower_components/*,vendor/bundle/*,tmp/*')


-- function to source a file if it exists
-- local function SourceIfExists(file)
--   if vim.fn.filereadable(vim.fn.expand(file)) then
--     cmd [[ exe 'source' file ]]
--   end
-- end

-- =============== Cursor shapes =====================

-- TODO this doesn't work in neovim
cmd ([[
  let &t_SI = "\<esc>[5 q" -- I beam cursor for insert mode
  let &t_EI = "\<esc>[2 q" -- block cursor for normal mode
  let &t_SR = "\<esc>[3 q" -- underline cursor for replace mode
]])


-- ================ Theme ========================

opt('termguicolors', true)
-- let g:oceanic_next_terminal_bold = 1
-- let g:oceanic_next_terminal_italic = 1
cmd [[colorscheme nightfly]]

-- enable transparent terminal bg
cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
cmd [[ hi LineNr guibg=NONE ctermbg=NONE ]]
cmd [[ hi SignColumn guibg=NONE ctermbg=NONE ]]
cmd [[ hi EndOfBuffer guibg=NONE ctermbg=NONE ]]

-- highlight hex colors in these file types
cmd [[ au BufNewFile,BufRead *.css,*.html,*.htm,*.sass,*.scss :ColorHighlight! ]]

-- =============== Tmux =========================

-- set our shell to be bash for fast tmux switching times
-- see: https://github.com/christoomey/vim-tmux-navigator/issues/72
opt('shell','/bin/bash\\ --norc\\ -i')

g.tmux_resizer_no_mappings = 0


-- ============== File browser =================

g.vimfiler_force_overwrite_statusline = 0
g.vimfiler_as_default_explorer = 1
g.vimshell_force_overwrite_statusline = 0

cmd ([[
  call vimfiler#custom#profile('default', 'context', {
    \ 'safe': 0
    \ })
]])

-- bind the minus key to show the file explorer in the dir of the current open
-- buffer's file
map('n', '-', ':VimFilerBufferDir<CR>', noremap)
map('n', '<Leader>r', ':Ranger<CR>', noremap)

-- ============= ripgrep ======================

g.ackprg = 'rg --vimgrep --no-heading'

cmd [[ cnoreabbrev Ack Ack! ]]

map('n', '<Leader>a', ':Ack!<Space>', noremap)
map('n', '<Leader>A', ':Ack!<CR>', noremap)

-- =============== FZF =======================

-- Customize fzf colors to match your color scheme
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

-- This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_sink = 'e'

-- floating window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

-- Enable per-command history.
-- CTRL-N and CTRL-P will be automatically bound to next-history and
-- previous-history instead of down and up. If you don't like the change,
-- explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
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


-- ================= vim-test =====================

nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

let g:test#preserve_screen = 1
let test#neovim#term_position = "vert"
let test#vim#term_position = "vert"

let g:test#javascript#mocha#file_pattern = '\v.*_test\.(js|jsx|ts|tsx)$'

if exists('$TMUX')
  -- Use tmux to kick off tests if we are in tmux currently
  let test#strategy = 'vimux'
else
  -- Fallback to using terminal split
  let test#strategy = "neovim"
endif

let test#enabled_runners = ["lua#busted", "ruby#rspec"]

let test#custom_runners = {}
let test#custom_runners['ruby'] = ['rspec']
let test#custom_runners['lua'] = ['busted']


-- ================= Editing plugins ==============

let splitjoin_ruby_curly_braces = 0
let splitjoin_ruby_hanging_args = 0

-- vim-signature
-- highlight marks dynamically based on vim-gitgutter's status
let g:SignatureMarkTextHLDynamic = 1


-- =============== version control ================

-- Every time you open a git object using fugitive it creates a new buffer.
-- This means that your buffer listing can quickly become swamped with
-- fugitive buffers. This prevents this from becomming an issue:
autocmd BufReadPost fugitive://* set bufhidden=delete

vnoremap <leader>g :GBrowse!<CR>

nnoremap <space>gb :Gblame<CR>
nnoremap <space>gs :Gstatus<CR>

-- Map git-messenger
let g:git_messenger_no_default_mappings = v:true
nmap <space>gm <Plug>(git-messenger)

-- ==================== LSP ======================

set completeopt=menu,menuone,noselect

call luaeval('require("lspservers")')

-- nnoremap <silent> gh :Lspsaga lsp_finder<CR>
-- nnoremap <silent>K :Lspsaga hover_doc<CR>

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

-- =================== ALE =======================

-- ALE config
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

let g:ale_sign_error = '●' -- Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_disable_lsp = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "      "

map('n', 'gj', ':ALENext<cr>', noresilent)
map('n', 'gk', ':ALEPrevious<cr>', noresilent)
-- nnoremap <silent> gj :ALENext<cr>
-- nnoremap <silent> gk :ALEPrevious<cr>

-- =================== Ruby =====================

cmd ([[
function! FlipBindingPry()
  if getline('.') =~? "^\s*require 'pry'; binding\.pry\s*$"
    normal dd
  else
    normal orequire 'pry'; binding.pry
  endif

  write
endfunction
]])

map('n', '<Leader>d', ':call FlipBindingPry()<CR>', {noremap=true})
-- nnoremap <leader>d :call FlipBindingPry()<CR>

-- ================== treesitter =================

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}

-- ================== status line ================
require('statusline')

-- ================== snippets ==================

-- inoremap <silent><expr> <CR>      compe#confirm('<CR>')

let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsEditSplit = "vertical"

require('custom_snippets')

-- ================= which key ==================
require('which-key')

-- ================= Stripe ======================

-- Load Stripe-specific private config
-- call SourceIfExists('~/.config/nvim/layers/private/config.vim')

-- ================= molleweide ======================

-- Load molleweide configs
require('molw.config')

-- call SourceIfExists('~/.config/nvim/layers/no-plugins.vim')
