" expand visual region
map J <Plug>(expand_region_expand)
map K <Plug>(expand_region_shrink)

" vim-test
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = 'vimux'
let g:test#preserve_screen = 1
