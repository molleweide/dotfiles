export PYTHON_CONFIGURE_OPTS="--enable-framework"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# To use Homebrew's directories rather than ~/.pyenv add to your profile:
export PYENV_ROOT=/usr/local/var/pyenv

# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
