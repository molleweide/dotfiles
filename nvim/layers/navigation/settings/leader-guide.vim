let g:lmap =  {}

let g:lmap.c = {
  \'name' : 'Commenting',
  \'s' : [':Commentary<CR>', 'comment a section'],
  \'l' : [':CommentaryLine<CR>', 'comment a line'],
  \}

let g:lmap.g = {
  \'name' : 'Git Menu',
  \'s' : ['Gstatus', 'Git Status'],
  \'p' : ['Gpull',   'Git Pull'],
  \'u' : ['Gpush',   'Git Push'],
  \'c' : ['Gcommit', 'Git Commit'],
  \'w' : ['Gwrite',  'Git Write'],
  \}

let g:lmap.l = {
  \'name': 'Language Client',
  \'d': [':call LanguageClient#textDocument_definition()', 'Jump to definition'],
  \'h': [':call LanguageClient#textDocument_hover()', 'Hover'],
  \'m': [':call LanguageClient_contextMenu()', 'Context menu'],
  \'r': [':call LanguageClient#textDocument_rename()', 'Rename symbol'],
  \}

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <Space> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <Space> :<c-u>LeaderGuideVisual '<Space>'<CR>
