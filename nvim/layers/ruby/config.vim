function! FlipBindingPry()
  if getline('.') =~? "^\s*require 'pry'; binding\.pry\s*$"
    normal dd
  else
    normal orequire 'pry'; binding.pry
  endif

  write
endfunction

nnoremap <leader>d :call FlipBindingPry()<CR>
