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





#pyenv

https://github.com/pyenv/pyenv/issues/1746
https://github.com/pyenv/pyenv/issues/1643
https://github.com/pyenv/pyenv/issues/1764
https://stackoverflow.com/questions/50036091/pyenv-zlib-error-on-macos
https://koji-kanao.medium.com/install-python-3-8-0-via-pyenv-on-bigsur-b4246987a548

