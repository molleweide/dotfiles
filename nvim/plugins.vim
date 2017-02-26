call plug#begin('~/.local/share/nvim/plugged')

""""""""
" Color schemes + appearance
""""""""
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'jby/tmux.vim'

"""""""
" Languages
"""""""

"" JS
Plug 'othree/yajs.vim'
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript'] }
Plug 'moll/vim-node', { 'for': ['javascript'] }
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
Plug 'elzr/vim-json', { 'for': ['json'] }

"" Elixir
Plug 'elixir-lang/vim-elixir'

"" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
Plug 'Keithbsmiley/rspec.vim'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'tpope/vim-bundler'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-dispatch'

"""""""""
" Git
"""""""""
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

""""""
" Projects
""""""
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'FelikZ/ctrlp-py-matcher'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'tpope/vim-eunuch'
Plug 'benmills/vimux'

""""""
" Search
""""""

Plug 'rking/ag.vim'
Plug 'vim-scripts/IndexedSearch'
Plug 'nelstrom/vim-visual-star-search'
Plug 'skwp/greplace.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Peeja/vim-cdo'

""""""
" Vim improvements
""""""
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'keith/investigate.vim'
Plug 'bogado/file-line'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/sudo.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()
