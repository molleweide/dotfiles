" vim help file configs

if has('autocmd')
  function! ILikeHelpToTheRight()

    set relativenumber number

    if !exists('w:help_is_moved') || w:help_is_moved != "right"
      wincmd L
      let w:help_is_moved = "right"
    endif

  endfunction

  augroup HelpPages
    " autocmd FileType help nested call ILikeHelpToTheRight()
    " autocmd BufRead,BufEnter */doc/* :set relativenumber number
    autocmd BufRead,BufEnter */doc/* nested call ILikeHelpToTheRight()
  augroup END
endif
