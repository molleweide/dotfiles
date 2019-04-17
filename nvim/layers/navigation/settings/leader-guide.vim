let g:lmap =  {}

let g:lmap.c = {
  \'name' : 'Commenting',
  \'s' : [':Commentary<CR>', 'comment a section'],
  \'l' : [':CommentaryLine<CR>', 'comment a line'],
  \}

let g:lmap.g = {
  \'name' : 'Git Menu',
  \'c' : ['Gcommit', 'Git Commit'],
  \'d' : ['Gdiff',   'Git diff'],
  \'p' : ['Gpull',   'Git Pull'],
  \'s' : ['Gstatus', 'Git Status'],
  \'u' : ['Gpush',   'Git Push'],
  \'w' : ['Gwrite',  'Git Write'],
  \}

let g:lmap.l = {
  \'name': 'Language Client',
  \'a': [':execute "normal \<Plug>(coc-fix-current)"', 'Autofix current line'],
  \'d': [':call CocShowDocumentation()"', 'Show documentation'],
  \'f': [':execute "normal \<Plug>(coc-format)"', 'Format current buffer'],
  \'i': [':execute "normal \<Plug>(coc-references)"', 'Jump to references'],
  \'j': [':execute "normal \<Plug>(coc-definition)"', 'Jump to definition'],
  \'r': [':execute "normal \<Plug>(coc-rename)"', 'Rename symbol'],
  \}

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <Space> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <Space> :<c-u>LeaderGuideVisual '<Space>'<CR>
