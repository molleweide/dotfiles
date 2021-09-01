# NEOVIM

- create custom operator https://stackoverflow.com/questions/8994276/how-to-define-a-new-vim-operator-with-a-parameter

- https://github.com/neovim/nvimdev.nvim
- https://github.com/tweekmonster/helpful.vim


- nvim faq https://github.com/neovim/neovim/wiki/FAQ#why-embed-lua-instead-of-x

# PLUGINS

## NEW PLUGINS

https://github.com/mhinz/vim-startify

## PLUGIN DEV

1. do this !! https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua
2. cont. read https://learnvimscriptthehardway.stevelosh.com/chapters/43.html
https://sbulav.github.io/vim/neovim-writing-lua-plugins/
https://dev.to/christalib/how-i-wrote-my-first-neovim-plugin-357h


## USE MULTIPLE NVIM

https://www.reddit.com/r/neovim/comments/gkpywv/use_the_stable_and_the_nightly/



# BUILD NVIM ------------------------------------------------

now i am testing using colemak with this new setup that i am usingon
the main laptop. this shouldn't be a issue at al right. it works on the
big one and so it should also work on the old one. theonly problem
on he main laptop was that treesitter was not working and this seems
to b a standard issue whch everyone seems to have sold

## questions

- FIRST
    look at balatero.  what does his commit msgs look like

- how do I start using nvim after building it.
    this is the first time I build neovim.
    i have been using brew install in the paste
    `which nvim =/usr/local/bin/nvim`

## build guide

build guide : https://github.com/neovim/neovim/wiki/Building-Neovim

read treesitter : https://github.com/nvim-treesitter/nvim-treesitter

## pre reqs

- installer/neovim/
    add preqeq install func

## COLOR SCHEMES

modify nightfly -> rainforest sunset. orange and green colors.
        something that really sticks out so that it feels crazy

- rainforest
- atlantis underwater >> colorscheme inspired by freddy fish game


## BUGS

abi version mismatch 

https://github.com/nvim-treesitter/nvim-treesitter/issues/994

treesitter workaround: https://github.com/neovim/neovim/issues/14044#issuecomment-790242256

First try

`:TSInstallFromGrammar all`

Workaround for homebrew users:

1. Uninstall tree-sitter@0.19.1 ignoring neovim dependency.
`brew uninstall tree-sitter --ignore-dependencies`

2. Extract the formula from tree-sitter@0.18.3.
`brew extract --version=0.18.3 tree-sitter homebrew/cask`

3. Install the tree-sitter 0.18.3 (will compile everything)
`brew install tree-sitter@0.18.3`

4. And, for now, pin the tree-sitter version to 0.18.3.
`brew pin tree-sitter`

