" expand visual region
map J <Plug>(expand_region_expand)
map K <Plug>(expand_region_shrink)

" vim-test
if !exists('g:stripe')
  nmap <silent> <leader>T :TestNearest<CR>
  nmap <silent> <leader>t :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <leader>l :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>

  let test#strategy = 'vimux'
  let g:test#preserve_screen = 1
  let g:test#javascript#mocha#file_pattern = '\v.*_test\.(js|jsx|ts|tsx)$'
endif

let test#enabled_runners = ["ruby#rspec"]
let test#custom_runners = {}
let test#custom_runners['ruby'] = ['rspec']

" color column
set colorcolumn=81

" Open splits to the right or below; more natural than the default
set splitright
set splitbelow

" wildignore
set wildignore+=node_modules/*,bower_components/*,vendor/bundle/*,tmp/*

" highlight marks dynamically based on vim-gitgutter's status
let g:SignatureMarkTextHLDynamic = 1

let splitjoin_ruby_curly_braces = 0
let splitjoin_ruby_hanging_args = 0

" goyo + limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
