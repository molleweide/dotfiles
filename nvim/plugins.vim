call plug#begin('~/.local/share/nvim/plugged')

""""""""
" Color schemes + appearance
""""""""
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'chriskempson/base16-vim'


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
Plug 'digitaltoad/vim-pug'
Plug 'sbdchd/neoformat'

Plug 'tomlion/vim-solidity'

"" Elixir
Plug 'elixir-lang/vim-elixir'

"" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
Plug 'Keithbsmiley/rspec.vim'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'tpope/vim-bundler'
" Plug 'skalnik/vim-vroom'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'slim-template/vim-slim'
Plug 'joker1007/vim-ruby-heredoc-syntax'

" Required for vim-ruby-heredoc-syntax...
Plug 'kchmck/vim-coffee-script'

Plug 'cakebaker/scss-syntax.vim'

" Dear god
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'vim-scripts/applescript.vim'

"""""""""
" Git
"""""""""
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'

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
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'

""""""
" Search
""""""

Plug 'mileszs/ack.vim'
Plug 'vim-scripts/IndexedSearch'
Plug 'nelstrom/vim-visual-star-search'
Plug 'skwp/greplace.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Peeja/vim-cdo'

""""""
" Vim improvements
""""""
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py && YouCompleteMe/third_party/ycmd/third_party/tern_runtime && npm install --production' }
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
Plug 'yegappan/greplace'
Plug 'w0rp/ale'

" Load this last
Plug 'ryanoasis/vim-devicons'

call plug#end()
