" =============== vim-plug Initialization ===============

call plug#begin('~/.local/share/nvim/plugged')

for fpath in split(globpath('~/.config/nvim/layers', '**/packages.vim'), '\n')
  exe 'source' fpath
endfor

call plug#end()

for fpath in split(globpath('~/.config/nvim/layers', '**/config.vim'), '\n')
  exe 'source' fpath
endfor

" Load any Lua configs
for fpath in split(globpath('~/.config/nvim/layers', '**/config.lua'), '\n')
  exe 'luafile' fpath
endfor
