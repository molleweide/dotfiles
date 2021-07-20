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

-- ================ Plugins ==========================

cmd ([[
call plug#begin('~/.local/nvim/plugins')

-- Core
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Konfekt/vim-alias'
Plug 'nanotee/nvim-lua-guide'         -- additional help under :h nvim-lua-guide
Plug 'liuchengxu/vim-which-key'       -- context menu when hitting leader key(s)
-- https://github.com/folke/which-key.nvim
Plug 'kevinhwang91/nvim-bqf'          -- better quickfix

-- Editing
Plug 'rhysd/clever-f.vim'             -- hit `f` to repeat search
Plug 'romgrk/nvim-treesitter-context' -- show function context as you scroll
Plug 'AndrewRadev/splitjoin.vim'      -- split/join single line/multiline
Plug 'AndrewRadev/switch.vim'         -- switch syntaxes around with `gs`
Plug 'tpope/vim-commentary'           -- comment with `gcc`
Plug 'romainl/vim-cool'               -- disable highlights automatically on cursor move
Plug 'easymotion/vim-easymotion'      -- ,,w and ,,b to jump to objects
Plug 'justinmk/vim-sneak'             --       should be even faster than easymotion
Plug 'tpope/vim-projectionist'        -- alternate files with :AV/:AS
Plug 'kshenoy/vim-signature'          -- show marks in the gutter
Plug 'itspriddle/vim-stripper'        -- strip whitespace on save
Plug 'tpope/vim-surround'             -- cs`' to change `` to '', etc
Plug 'milkypostman/vim-togglelist'    -- <leader>q to toggle quickfix
Plug 'tjdevries/cyclist.vim'          -- <leader>q to toggle quickfix
Plug 'mbbill/undotree'                -- visualize undo tree

-- Files
Plug 'danro/rename.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'rbgrouleff/bclose.vim'        -- Ranger dependency
Plug 'francoiscabrol/ranger.vim'
-- Plug 'justinmk/vim-dirvish'
-- Plug 'justinmk/vim-gtfo'

-- LSP
Plug 'neovim/nvim-lspconfig'             -- out of the box LSP configs for common langs
Plug 'glepnir/lspsaga.nvim'              -- code action plugin
Plug 'nvim-lua/lsp-status.nvim'          -- provides statusline information for LSP
Plug 'hrsh7th/nvim-compe'                -- completion engine
Plug 'onsails/lspkind-nvim'              -- add vscode-style icons to completion menu
Plug 'nathunsmitty/nvim-ale-diagnostic'  -- route lsp diagnostics to ALE

-- Lua
Plug 'nvim-lua/plenary.nvim'            -- only for nvim internal use

-- Json
Plug 'elzr/vim-json'

-- Markdown
-- Plug 'plasticboy/vim-markdown'                -- fucks up syntax hl...
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}  -- markdown preview with :Glow

-- Ruby
Plug 'keith/rspec.vim'                    -- better RSpec syntax highlighting
Plug 'jgdavey/vim-blockle'                -- toggle block styles with ,b
Plug 'tpope/vim-rake'                     -- allow for alternate files
Plug 'vim-ruby/vim-ruby'                  -- indentation, etc
Plug 'joker1007/vim-ruby-heredoc-syntax'  -- fenced syntax colors in heredocs
Plug 'ecomba/vim-ruby-refactoring'        -- extract vars, methods, etc

-- Haskell
-- https://github.com/neovimhaskell/nvim-hs
-- https://github.com/neovimhaskell/haskell-vim
-- https://github.com/eagletmt/neco-ghc
-- https://github.com/alx741/yesod.vim

-- Lisp
Plug 'vlime/vlime', {'rtp': 'vim/'}       -- sbcl --load <your bundle dir>/vlime/lisp/start-vlime.lisp
Plug 'lisp-mirror/quicklisp.nvim'
Plug 'tami5/lispdocs.nvim'

-- Pandoc | these two mess up the syntax highlighting...
-- Plug 'vim-pandoc/vim-pandoc'
-- Plug 'vim-pandoc/vim-pandoc-syntax'

-- Snippets
Plug 'norcalli/snippets.nvim'
Plug 'SirVer/UltiSnips'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'honza/vim-snippets'
Plug 'craigmac/vim-vsnip-snippets'

-- Syntax checking
Plug 'w0rp/ale'

-- Tests
Plug 'janko-m/vim-test'

-- Theming
Plug 'chrisbra/Colorizer'            -- show hex colors in CSS/HTML files
Plug 'glepnir/galaxyline.nvim'       -- fast Lua statusline
Plug 'kyazdani42/nvim-web-devicons'  -- fancy icons
Plug 'RRethy/vim-illuminate'         -- highlight duplicate words
Plug 'drzel/vim-line-no-indicator'   -- nice scroll indicator
Plug 'sheerun/vim-polyglot'

-- Color Schemes
Plug 'tjdevries/colorbuddy.vim'
Plug 'bkegley/gloombuddy'

Plug 'NieTiger/halcyon-neovim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'bluz71/vim-nightfly-guicolors'

-- Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'benmills/vimux'

-- Grep + load
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

-- Version control
Plug 'rhysd/git-messenger.vim'  -- show commit popup with <leader>gm
Plug 'tpope/vim-fugitive'       -- the git plugin
Plug 'airblade/vim-gitgutter'   -- show changed line marks in gutter
Plug 'tpope/vim-rhubarb'        -- enable GHE/Github links with :Gbrowse

-- Vimscript
Plug 'tpope/vim-scriptease'

-- Tabular data
Plug 'godlygeek/tabular'
Plug 'vim-scripts/excel.vim'
Plug 'kjnh10/ExcelLikeVim'

-- Misc
Plug 'mhinz/vim-startify'             -- custom startup display
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } } -- supercollider front end
Plug 'tjdevries/train.nvim'           -- vim motion practice game
Plug 'rajasegar/vim-search-web'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'KabbAmine/vCoolor.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jez/vim-superman'
Plug 'vimwiki/vimwiki'
Plug 'folke/todo-comments.nvim'       -- looks really nice

-- Bin
-- https://github.com/akinsho/nvim-toggleterm.lua
-- https://github.com/romgrk/barbar.nvim
-- https://github.com/ray-x/go.nvim
-- https://github.com/stevearc/aerial.nvim
-- https://github.com/ggandor/lightspeed.nvim
-- https://github.com/marko-cerovac/material.nvim
-- https://github.com/AckslD/nvim-anywise-reg.lua
-- https://github.com/tversteeg/registers.nvim
-- https://github.com/datwaft/bubbly.nvim
-- https://github.com/jiangmiao/auto-pairs
-- https://github.com/vhyrro/neorg

-- Load private Stripe overlay packages
-- call SourceIfExists('~/.config/nvim/layers/private/packages.vim')

call plug#end()
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
