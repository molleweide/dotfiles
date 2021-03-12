# BALATERO MOLLEWEIDE TODO

this is great because now i can start to work shit out on my main laptop.


#pyenv

https://github.com/pyenv/pyenv/issues/1746
https://github.com/pyenv/pyenv/issues/1643
https://github.com/pyenv/pyenv/issues/1764
https://stackoverflow.com/questions/50036091/pyenv-zlib-error-on-macos
https://koji-kanao.medium.com/install-python-3-8-0-via-pyenv-on-bigsur-b4246987a548


- $ `CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.8.6`

- @xpe I noticed you used -L in your CFLAGS, when I believe it should be -I. This led me to realize that I didn't even need to modify CFLAGS to make things work.
This worked for me on macOS Big Sur 11.1 and Homebrew for python 3.7, 3.8, and 3.9:
`brew install pyenv bzip2
LDFLAGS="\                      
-L$(brew --prefix zlib)/lib \
-L$(brew --prefix bzip2)/lib \
" pyenv install 3.9.0`

- 

# default branches
set default branches on github >> molleweide

# wp
    tfab


# convert subdir into git module
https://gist.github.com/amomin/b0df11ac4607f15203ac
https://x3ro.de/integrating-a-submodule-into-the-parent-repository/
https://stackoverflow.com/questions/17413493/create-a-submodule-repository-from-a-folder-and-keep-its-git-commit-history
https://stackoverflow.com/questions/51142835/convert-sub-folder-into-separate-project-without-losing-history?noredirect=1&lq=1
https://stackoverflow.com/questions/12514197/convert-a-git-folder-to-a-submodule-retrospectively?noredirect=1&lq=1
https://stackoverflow.com/questions/1365541/how-to-move-files-from-one-git-repo-to-another-not-a-clone-preserving-history?noredirect=1&lq=1
https://stackoverflow.com/questions/21205297/splitting-out-a-sub-directory-in-a-git-repo-into-its-own-repo?noredirect=1&lq=1
https://stackoverflow.com/questions/30325758/git-conversion-of-a-subdirectory-to-a-submodule

# ranger

create installer / symlink configs

# ask layers question on reddit

# karabiner is not responding fast enough 
with dual keys

# i need to learn how to switch color themes.
1. preserve balateros theme
2. add dracula
3. create pitch-black theme for very dark place

# TMUX ???
installer/tmux add tmuxinator to installer?????
were is it insalled wtf?!

# custom apps
vimac
limelight

# iterm 
how to import settings????

how does balateros git scripts work
symlink local repos/what i did???

# fonts
how would i manage and switch btw mult nerd fonts.
can i symlink iterm prefs?? > create this in installer/terminal

# chat

build signal messenger
build telegram?
0

# brwbisur
https://brew.sh/2020/12/01/homebrew-2.6.0/
