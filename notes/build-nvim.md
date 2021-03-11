# BUILD NVIM

# questions

- FIRST
  look at balatero.  what does his commit msgs look like

- how do I start using nvim after building it.
    this is the first time I build neovim.
    i have been using brew install in the paste
    `which nvim =/usr/local/bin/nvim`

# build guide

build guide : https://github.com/neovim/neovim/wiki/Building-Neovim

read treesitter : https://github.com/nvim-treesitter/nvim-treesitter

# pre reqs

- installer/neovim/
    add preqeq install func


# bugs

abi version mismatch 

https://github.com/nvim-treesitter/nvim-treesitter/issues/994

treesitter workaround: https://github.com/neovim/neovim/issues/14044#issuecomment-790242256

Workaround for homebrew users:

1. Uninstall tree-sitter@0.19.1 ignoring neovim dependency.
`brew uninstall tree-sitter --ignore-dependencies`

2. Extract the formula from tree-sitter@0.18.3.
`brew extract --version=0.18.3 tree-sitter homebrew/cask`

3. Install the tree-sitter 0.18.3 (will compile everything)
`brew install tree-sitter@0.18.3`

4. And, for now, pin the tree-sitter version to 0.18.3.
`brew pin tree-sitter`

