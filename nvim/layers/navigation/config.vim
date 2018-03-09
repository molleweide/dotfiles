runtime layers/navigation/settings/ack.vim
runtime layers/navigation/settings/fzf.vim
runtime layers/navigation/settings/leader-guide.vim

let g:vimfiler_as_default_explorer = 1

let g:gutentags_file_list_command = 'git ls-files'
let g:gutentags_project_root = ['.gutentag']
let g:gutentags_ctags_exclude = ['node_modules', 'tmp', '.cache',
      \ 'coverage',
      \ 'vendor/bundle',
      \ 'public/packs',
      \ 'public/packs-test',
      \ ]
