" use vim settings, rather then vi settings (much better!).
" this must be first, because it changes other options as a side effect.
set nocompatible

" =============== character fixes ====================

scriptencoding utf-8
set encoding=utf-8

" ================ general config ====================

set backspace=indent,eol,start  "allow backspace in insert mode
set history=1000                "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
set gcr=a:blinkon0              "disable cursor blink
set visualbell                  "no sounds
set autoread                    "reload files changed outside vim
set ruler                       "show ruler
set undolevels=1000             "undo levels
set laststatus=2                "fix status bar
set guifont=Inconsolata-g\ for\ Powerline
set number

" this makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" highlight funky characters and whatnot
set list
set listchars=tab:▸\ ,trail:ـ,extends:➧,eol:¬

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.

if has('persistent_undo')
  "silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       " Don't wrap lines
set linebreak    " Wrap lines at convenient points

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

let mapleader=","
let g:mapleader=","

" ================ Editing ==========================

" color column
set colorcolumn=81

" Open splits to the right or below; more natural than the default
set splitright
set splitbelow


" ================ Plugins ==========================

call plug#begin('~/.config/nvim/plugins')

" Core
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File browser
Plug 'Shougo/vimfiler.vim'

" Languages
Plug 'tbastos/vim-lua'

" Theming
Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhartington/oceanic-next'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'benmills/vimux'

" Grep + load
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" ================ Theme ========================
set termguicolors
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" enable transparent terminal bg
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

call luaeval('require("statusline")')

" =============== Tmux =========================

" set our shell to be bash for fast tmux switching times
" see: https://github.com/christoomey/vim-tmux-navigator/issues/72
set shell=/bin/bash\ --norc\ -i
let g:tmux_resizer_no_mappings = 0

" ============== File browser =================

let g:vimfiler_as_default_explorer = 1

call vimfiler#custom#profile('default', 'context', {
  \ 'safe': 0
  \ })

" bind the minus key to show the file explorer in the dir of the current open
" buffer's file
nnoremap - :VimFilerBufferDir<CR>

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
