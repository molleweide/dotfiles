# main MB pro big sur pyenv build fail


https://github.com/dbalatero/dotfiles/issues/7

macos 11.2.3 (big sur)
xcode-select version 2384
xcode 12.4

I ran this command
pyenv install --patch x.x.x < (curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1 | psub)
taken from this thread
pyenv/pyenv#1643 (comment)
and it solved my problems
