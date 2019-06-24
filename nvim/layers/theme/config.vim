" color scheme
if has("termguicolors")
  set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Hex color highlighting
au BufNewFile,BufRead *.css,*.html,*.htm,*.sass,*.scss :ColorHighlight!

let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ],
      \   'right': [
      \     ['lineinfo'],
      \     ['percent'],
      \     ['ale_error', 'ale_warning', 'ale_ok', 'fileformat', 'fileencoding', 'filetype']
      \   ]
      \ },
      \ 'component_function_visible_condition': {
      \   'mode': 1,
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'component_expand': {
      \   'ale_error':   'ale#ale_error',
      \   'ale_warning': 'ale#ale_warning',
      \   'ale_ok':      'ale#ale_ok',
      \ },
      \ 'component_type': {
      \   'ale_error':   'error',
      \   'ale_warning': 'warning',
      \   'ale_ok':      'ok',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

augroup LightLineOnALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

augroup LightlineColorscheme
	autocmd!
	autocmd ColorScheme * call s:lightline_update()
augroup END
function! s:lightline_update()
	if !exists('g:loaded_lightline')
		return
	endif
	try
		if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|seoul256\|Tomorrow'
			let g:lightline.colorscheme =
						\ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
			call lightline#init()
			call lightline#colorscheme()
			call lightline#update()
		endif
	catch
	endtry
endfunction

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')

  return fname =~ 'FZF' ? 'FZF filter' :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? expand('%') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
