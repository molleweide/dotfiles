" using a fork of supertab to fix a bug
" https://github.com/ervandew/supertab/issues/185

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'metalelf0/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" add fenced context for completion (i.e. JS inside an html file, etc)
Plug 'Shougo/context_filetype.vim'
