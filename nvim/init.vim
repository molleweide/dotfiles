" TODO
" - ultisnips?

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

" stop kicking me into this mode you fucking apes
set noexrc
set noex
set nosecure

" minimum width
set winwidth=100

" Put contents of unnamed register in OS X clipboard
set clipboard=unnamed

" remap ESC to jk
inoremap jk <esc>

"Clear current search highlight by hitting g + /
nmap <silent> g/ :nohlsearch<CR>


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

" =============== mouse =====================
set mouse=n

" =============== python ====================

let g:python_host_prog = $HOME . '/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/py3neovim/bin/python'

" ================ Editing ==========================

" color column
set colorcolumn=81

" Open splits to the right or below; more natural than the default
set splitright
set splitbelow

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

" remap : to ;
nnoremap ; :

" background out of insert mode
inoremap <C-Z> <Esc><C-Z>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Load aliases for :vh -> :vertical h
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

" wildignore
set wildignore+=node_modules/*,bower_components/*,vendor/bundle/*,tmp/*

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

call plug#begin('~/.config/nvim/plugins')

" Core
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Konfekt/vim-alias'

" Editing
Plug 'rhysd/clever-f.vim'             " hit `f` to repeat search
Plug 'romgrk/nvim-treesitter-context' " show function context as you scroll
Plug 'AndrewRadev/splitjoin.vim'      " split/join single line/multiline
Plug 'AndrewRadev/switch.vim'         " switch syntaxes around with `gs`
Plug 'tpope/vim-commentary'           " comment with `gcc`
Plug 'easymotion/vim-easymotion'      " ,,w and ,,b to jump to objects
Plug 'tpope/vim-projectionist'        " alternate files with :AV/:AS
Plug 'kshenoy/vim-signature'          " show marks in the gutter
Plug 'itspriddle/vim-stripper'        " strip whitespace on save
Plug 'tpope/vim-surround'             " cs`' to change `` to '', etc
Plug 'milkypostman/vim-togglelist'    " <leader>q to toggle quickfix

" Files
Plug 'danro/rename.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'

" LSP
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'cb372/coc-github-users', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-lua', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

" Ruby
Plug 'keith/rspec.vim'                    " better RSpec syntax highlighting
Plug 'jgdavey/vim-blockle'                " toggle block styles with ,b
Plug 'tpope/vim-rake'                     " allow for alternate files
Plug 'vim-ruby/vim-ruby'                  " indentation, etc
Plug 'joker1007/vim-ruby-heredoc-syntax'  " fenced syntax colors in heredocs
Plug 'ecomba/vim-ruby-refactoring'        " extract vars, methods, etc

" Syntax checking
Plug 'w0rp/ale'

" Tests
Plug 'janko-m/vim-test'

" Theming
Plug 'chrisbra/Colorizer'            " show hex colors in CSS/HTML files
Plug 'glepnir/galaxyline.nvim'       " fast Lua statusline
Plug 'kyazdani42/nvim-web-devicons'  " fancy icons
Plug 'RRethy/vim-illuminate'         " highlight duplicate words
Plug 'drzel/vim-line-no-indicator'   " nice scroll indicator
Plug 'sheerun/vim-polyglot'

" color schemes
Plug 'tjdevries/colorbuddy.vim'
Plug 'bkegley/gloombuddy'

Plug 'NieTiger/halcyon-neovim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'benmills/vimux'

" Grep + load
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Version control
Plug 'rhysd/git-messenger.vim'  " show commit popup with <leader>gm
Plug 'tpope/vim-fugitive'       " the git plugin
Plug 'airblade/vim-gitgutter'   " show changed line marks in gutter
Plug 'tpope/vim-rhubarb'        " enable GHE/Github links with :Gbrowse

" Vimscript
Plug 'tpope/vim-scriptease'

" Load private Stripe overlay packages
call SourceIfExists('~/.config/nvim/layers/private/packages.vim')

call plug#end()


" ================ Theme ========================

set termguicolors
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
colorscheme palenight

" enable transparent terminal bg
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" setup galaxyline
call luaeval('require("statusline")')

" highlight hex colors in these file types
au BufNewFile,BufRead *.css,*.html,*.htm,*.sass,*.scss :ColorHighlight!

" =============== Tmux =========================

" set our shell to be bash for fast tmux switching times
" see: https://github.com/christoomey/vim-tmux-navigator/issues/72
set shell=/bin/bash\ --norc\ -i

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


" ==================== LSP ======================

" debugger enable
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']

let $NVIM_COC_LOG_LEVEL = 'debug'

" Use tab and shift+tab to navigate forward/back on completion list and
" snippets
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:coc_snippet_next = '<tab>'

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" make <cr> select the first completion item and confirm completion when no
" items have selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! g:CocShowDocumentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" don't give |ins-completion-menu| messages in the message buffer
set shortmess+=c

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

nmap <silent> gh :call CocShowDocumentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

" Apply AutoFix to problem on the current line.
nmap <silent> gf <Plug>(coc-fix-current)

" Show parameter hints as you type
autocmd User CocJumpPlaceholder call
  \ CocActionAsync(‘showSignatureHelp’)

" =================== ALE ========================

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

" ================= Stripe =====================

" Load Stripe-specific private config
call SourceIfExists('~/.config/nvim/layers/private/config.vim')
