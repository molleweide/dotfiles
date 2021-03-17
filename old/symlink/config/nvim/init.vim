set encoding=utf-8

" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

" ============================================================================ "

call plug#begin('~/.config/nvim/plugged')

" " Base bundles
" Bundle 'gmarik/vundle'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-repeat'


" === Editing Plugins === "
Plug 'ntpeters/vim-better-whitespace'   " Trailing whitespace highlighting & automatic fixing
Plug 'rstacruz/vim-closer'              " auto-close plugin
Plug 'easymotion/vim-easymotion'    " Improved motion in Vim

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'   " Tmux/Neovim movement integration

Plug 'm-pilia/vim-ccls'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'rhysd/vim-clang-format'


Plug 'Shougo/denite.nvim'               " Denite - Fuzzy finding, buffer management
" Plugin 'Yggdroot/LeaderF'             " another fuzzy finder

Plug 'Shougo/neosnippet'            " Snippet suppo t
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/echodoc.vim'           " Print function signatures in echo area
Plug 'mattn/emmet-vim'              " Emmet
Plug 'terryma/vim-multiple-cursors' " sublime style

" === Git Plugins === "
Plug 'mhinz/vim-signify'            " Enable git changes to be shown in sign column
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'


Plug 'tpope/vim-eunuch' " adds sugar for shell commands

" === Javascript Plugins === "
Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax highlighting
Plug 'elzr/vim-json'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'        " Generate JSDoc commands based on function signature
Plug 'lervag/vimtex'

" === Syntax Highlighting & Autocomplete === "

" Plug 'vim-scripts/IndentAnything'
Plug 'chr4/nginx.vim'               " Syntax highlighting for nginx
Plug 'othree/javascript-libraries-syntax.vim' " Syntax highlighting for javascript libraries
Plug 'othree/yajs.vim'              " Improved syntax highlighting and indentation
Plug 'sheerun/vim-polyglot'

" === UI === "
Plug 'scrooloose/nerdtree' " File explorer
Plug 'mhartington/oceanic-next' " Colorscheme
Plug 'vim-airline/vim-airline' " Customized vim status line
Plug 'vim-airline/vim-airline-themes'


" === Work & Productivity Plugins === "
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Markdown preview in browser | https://github.com/iamcco/markdown-preview.nvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Firemvim | https://github.com/glacambre/firenvim#using-a-single-neovim-instance
Plug 'jceb/vim-orgmode'

" File browser
" Bundle 'octref/RootIgnore'
Plug 'rbgrouleff/bclose.vim'        " Ranger dependency
Plug 'francoiscabrol/ranger.vim'

" Note taking, docs, todo lists
" Plug 'vimwiki/vimwiki'

" " Search and utilities
" https://github.com/airblade/vim-rooter
Plug 'airblade/vim-rooter'
" https://github.com/christoomey/vim-system-copy
Plug 'christoomey/vim-system-copy'
"
" " Appearance
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'joshdick/onedark.vim' " colorscheme


" " Text editing
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-sort-motion'


" Icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Misc
Plug '7kfpun/finance.vim'
Plug 'mattn/webapi-vim'                         " dep.

" Initialize plugin system
call plug#end()

" ============================================================================ "
" ===                               SOURCING                               === "
" ============================================================================ "

source ~/.config/nvim/settings/general.vim

source ~/.config/nvim/settings/setup.vim

source ~/.config/nvim/settings/keys.vim

source ~/.config/nvim/settings/appearance.vim

source ~/.config/nvim/settings/misc.vim


