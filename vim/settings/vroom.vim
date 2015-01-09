let g:vroom_map_keys = 0
let g:vroom_write_all = 1
let g:vroom_use_zeus = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_use_dispatch = 0

" Setup vimux so vroom dispatches in the side Terminal panel
let g:vroom_clear_screen = 0
let g:vroom_use_vimux = 1

let g:dispatch_compilers = {
      \ 'bundle exec': '',
      \ 'clear;': '',
      \ 'zeus': ''}

map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>
map <leader>/ :Copen!<cr>
map <silent> <leader>i :let g:vroom_use_dispatch = !g:vroom_use_dispatch<cr>
autocmd BufNewFile,BufRead *_spec.coffee map <buffer> <leader>t :w<cr>:!zeus teaspoon %<cr>
autocmd BufNewFile,BufRead *_spec.js map <buffer> <leader>t :w<cr>:!zeus teaspoon %<cr>
