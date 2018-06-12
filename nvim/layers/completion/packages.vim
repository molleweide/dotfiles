" function! BuildYCM(info)
"   " info is a dictionary with 3 fields
"   " - name:   name of the plugin
"   " - status: 'installed', 'updated', or 'unchanged'
"   " - force:  set on PlugInstall! or PlugUpdate!
"   if a:info.status == 'installed' || a:info.force
"     execute "!" . g:python3_host_prog . " ./install.py"
"   endif

"   if a:info.status != 'unchanged' || a:info.force
"     !(cd YouCompleteMe/third_party/ycmd/third_party/tern_runtime && npm install --production)
"   endif
" endfunction

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" using a fork of supertab to fix a bug
" https://github.com/ervandew/supertab/issues/185
Plug 'metalelf0/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" add fenced context for completion (i.e. JS inside an html file, etc)
Plug 'Shougo/context_filetype.vim'
