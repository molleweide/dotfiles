function! ale#ale_error() abort
  return s:ale_string(0)
endfunction

function! ale#ale_warning() abort
  return s:ale_string(1)
endfunction

function! ale#ale_ok() abort
  return s:ale_string(2)
endfunction

function! s:ale_string(mode)
  if !exists('g:ale_buffer_info')
    return ''
  endif

  let l:buffer = bufnr('%')
  let l:counts = ale#statusline#Count(l:buffer)
  let [l:error_format, l:warning_format, l:no_errors] = g:ale_statusline_format

  if a:mode == 0 " Error
    let l:errors = l:counts.error + l:counts.style_error
    return l:errors ? printf(l:error_format, l:errors) : ''
  elseif a:mode == 1 " Warning
    let l:warnings = l:counts.warning + l:counts.style_warning
    return l:warnings ? printf(l:warning_format, l:warnings) : ''
  endif

  return l:no_errors
endfunction

augroup AleGroup
  autocmd!
  autocmd User ALELint call TouchOpenFile()
augroup END

func! TouchOpenFile()
  let g:ale_enabled = 0
  sleep 500m
  w
  let g:ale_enabled = 1
endfunc
