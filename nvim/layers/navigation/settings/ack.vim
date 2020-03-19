if !exists('g:stripe')
  if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
  elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  cnoreabbrev Ack Ack!

  nnoremap <Leader>a :Ack!<Space>
  nnoremap <Leader>A :Ack!<CR>
endif
