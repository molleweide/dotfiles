let g:rails_projections = {
      \   "app/lib/*.rb": {
      \     "test": [
      \       "spec/lib/{}_spec.rb"
      \     ]
      \   }
      \ }

let g:ruby_host_prog = 'neovim-ruby-host'

function! FlipBindingPry()
  if getline('.') =~? '^\s*binding\.pry\s*$'
    normal dd
  else
    normal obinding.pry
  endif
  write
endfunction

nnoremap <leader>d :call FlipBindingPry()<CR>
