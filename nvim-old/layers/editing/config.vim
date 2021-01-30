" vim-test
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:test#preserve_screen = 1
let test#neovim#term_position = "vert"
let test#vim#term_position = "vert"

let g:test#javascript#mocha#file_pattern = '\v.*_test\.(js|jsx|ts|tsx)$'

if exists('$TMUX')
  " Use tmux to kick off tests if we are in tmux currently
  let test#strategy = 'vimux'
else
  " Fallback to using terminal split
  if has('nvim')
    let test#strategy = "neovim"
  else
    let test#strategy = "vimterminal"
  endif
endif

let test#enabled_runners = ["lua#busted", "ruby#rspec"]

let test#custom_runners = {}
let test#custom_runners['ruby'] = ['rspec']
let test#custom_runners['lua'] = ['busted']

" wildignore
set wildignore+=node_modules/*,bower_components/*,vendor/bundle/*,tmp/*

" highlight marks dynamically based on vim-gitgutter's status
let g:SignatureMarkTextHLDynamic = 1

let splitjoin_ruby_curly_braces = 0
let splitjoin_ruby_hanging_args = 0
