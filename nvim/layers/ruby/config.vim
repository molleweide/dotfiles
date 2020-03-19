function! FlipBindingPry()
  if getline('.') =~? '^\s*binding\.pry\s*$'
    normal dd
  else
    normal obinding.pry
  endif
  write
endfunction

nnoremap <leader>d :call FlipBindingPry()<CR>
