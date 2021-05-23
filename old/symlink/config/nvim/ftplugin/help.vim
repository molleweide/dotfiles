" vim help file configs

set relativenumber number
" augroup helpfiles
"   au!
"   au BufRead,BufEnter */doc/* wincmd L
" augroup END

if has('autocmd')
  function! ILikeHelpToTheRight()
    if !exists('w:help_is_moved') || w:help_is_moved != "right"
      wincmd L
      " set relativenumber number
      let w:help_is_moved = "right"
    endif
  endfunction

  augroup HelpPages
    autocmd FileType help nested call ILikeHelpToTheRight()

    " this only shows number on enter window
    " autocmd BufNew * senumber relativenumber

  augroup END
endif
