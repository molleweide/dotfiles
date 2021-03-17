" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

set nocompatible
set shell=/bin/bash

syntax enable
syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Setup indent
filetype plugin indent on

" re-indent file
map <leader>i mzgg=G`z<CR>

" Tab through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Easier split switches
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier copy/paste
vnoremap p "_dP
nmap <leader>y <Plug>SystemCopy
xmap <leader>y <Plug>SystemCopy
nmap <leader>p <Plug>SystemPaste
nmap <leader>yy <Plug>SystemCopyLine
tnoremap <Esc> <C-\><C-n>

" Close buffer
nmap <leader>c :bd<CR>

" EasyMotion
let g:EasyMotion_do_mapping = 0
nmap <leader>j <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Enable gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_async = 0

" Airline setup
let g:airline_enable_hunks = 0

" if has('nvim')
"   runtime! python_setup.vim
" endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on
filetype plugin on

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" autocmd BufRead,BufNewFile *.md set spell

" disable arrowkeys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set relativenumber                              " Display relative and regular linenumber
set number

set foldmethod=indent                           " Folding method > indentation
set nofoldenable                                " prevent automatic folding on file load

" set foldclose=all                             " Automatic folding when moving out of fold
set noshowcmd                                   " Don't show last command ????????
set clipboard=unnamed                           " Yank and paste with the system clipboard
set hidden                                      " Hides buffers instead of closing them
set list                                        " show trailing whitespace set listchars=tab:▸\ ,trail:▫

set fileformat=unix

set shiftwidth=2 " Indentation amount for < and > commands.
" set nocursorline " Don't highlight current cursor line

"command! -nargs=* Wrap set wrap linebreak nolist
set nowrap " do not wrap long lines by default

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set cmdheight=1 " Only one line for command line

" === Completion Settings === "
set shortmess+=c " Don't give completion messages like 'match 1 of 2' or 'The only match'


set noruler
set cursorline " highlight cursor line and column
set cursorcolumn

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set directory-=.                                             " don't store swapfiles in the current directory
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=4                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set noshowmode
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
"set nobackup
"set nowritebackup
"set noswapfile
"set updatetime=300
"set shortmess+=c
set signcolumn=yes

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" Spaces and tabs
set tabstop=2
set softtabstop=2

" Update name of buffer to filename
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title
set exrc
set secure

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
"
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Fix fish issues
"set shell=sh
"set path=$PWD/**

" Fix problem with auto-close and esc
let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}
