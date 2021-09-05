I am trying to get doom running on my new m1 mac.

There is trouble with python.

Should I post this under neovim/neovim instead?

## `nvim -- version`

```bash
--api-info     -- print msgpack-encoded api-metadata and exit
NVIM v0.6.0-dev+205-g9695691ee
Build type: Release
LuaJIT 2.1.0-beta3
Compiled by hjalmarjakobsson@airM1ht21

Features: +acl +iconv +tui
See ":help feature-compile"

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/opt/homebrew/Cellar/neovim/HEAD-9695691/share/nvim"
```

## `:healthcheck`

```nvim
## Python 2 provider (optional)
  - INFO: pyenv: Path: /Users/hjalmarjakobsson/.pyenv/libexec/pyenv
  - INFO: pyenv: Root: /Users/hjalmarjakobsson/.pyenv
  - WARNING: No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
  - ERROR: Python provider error:
    - ADVICE:
      - provider/pythonx: Could not load Python 2:
          /usr/bin/python2 does not have the "neovim" module. :help |provider-python|
          /usr/bin/python2.7 does not have the "neovim" module. :help |provider-python|
          python2.6 not found in search path or not executable.
          /usr/bin/python does not have the "neovim" module. :help |provider-python|
  - INFO: Executable: Not found

## Python 3 provider (optional)
  - INFO: pyenv: Path: /Users/hjalmarjakobsson/.pyenv/libexec/pyenv
  - INFO: pyenv: Root: /Users/hjalmarjakobsson/.pyenv
  - WARNING: No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
  - ERROR: Python provider error:
    - ADVICE:
      - provider/pythonx: Could not load Python 3:
          /opt/homebrew/bin/python3 does not have the "neovim" module. :help |provider-python|
          python3.10 not found in search path or not executable.
          /opt/homebrew/bin/python3.9 does not have the "neovim" module. :help |provider-python|
          python3.8 not found in search path or not executable.
          python3.7 not found in search path or not executable.
          python3.6 not found in search path or not executable.
          /usr/bin/python is Python 2.7 and cannot provide Python 3.
  - INFO: Executable: Not found
```

## `nvim -u NORC`

gives thes same healthcheck stats

## Actual behavior

checkhealth python 2 and 3 provider fails checki 

## expected behavior

On my previous Macbook pro with intel processor all checks pass

## pyenv

```bash
pyenv --version
pyenv 2.0.5

python -V
Python 2.7.16 # this seems to be the macos default, it has become obsolete/deprecated from what I understand 

>>> python -c "import neovim"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named neovim

```
