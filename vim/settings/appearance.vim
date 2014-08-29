set t_Co=256
colorscheme grb256
set background=dark

if has("gui_running")
  " remove MacVim scrollbars
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L
endif

set t_ut=

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
