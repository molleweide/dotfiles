" color scheme
if has("termguicolors")
  set termguicolors
endif

set background=dark

silent! colorscheme solarized

" Hex color highlighting
au BufNewFile,BufRead *.css,*.html,*.htm,*.sass,*.scss :ColorHighlight!

" Airline
let g:airline_theme='molokai'
