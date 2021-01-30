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
  \     ['indicator'],
  \     ['ale_error', 'ale_warning', 'ale_ok', 'fileformat', 'fileencoding', 'filetype', 'cocstatus']
  \   ]
  \ },
  \ 'component': {
  \   'indicator': '%{LineNoIndicator()}',
  \ },
  \ 'component_function_visible_condition': {
  \   'mode': 1,
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
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
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" barbar
nnoremap <silent> <C-s> :BufferPick<CR>
